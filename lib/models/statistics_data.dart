// lib/models/statistics_data.dart
import 'dart:convert'; // Für jsonEncode und jsonDecode
import 'app_role.dart';

// Datenmodell für das Ergebnis einer einzelnen Prüfungssimulation
class ExamAttempt {
  final DateTime date;
  final int totalPossiblePoints; // Die maximal erreichbare Punktzahl für diese Prüfung (Summe aller Antwortoptionen)
  final int achievedPoints;      // Die tatsächlich erreichten Punkte gemäß der neuen Logik

  final AppRole role; // Für welche Rolle war diese Prüfung?

  ExamAttempt({
    required this.date,
    required this.totalPossiblePoints,
    required this.achievedPoints,
    required this.role,
  });

  double get percentage => totalPossiblePoints > 0 ? (achievedPoints / totalPossiblePoints) * 100 : 0.0;
  bool get passed => percentage >= 75.0; // Annahme: 75% zum Bestehen

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
    role: AppRole.values.firstWhere((e) => e.toString() == json['role'], orElse: () => AppRole.mannschaft), // Fallback
  );
}

// Datenmodell für den Lernfortschritt einzelner Fragen
class QuestionLearningProgress {
  final int questionId;
  int timesAttempted = 0;
  int timesCorrect = 0;
  // Man könnte hier auch speichern, wann zuletzt gelernt, etc.

  QuestionLearningProgress({required this.questionId});

  Map<String, dynamic> toJson() => {
    'questionId': questionId,
    'timesAttempted': timesAttempted,
    'timesCorrect': timesCorrect,
  };

  factory QuestionLearningProgress.fromJson(Map<String, dynamic> json) {
    final progress = QuestionLearningProgress(questionId: json['questionId'] as int);
    progress.timesAttempted = json['timesAttempted'] as int;
    progress.timesCorrect = json['timesCorrect'] as int;
    return progress;
  }
}


// Hauptcontainer für alle Statistikdaten, getrennt nach Rolle
class UserStatistics {
  // Lernmodus-Statistiken (pro Frage-ID)
  final Map<AppRole, Map<int, QuestionLearningProgress>> learningProgress;
  // Prüfungsmodus-Statistiken (Liste von Versuchen)
  final Map<AppRole, List<ExamAttempt>> examHistory;

  UserStatistics({
    Map<AppRole, Map<int, QuestionLearningProgress>>? learningProgress,
    Map<AppRole, List<ExamAttempt>>? examHistory,
  })  : learningProgress = learningProgress ?? {}, // Sicherstellen, dass es nicht null ist
        examHistory = examHistory ?? {};       // Sicherstellen, dass es nicht null ist


  // Hilfsmethoden, um Statistiken für eine bestimmte Rolle zu bekommen
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

  // Serialisierung und Deserialisierung
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
          AppRole.values.firstWhere((e) => e.toString() == roleString, orElse: () => AppRole.mannschaft), // Fallback hinzugefügt
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
          AppRole.values.firstWhere((e) => e.toString() == roleString, orElse: () => AppRole.mannschaft), // Fallback hinzugefügt
          (attemptsJson as List<dynamic>)
              .map((attemptJson) => ExamAttempt.fromJson(attemptJson as Map<String, dynamic>))
              .toList(),
        ),
      ) ?? {},
    );
  }

  static UserStatistics empty() => UserStatistics(learningProgress: {}, examHistory: {});
}
