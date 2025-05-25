// lib/providers/statistics_provider.dart
import 'dart:convert';
import 'dart:async'; // Import für Completer
import 'package:flutter/foundation.dart'; // Import für kDebugMode
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/statistics_data.dart';
import '../models/app_role.dart'; // Benötigt für Methoden-Signaturen

const String _statisticsKey = 'userStatistics';

class StatisticsNotifier extends StateNotifier<UserStatistics> {
  // Completer, um das Ende der Initialisierung (Laden der Daten) zu signalisieren.
  final Completer<void> _initializationCompleter = Completer<void>();

  StatisticsNotifier() : super(UserStatistics.empty()) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? statsJson = prefs.getString(_statisticsKey);
      if (statsJson != null) {
        // Versuche, die Statistiken aus JSON zu parsen
        state = UserStatistics.fromJson(jsonDecode(statsJson) as Map<String, dynamic>);
        if (kDebugMode) {
          print('Statistiken erfolgreich geladen für Schlüssel: $_statisticsKey');
        }
      } else {
        if (kDebugMode) {
          print('Keine Statistiken in SharedPreferences gefunden für Schlüssel: $_statisticsKey. Initialisiere leere Statistiken.');
        }
        // state ist bereits UserStatistics.empty() durch den super Konstruktor
      }
    } catch (e, s) {
      if (kDebugMode) {
        print('Fehler beim Laden der Statistiken: $e');
        print('Stacktrace: $s');
      }
      // Im Fehlerfall bleiben die Statistiken leer, um die App lauffähig zu halten.
      // state ist bereits UserStatistics.empty()
    } finally {
      // Signalisiere, dass die Initialisierung abgeschlossen ist, egal ob erfolgreich oder nicht.
      _initializationCompleter.complete();
    }
  }

  // Interne Methode, um auf den Abschluss der Initialisierung zu warten.
  Future<void> _waitForInitialization() async {
    if (!_initializationCompleter.isCompleted) {
      await _initializationCompleter.future;
    }
  }

  Future<void> _saveStatistics() async {
    // Es ist nicht zwingend notwendig, hier auf die Initialisierung zu warten,
    // da _saveStatistics immer den aktuellen 'state' speichert.
    // Aber es schadet auch nicht und stellt Konsistenz sicher, falls _saveStatistics
    // unerwartet früh aufgerufen würde.
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

  // Methode, um einen Prüfungsversuch hinzuzufügen
  Future<void> addExamAttempt(AppRole role, ExamAttempt attempt) async {
    await _waitForInitialization(); // Warten, bis das Laden abgeschlossen ist.

    final currentExamHistory = Map<AppRole, List<ExamAttempt>>.from(state.examHistory);
    final roleHistory = List<ExamAttempt>.from(currentExamHistory[role] ?? []);

    roleHistory.add(attempt);
    currentExamHistory[role] = roleHistory;

    // Stelle sicher, dass state eine neue Instanz ist, um Riverpod Updates zu triggern.
    state = state.copyWith(examHistory: currentExamHistory);
    await _saveStatistics();
  }

  // Methode, um den Lernfortschritt einer Frage zu aktualisieren
  Future<void> updateQuestionLearningProgress(AppRole role, int questionId, bool wasCorrect) async {
    await _waitForInitialization(); // Warten, bis das Laden abgeschlossen ist.

    final currentLearningProgress = Map<AppRole, Map<int, QuestionLearningProgress>>.from(state.learningProgress);
    final roleProgress = Map<int, QuestionLearningProgress>.from(currentLearningProgress[role] ?? {});
    final questionProgress = roleProgress[questionId] ?? QuestionLearningProgress(questionId: questionId);

    questionProgress.timesAttempted++;
    if (wasCorrect) {
      questionProgress.timesCorrect++;
    }
    roleProgress[questionId] = questionProgress;
    currentLearningProgress[role] = roleProgress;

    // Stelle sicher, dass state eine neue Instanz ist.
    state = state.copyWith(learningProgress: currentLearningProgress);
    await _saveStatistics();
  }

  // Methode zum Zurücksetzen aller Statistiken (optional)
  Future<void> resetAllStatistics() async {
    await _waitForInitialization(); // Warten, bis das Laden abgeschlossen ist.
    state = UserStatistics.empty();
    await _saveStatistics();
  }

  // Methode zum Zurücksetzen der Statistiken für eine bestimmte Rolle (optional)
  Future<void> resetStatisticsForRole(AppRole role) async {
    await _waitForInitialization(); // Warten, bis das Laden abgeschlossen ist.

    final currentProgressAllRoles = Map<AppRole, Map<int, QuestionLearningProgress>>.from(state.learningProgress);
    final currentHistoryAllRoles = Map<AppRole, List<ExamAttempt>>.from(state.examHistory);

    currentProgressAllRoles.remove(role);
    currentHistoryAllRoles.remove(role);

    // Stelle sicher, dass state eine neue Instanz ist.
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
