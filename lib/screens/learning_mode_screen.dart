// lib/screens/learning_mode_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_role.dart';
import '../models/question.dart';
import '../providers/question_provider.dart';
import '../providers/role_provider.dart';
import 'dart:math';

import '../providers/statistics_provider.dart';

class LearningModeScreen extends ConsumerWidget {
  final List<int> _questionAmountOptions = [5, 10, 15, 20, 25, 30];

  void _startNewLearningRound(WidgetRef ref) {
    ref.read(selectedAnswersProvider.notifier).state = {};
    ref.read(learningBatchSubmittedProvider.notifier).state = false;
    ref.read(explanationVisibilityProvider.notifier).state = {};
    ref.read(learningBatchSeedProvider.notifier).update((state) => state + Random().nextInt(1000) + 1); // Ensure seed changes
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(roleProvider);
    final questionsAsyncValue = ref.watch(allQuestionsProvider);
    final currentNumberOfQuestions = ref.watch(numberOfQuestionsPerBatchProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // ANGEPASST: AppBar-Titel zeigt nur noch die Rolle
        title: Text(selectedRole?.displayName ?? 'Lernmodus'),
        elevation: 2.0,
        // ENTFERNT: Refresh-Button im AppBar
      ),
      body: questionsAsyncValue.when(
        data: (allQuestions) {
          final questionsInBatch = ref.watch(learningBatchQuestionsProvider);

          if (allQuestions.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline_rounded, size: 52, color: Colors.blueGrey[300]),
                    SizedBox(height: 16),
                    Text(
                      'Keine Fragen für ${selectedRole?.displayName ?? "diese Rolle"} geladen.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey[700]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Bitte überprüfen Sie die Datenquellen oder wählen Sie eine andere Rolle.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.blueGrey[500]),
                    ),
                  ],
                ),
              ),
            );
          }

          if (questionsInBatch.isEmpty && allQuestions.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.autorenew_rounded, size: 48, color: Colors.blueGrey),
                    SizedBox(height: 16),
                    Text(
                      'Konnte keinen Fragen-Batch erstellen.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Bitte wählen Sie eine Fragenanzahl oder starten Sie die Runde neu, indem Sie auf "Nächste Fragen" klicken (falls verfügbar).',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            );
          }

          final isSubmitted = ref.watch(learningBatchSubmittedProvider);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 0.8))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fragen pro Runde:",
                      style: theme.textTheme.titleMedium?.copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey.shade400, width: 1)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: currentNumberOfQuestions,
                          icon: Icon(Icons.expand_more_rounded, color: theme.colorScheme.primary),
                          items: _questionAmountOptions.map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString(), style: TextStyle(fontSize: 16, color: Colors.black87)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            if (newValue != null && newValue != currentNumberOfQuestions) {
                              ref.read(numberOfQuestionsPerBatchProvider.notifier).state = newValue;
                              _startNewLearningRound(ref);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ENTFERNT: Der Text "Beantworten Sie die folgenden X zufälligen Fragen:"
              Expanded(
                child: questionsInBatch.isEmpty
                    ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Bitte wählen Sie oben eine Fragenanzahl und klicken Sie ggf. auf 'Nächste Fragen', um zu starten.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    )
                )
                    : ListView.builder(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 16.0), // Etwas mehr Padding oben
                  itemCount: questionsInBatch.length,
                  itemBuilder: (context, index) {
                    final question = questionsInBatch[index];
                    return QuestionCard(
                      key: ValueKey(question.id + ref.watch(learningBatchSeedProvider)), // Key mit Seed, um bei neuer Runde neu zu bauen
                      question: question,
                      questionIndex: index,
                      totalQuestions: questionsInBatch.length,
                    );
                  },
                ),
              ),
              if (questionsInBatch.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                  child: ElevatedButton(
                    // ANGEPASST: Logik und Text des Buttons
                    onPressed: questionsInBatch.isEmpty // Deaktivieren, wenn keine Fragen da sind
                        ? null
                        : () {
                      if (isSubmitted) {
                        // Wenn bereits ausgewertet, neue Runde starten
                        _startNewLearningRound(ref);
                      } else {
                        // Sonst auswerten
                        ref.read(learningBatchSubmittedProvider.notifier).state = true;
                        final currentRole = ref.read(roleProvider);
                        if (currentRole != null) {
                          for (var q_idx = 0; q_idx < questionsInBatch.length; q_idx++) {
                            final q = questionsInBatch[q_idx];
                            final selectedOpts = ref.read(selectedAnswersProvider)[q.id] ?? {};
                            bool allCorrect = selectedOpts.isNotEmpty && selectedOpts.length == q.correctAnswers.length &&
                                selectedOpts.every((ans) => q.correctAnswers.contains(ans));
                            ref.read(statisticsProvider.notifier).updateQuestionLearningProgress(currentRole, q.id, allCorrect);
                          }
                        }
                      }
                    },
                    // ANGEPASST: Text des Buttons
                    child: Text(isSubmitted ? 'Nächste ${ref.watch(numberOfQuestionsPerBatchProvider)} Fragen' : 'Auswerten & Ergebnisse anzeigen'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      elevation: 2,
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator(color: theme.colorScheme.primary)),
        error: (error, stackTrace) {
          print('Fehler im LearningModeScreen: $error');
          print('Stacktrace: $stackTrace');
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline_rounded, size: 52, color: Colors.red.shade600),
                  SizedBox(height: 16),
                  Text(
                    'Fehler beim Laden der Fragen.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red.shade700, fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bitte überprüfen Sie Ihre Datenquellen und starten Sie die App neu.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuestionCard extends ConsumerWidget {
  final Question question;
  final int questionIndex;
  final int totalQuestions;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOptionsForThisQuestion = ref.watch(
        selectedAnswersProvider.select((map) => map[question.id] ?? const <String>{})
    );
    final isSubmitted = ref.watch(learningBatchSubmittedProvider);
    final theme = Theme.of(context);

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.grey.shade200, width: 1)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frage ${questionIndex + 1} / $totalQuestions',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: theme.colorScheme.primary.withOpacity(0.8)),
            ),
            SizedBox(height: 12),
            Text(
              question.questionText,
              style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500, height: 1.45, color: Colors.black.withOpacity(0.85)),
            ),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: question.options.length,
              itemBuilder: (context, optionIndex) {
                final option = question.options[optionIndex];
                final String explanationKey = '${question.id}_${option.label}';
                final bool isExplanationVisible = ref.watch(
                    explanationVisibilityProvider.select((map) => map[explanationKey] ?? false)
                );
                bool? isCorrectOption;
                bool isSelected = selectedOptionsForThisQuestion.contains(option.label);

                if (isSubmitted) {
                  isCorrectOption = question.correctAnswers.contains(option.label);
                }

                Color optionBackgroundColor = Colors.transparent;
                Color optionBorderColor = Colors.grey.shade300;
                Color checkboxColor = theme.colorScheme.primary;
                IconData checkboxIcon = isSelected ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded;
                Color textColor = Colors.black87;

                if (isSubmitted) {
                  if (isCorrectOption == true) {
                    optionBorderColor = Colors.green.shade400;
                    checkboxColor = Colors.green.shade600;
                    if (isSelected) {
                      optionBackgroundColor = Colors.green.withOpacity(0.1);
                      checkboxIcon = Icons.check_circle_rounded;
                    } else {
                      optionBackgroundColor = Colors.orange.withOpacity(0.08);
                      optionBorderColor = Colors.orange.shade300;
                      checkboxIcon = Icons.check_box_outline_blank_rounded;
                      checkboxColor = Colors.orange.shade600;
                    }
                  } else if (isSelected) {
                    optionBackgroundColor = Colors.red.withOpacity(0.08);
                    optionBorderColor = Colors.red.shade400;
                    checkboxIcon = Icons.cancel_rounded;
                    checkboxColor = Colors.red.shade600;
                  }
                }


                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Material(
                      color: optionBackgroundColor,
                      borderRadius: BorderRadius.circular(10.0),
                      child: InkWell(
                        onTap: isSubmitted ? null : () {
                          final currentSelections = Map<int, Set<String>>.from(ref.read(selectedAnswersProvider));
                          final questionSelections = Set<String>.from(currentSelections[question.id] ?? {});
                          if (questionSelections.contains(option.label)) {
                            questionSelections.remove(option.label);
                          } else {
                            questionSelections.add(option.label);
                          }
                          currentSelections[question.id] = questionSelections;
                          ref.read(selectedAnswersProvider.notifier).state = currentSelections;
                        },
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: optionBorderColor, width: 1.5)
                          ),
                          child: Row(
                            children: [
                              Icon(checkboxIcon, color: checkboxColor, size: 28),
                              SizedBox(width: 12),
                              Expanded(child: Text(option.text, style: TextStyle(fontSize: 16.5, color: textColor, height: 1.3))),
                              if (isSubmitted && option.explanation != null && option.explanation!.isNotEmpty)
                                IconButton(
                                  icon: Icon(
                                    isExplanationVisible ? Icons.help_rounded : Icons.help_outline_rounded,
                                    color: Colors.blueAccent.shade400,
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
                      ),
                    ),
                    if (isSubmitted && isExplanationVisible && option.explanation != null && option.explanation!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0, bottom: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade50,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.blueGrey.shade200, width: 1)
                          ),
                          child: Text(
                            option.explanation!,
                            style: TextStyle(fontStyle: FontStyle.normal, color: Colors.blueGrey.shade900, fontSize: 15, height: 1.45),
                          ),
                        ),
                      ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
            ),
          ],
        ),
      ),
    );
  }
}
