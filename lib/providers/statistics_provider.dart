// lib/providers/statistics_provider.dart
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/statistics_data.dart';
import '../models/app_role.dart';

const String _statisticsKey = 'userStatistics';

class StatisticsNotifier extends StateNotifier<UserStatistics> {
  final Completer<void> _initializationCompleter = Completer<void>();

  StatisticsNotifier() : super(UserStatistics.empty()) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? statsJson = prefs.getString(_statisticsKey);
      if (statsJson != null) {
        state = UserStatistics.fromJson(jsonDecode(statsJson) as Map<String, dynamic>);
        if (kDebugMode) {
          print('Statistiken erfolgreich geladen für Schlüssel: $_statisticsKey');
        }
      } else {
        if (kDebugMode) {
          print('Keine Statistiken in SharedPreferences gefunden für Schlüssel: $_statisticsKey. Initialisiere leere Statistiken.');
        }
      }
    } catch (e, s) {
      if (kDebugMode) {
        print('Fehler beim Laden der Statistiken: $e');
        print('Stacktrace: $s');
      }
      state = UserStatistics.empty();
    } finally {
      _initializationCompleter.complete();
    }
  }

  Future<void> _waitForInitialization() async {
    if (!_initializationCompleter.isCompleted) {
      await _initializationCompleter.future;
    }
  }

  Future<void> _saveStatistics() async {
    await _waitForInitialization();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_statisticsKey, jsonEncode(state.toJson()));
      if (kDebugMode) {
        print('Statistiken erfolgreich gespeichert für Schlüssel: $_statisticsKey');
      }
    } catch (e, s) {
      if (kDebugMode) {
        print('Fehler beim Speichern der Statistiken: $e');
        print('Stacktrace: $s');
      }
    }
  }

  Future<void> addExamAttempt(AppRole role, ExamAttempt attempt) async {
    await _waitForInitialization();
    final currentExamHistory = Map<AppRole, List<ExamAttempt>>.from(state.examHistory);
    final roleHistory = List<ExamAttempt>.from(currentExamHistory[role] ?? []);
    roleHistory.add(attempt);
    currentExamHistory[role] = roleHistory;
    state = state.copyWith(examHistory: currentExamHistory);
    await _saveStatistics();
  }

  // Methode, um den Lernfortschritt einer Frage zu aktualisieren (NEUE SIGNATUR)
  Future<void> updateQuestionLearningProgress(
      AppRole role,
      int questionId,
      int achievedPointsInThisAttempt, // Erreichte Punkte für diese Frage in dieser Lernrunde
      int possiblePointsInThisAttempt   // Maximal mögliche Punkte für diese Frage (Anzahl Optionen)
      ) async {
    await _waitForInitialization();

    final currentLearningProgressAllRoles = Map<AppRole, Map<int, QuestionLearningProgress>>.from(state.learningProgress);
    final roleSpecificProgressMap = Map<int, QuestionLearningProgress>.from(currentLearningProgressAllRoles[role] ?? {});
    final questionProgress = roleSpecificProgressMap[questionId] ?? QuestionLearningProgress(questionId: questionId);

    questionProgress.timesEvaluated++;
    questionProgress.sumAchievedPoints += achievedPointsInThisAttempt;
    questionProgress.sumPossiblePoints += possiblePointsInThisAttempt;

    roleSpecificProgressMap[questionId] = questionProgress;
    currentLearningProgressAllRoles[role] = roleSpecificProgressMap;

    state = state.copyWith(learningProgress: currentLearningProgressAllRoles);
    await _saveStatistics();
  }

  Future<void> resetAllStatistics() async {
    await _waitForInitialization();
    state = UserStatistics.empty();
    await _saveStatistics();
  }

  Future<void> resetStatisticsForRole(AppRole role) async {
    await _waitForInitialization();
    final currentProgressAllRoles = Map<AppRole, Map<int, QuestionLearningProgress>>.from(state.learningProgress);
    final currentHistoryAllRoles = Map<AppRole, List<ExamAttempt>>.from(state.examHistory);

    currentProgressAllRoles.remove(role);
    currentHistoryAllRoles.remove(role);

    state = state.copyWith(
      learningProgress: currentProgressAllRoles,
      examHistory: currentHistoryAllRoles,
    );
    await _saveStatistics();
  }
}

final statisticsProvider = StateNotifierProvider<StatisticsNotifier, UserStatistics>((ref) {
  return StatisticsNotifier();
});
