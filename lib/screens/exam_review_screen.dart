// lib/screens/exam_review_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/question.dart';
import '../models/statistics_data.dart'; // Für ExamAttempt
import '../providers/question_provider.dart'; // Für explanationVisibilityProvider

class ExamReviewScreen extends ConsumerWidget {
  final List<Question> examQuestions;
  final Map<int, Set<String>> selectedAnswers;
  final ExamAttempt attemptDetails; // Dieses Objekt enthält das Datum

  const ExamReviewScreen({
    Key? key,
    required this.examQuestions,
    required this.selectedAnswers,
    required this.attemptDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prüfungsüberprüfung"),
        centerTitle: true,
        elevation: 2.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.primaryColor, theme.primaryColorDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            color: theme.primaryColor.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Ergebnis: ${attemptDetails.achievedPoints}/${attemptDetails.totalPossiblePoints} Punkte (${attemptDetails.percentage.toStringAsFixed(1)}%)",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  DateFormat('dd.MM.yy, HH:mm').format(attemptDetails.date),
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
        itemCount: examQuestions.length,
        itemBuilder: (context, index) {
          final question = examQuestions[index];
          final userSelectedOptions = selectedAnswers[question.id] ?? const <String>{};
          return ReviewQuestionCard(
            // Key bleibt gleich, verwendet attemptDetails vom Screen
            key: ValueKey("review_${attemptDetails.date.millisecondsSinceEpoch}_${question.id}"),
            question: question,
            questionNumber: index + 1,
            totalQuestions: examQuestions.length,
            userSelectedOptions: userSelectedOptions,
            // attemptDetails wird jetzt an ReviewQuestionCard übergeben
            attemptDateEpoch: attemptDetails.date.millisecondsSinceEpoch,
          );
        },
      ),
    );
  }
}

class ReviewQuestionCard extends ConsumerWidget {
  final Question question;
  final int questionNumber;
  final int totalQuestions;
  final Set<String> userSelectedOptions;
  final int attemptDateEpoch; // NEU: Um den eindeutigen Key für Erklärungen zu erstellen

  const ReviewQuestionCard({
    Key? key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.userSelectedOptions,
    required this.attemptDateEpoch, // NEU
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.grey.shade300, width: 1)),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frage $questionNumber / $totalQuestions (ID: ${question.id})',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary.withOpacity(0.8)),
            ),
            const SizedBox(height: 12),
            Text(
              question.questionText,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1.45,
                  color: Colors.black.withOpacity(0.85)),
            ),
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: question.options.length,
              itemBuilder: (context, optionIndex) {
                final option = question.options[optionIndex];
                // Eindeutiger Schlüssel für die Sichtbarkeit der Erklärung
                // verwendet jetzt attemptDateEpoch, das übergeben wurde
                final String explanationKey = 'reviewScreen_${attemptDateEpoch}_${question.id}_${option.label}';
                final bool isExplanationVisible = ref.watch(explanationVisibilityProvider)[explanationKey] ?? false;

                bool isDefinedAsCorrect = question.correctAnswers.contains(option.label);
                bool wasSelectedByUser = userSelectedOptions.contains(option.label);

                IconData displayIcon;
                Color iconColor;
                Color borderColor = Colors.grey.shade400;
                Color backgroundColor = Colors.transparent;
                FontWeight fontWeight = FontWeight.normal;

                if (isDefinedAsCorrect) {
                  if (wasSelectedByUser) {
                    displayIcon = Icons.check_circle_rounded;
                    iconColor = Colors.green.shade700;
                    borderColor = Colors.green.shade500;
                    backgroundColor = Colors.green.withOpacity(0.1);
                    fontWeight = FontWeight.w500;
                  } else {
                    displayIcon = Icons.radio_button_unchecked_rounded;
                    iconColor = Colors.orange.shade700;
                    borderColor = Colors.orange.shade400;
                    backgroundColor = Colors.orange.withOpacity(0.08);
                  }
                } else {
                  if (!wasSelectedByUser) {
                    displayIcon = Icons.check_circle_outline_rounded;
                    iconColor = Colors.blueGrey.shade600;
                    borderColor = Colors.blueGrey.shade300;
                  } else {
                    displayIcon = Icons.cancel_rounded;
                    iconColor = Colors.red.shade700;
                    borderColor = Colors.red.shade500;
                    backgroundColor = Colors.red.withOpacity(0.1);
                    fontWeight = FontWeight.w500;
                  }
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: borderColor, width: 1.5)),
                      child: Row(
                        children: [
                          Icon(displayIcon, color: iconColor, size: 26),
                          const SizedBox(width: 12),
                          Expanded(
                              child: Text(option.text,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      height: 1.4,
                                      fontWeight: fontWeight))),
                          if (option.explanation != null &&
                              option.explanation!.isNotEmpty)
                            IconButton(
                              icon: Icon(
                                isExplanationVisible
                                    ? Icons.help_rounded
                                    : Icons.help_outline_rounded,
                                color: Colors.blueAccent.shade700,
                                size: 28,
                              ),
                              tooltip: 'Erklärung anzeigen/verbergen',
                              onPressed: () {
                                final currentVisibility = Map<String, bool>.from(ref.read(explanationVisibilityProvider));
                                currentVisibility[explanationKey] = !isExplanationVisible;
                                ref.read(explanationVisibilityProvider.notifier).state = currentVisibility;
                              },
                            ),
                        ],
                      ),
                    ),
                    if (isExplanationVisible &&
                        option.explanation != null &&
                        option.explanation!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 8.0, right: 8.0, bottom: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade50.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  color: Colors.blueGrey.shade200, width: 1)),
                          child: Text(
                            option.explanation!,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Colors.blueGrey.shade900,
                                fontSize: 15,
                                height: 1.45),
                          ),
                        ),
                      ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
          ],
        ),
      ),
    );
  }
}
