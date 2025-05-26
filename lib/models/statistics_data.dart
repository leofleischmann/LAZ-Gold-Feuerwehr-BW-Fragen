// lib/models/statistics_data.dart
import 'dart:convert'; // Für jsonEncode und jsonDecode
import 'app_role.dart';

// Datenmodell für das Ergebnis einer einzelnen Prüfungssimulation
class ExamAttempt {
  final DateTime date;
  final int totalPossiblePoints;
  final int achievedPoints;
  final AppRole role;

  ExamAttempt({
    required this.date,
    required this.totalPossiblePoints,
    required this.achievedPoints,
    required this.role,
  });

  double get percentage => totalPossiblePoints > 0 ? (achievedPoints / totalPossiblePoints) * 100 : 0.0;
  bool get passed => percentage >= 75.0;

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'totalPossiblePoints': totalPossiblePoints,
    'achievedPoints': achievedPoints,
    'role': role.toString(),
  };

  factory ExamAttempt.fromJson(Map<String, dynamic> json) => ExamAttempt(
    date: DateTime.parse(json['date'] as String),
    totalPossiblePoints: json['totalPossiblePoints'] as int,
    achievedPoints: json['achievedPoints'] as int,
    role: AppRole.values.firstWhere((e) => e.toString() == json['role'], orElse: () => AppRole.mannschaft),
  );
}

// Datenmodell für den Lernfortschritt einzelner Fragen
class QuestionLearningProgress {
  final int questionId;
  int timesEvaluated = 0;       // Wie oft wurde diese Frage in einem Lern-Batch ausgewertet
  int sumAchievedPoints = 0;    // Summe der erreichten Punkte für diese Frage über alle Auswertungen
  int sumPossiblePoints = 0;    // Summe der maximal möglichen Punkte für diese Frage über alle Auswertungen (options.length * timesEvaluated)

  QuestionLearningProgress({required this.questionId});

  // Erfolgsquote für diese spezifische Frage im Lernmodus
  double get successRateForQuestion => sumPossiblePoints > 0 ? (sumAchievedPoints / sumPossiblePoints) * 100 : 0.0;

  Map<String, dynamic> toJson() => {
    'questionId': questionId,
    'timesEvaluated': timesEvaluated,
    'sumAchievedPoints': sumAchievedPoints,
    'sumPossiblePoints': sumPossiblePoints,
  };

  factory QuestionLearningProgress.fromJson(Map<String, dynamic> json) {
    final progress = QuestionLearningProgress(questionId: json['questionId'] as int);
    progress.timesEvaluated = json['timesEvaluated'] as int? ?? 0; // Fallback für alte Daten
    progress.sumAchievedPoints = json['sumAchievedPoints'] as int? ?? 0; // Fallback für alte Daten
    progress.sumPossiblePoints = json['sumPossiblePoints'] as int? ?? 0; // Fallback für alte Daten
    return progress;
  }
}


// Hauptcontainer für alle Statistikdaten, getrennt nach Rolle
class UserStatistics {
  final Map<AppRole, Map<int, QuestionLearningProgress>> learningProgress;
  final Map<AppRole, List<ExamAttempt>> examHistory;

  UserStatistics({
    Map<AppRole, Map<int, QuestionLearningProgress>>? learningProgress,
    Map<AppRole, List<ExamAttempt>>? examHistory,
  })  : learningProgress = learningProgress ?? {},
        examHistory = examHistory ?? {};

  Map<int, QuestionLearningProgress> getLearningProgressForRole(AppRole role) {
    return learningProgress[role] ?? {};
  }

  List<ExamAttempt> getExamHistoryForRole(AppRole role) {
    return examHistory[role] ?? [];
  }

  UserStatistics copyWith({
    Map<AppRole, Map<int, QuestionLearningProgress>>? learningProgress,
    Map<AppRole, List<ExamAttempt>>? examHistory,
  }) {
    return UserStatistics(
      learningProgress: learningProgress ?? this.learningProgress,
      examHistory: examHistory ?? this.examHistory,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'learningProgress': learningProgress.map(
            (role, progressMap) => MapEntry(
          role.toString(),
          progressMap.map((id, progress) => MapEntry(id.toString(), progress.toJson())),
        ),
      ),
      'examHistory': examHistory.map(
            (role, attempts) => MapEntry(
          role.toString(),
          attempts.map((attempt) => attempt.toJson()).toList(),
        ),
      ),
    };
  }

  factory UserStatistics.fromJson(Map<String, dynamic> json) {
    return UserStatistics(
      learningProgress: (json['learningProgress'] as Map<String, dynamic>?)?.map(
            (roleString, progressMapJson) => MapEntry(
          AppRole.values.firstWhere((e) => e.toString() == roleString, orElse: () => AppRole.mannschaft),
          (progressMapJson as Map<String, dynamic>).map(
                (idString, progressJson) => MapEntry(
              int.parse(idString),
              QuestionLearningProgress.fromJson(progressJson as Map<String, dynamic>),
            ),
          ),
        ),
      ) ?? {},
      examHistory: (json['examHistory'] as Map<String, dynamic>?)?.map(
            (roleString, attemptsJson) => MapEntry(
          AppRole.values.firstWhere((e) => e.toString() == roleString, orElse: () => AppRole.mannschaft),
          (attemptsJson as List<dynamic>)
              .map((attemptJson) => ExamAttempt.fromJson(attemptJson as Map<String, dynamic>))
              .toList(),
        ),
      ) ?? {},
    );
  }

  static UserStatistics empty() => UserStatistics(learningProgress: {}, examHistory: {});
}
