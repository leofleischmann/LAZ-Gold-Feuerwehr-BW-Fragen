// lib/screens/statistics_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // Für Datumsformatierung
import '../models/app_role.dart';
import '../models/statistics_data.dart';
import '../providers/role_provider.dart';
import '../providers/statistics_provider.dart';
import 'exam_review_screen.dart'; // Für die Navigation zur Detailansicht
import '../providers/question_provider.dart'; // Um ggf. examQuestions zu bekommen

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(roleProvider);
    final userStatistics = ref.watch(statisticsProvider);
    final theme = Theme.of(context);

    if (selectedRole == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Statistiken'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.primaryColor, theme.primaryColorDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: const Center(child: Text("Bitte zuerst eine Rolle auswählen.")),
      );
    }

    final examHistoryForRole = userStatistics.getExamHistoryForRole(selectedRole);
    final learningProgressForRole = userStatistics.getLearningProgressForRole(selectedRole);

    // Berechne einige Gesamtstatistiken für den Lernmodus
    int totalLearnedQuestionsAttempted = 0;
    int totalCorrectlyLearnedAnswers = 0;
    learningProgressForRole.forEach((_, progress) {
      if (progress.timesAttempted > 0) {
        totalLearnedQuestionsAttempted++;
      }
      totalCorrectlyLearnedAnswers += progress.timesCorrect;
    });

    int totalAttemptsInLearning = 0;
    learningProgressForRole.forEach((_, progress) {
      totalAttemptsInLearning += progress.timesAttempted;
    });
    double learningSuccessRate = totalAttemptsInLearning > 0
        ? (totalCorrectlyLearnedAnswers / totalAttemptsInLearning) * 100
        : 0.0;

    // Berechne einige Gesamtstatistiken für den Prüfungsmodus
    int totalExamsTaken = examHistoryForRole.length;
    int totalExamsPassed = examHistoryForRole.where((attempt) => attempt.passed).length;
    double averageExamScore = 0;
    if (totalExamsTaken > 0) {
      averageExamScore = examHistoryForRole.map((e) => e.percentage).reduce((a, b) => a + b) / totalExamsTaken;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiken - ${selectedRole.displayName}'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.primaryColor, theme.primaryColorDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_rounded),
            tooltip: 'Statistiken für diese Rolle zurücksetzen',
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Statistiken zurücksetzen?'),
                    content: Text(
                        'Möchten Sie wirklich alle Statistiken für die Rolle "${selectedRole.displayName}" zurücksetzen? Diese Aktion kann nicht rückgängig gemacht werden.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Abbrechen'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      TextButton(
                        child: const Text('Zurücksetzen',
                            style: TextStyle(color: Colors.red)),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  );
                },
              );
              if (confirmed == true) {
                await ref
                    .read(statisticsProvider.notifier)
                    .resetStatisticsForRole(selectedRole);
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Statistiken für ${selectedRole.displayName} zurückgesetzt.')),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lernmodus",
                style: theme.textTheme.headlineSmall
                    ?.copyWith(color: theme.colorScheme.primary)),
            const SizedBox(height: 8),
            StatisticCard(
              title: "Bearbeitete Fragen (mind. 1x)",
              value: "${learningProgressForRole.values.where((p) => p.timesAttempted > 0).length}",
              icon: Icons.school_rounded,
            ),
            StatisticCard(
              title: "Erfolgsquote im Lernmodus",
              value: "${learningSuccessRate.toStringAsFixed(1)}%",
              icon: Icons.military_tech_rounded,
              iconColor: Colors.amber.shade700,
            ),
            const SizedBox(height: 24),
            Text("Prüfungsmodus",
                style: theme.textTheme.headlineSmall
                    ?.copyWith(color: theme.colorScheme.primary)),
            const SizedBox(height: 8),
            StatisticCard(
              title: "Prüfungen absolviert",
              value: "$totalExamsTaken",
              icon: Icons.assignment_turned_in_rounded,
            ),
            StatisticCard(
              title: "Prüfungen bestanden",
              value: "$totalExamsPassed",
              icon: Icons.emoji_events_rounded,
              iconColor: Colors.green.shade700,
            ),
            StatisticCard(
              title: "Ø Punktzahl", // Geändert von Durchschnittsnote
              value: "${averageExamScore.toStringAsFixed(1)}%",
              icon: Icons.leaderboard_rounded,
              iconColor: Colors.blue.shade700,
            ),
            const SizedBox(height: 24),
            Text("Letzte Prüfungsversuche", style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            if (examHistoryForRole.isEmpty)
              Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Noch keine Prüfungen absolviert.",
                        style:
                        TextStyle(fontSize: 16, color: Colors.grey[600])),
                  ))
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: examHistoryForRole.length > 5 ? 5 : examHistoryForRole.length, // Zeige max. die letzten 5
                itemBuilder: (context, index) {
                  // Zeige in umgekehrter Reihenfolge (neueste zuerst)
                  final attempt = examHistoryForRole[examHistoryForRole.length - 1 - index];
                  return Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: attempt.passed
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                        child: Icon(
                          attempt.passed
                              ? Icons.check_circle_outline_rounded
                              : Icons.highlight_off_rounded,
                          color: attempt.passed
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                        ),
                      ),
                      title: Text(
                        "${DateFormat('dd.MM.yyyy, HH:mm').format(attempt.date)} - ${attempt.role.displayName}",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        // Angepasst an die neue Punktelogik
                          "${attempt.achievedPoints} / ${attempt.totalPossiblePoints} Punkte (${attempt.percentage.toStringAsFixed(1)}%)"),
                      trailing: Text(
                        attempt.passed ? "Bestanden" : "Nicht best.",
                        style: TextStyle(
                          color: attempt.passed
                              ? Colors.green.shade700
                              : Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // Annahme: Die Fragen des letzten Versuchs sind noch im examQuestionsProvider
                        // Dies ist nicht ideal, da der Provider für die *aktuelle* Prüfung gedacht ist.
                        // Für eine robuste Review-Funktion müsste man die Fragen des Versuchs speichern
                        // oder zumindest die IDs und Antworten.
                        // Hier versuchen wir, die aktuell im examQuestionsProvider befindlichen Fragen zu verwenden,
                        // was nur dann korrekt ist, wenn der User direkt nach einer Prüfung hierher navigiert
                        // und noch keine neue Prüfung gestartet hat.
                        final questionsForThisAttempt = ref.read(examQuestionsProvider);
                        final selectedAnswersForThisAttempt = ref.read(selectedExamAnswersProvider);

                        if (questionsForThisAttempt.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExamReviewScreen(
                                examQuestions: questionsForThisAttempt,
                                selectedAnswers: selectedAnswersForThisAttempt, // Hier müssten die Antworten des *spezifischen* Versuchs geladen werden
                                attemptDetails: attempt,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Detailansicht für diesen Versuch aktuell nicht verfügbar.')),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? iconColor;

  const StatisticCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 36, color: iconColor ?? theme.colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
