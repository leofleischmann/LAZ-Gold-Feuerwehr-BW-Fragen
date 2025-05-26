// lib/screens/learning_mode_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_role.dart';
import '../models/question.dart';
import '../providers/question_provider.dart';
import '../providers/role_provider.dart';
import 'dart:math';
import '../providers/statistics_provider.dart';
import '../providers/marked_questions_provider.dart';

class LearningModeScreen extends ConsumerWidget {
  final List<int> _questionAmountOptions = [5, 10, 15, 20, 25, 30];

  LearningModeScreen({super.key});

  void _startNewLearningRound(WidgetRef ref) {
    ref.read(selectedAnswersProvider.notifier).state = {};
    ref.read(learningBatchSubmittedProvider.notifier).state = false;
    ref.read(explanationVisibilityProvider.notifier).state = {};
    ref.read(evaluatedQuestionsInInstantModeProvider.notifier).state = {};
    ref.read(learningBatchSeedProvider.notifier).update((state) => state + Random().nextInt(1000) + 1);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(roleProvider);
    final questionsAsyncValue = ref.watch(allQuestionsProvider);
    final currentNumberOfQuestions = ref.watch(numberOfQuestionsPerBatchProvider);
    final isMarkedOnlyMode = ref.watch(markedQuestionsOnlyModeProvider);
    final isInstantEvaluationMode = ref.watch(instantEvaluationModeProvider);
    final optionsPanelVisible = ref.watch(learningOptionsPanelVisibleProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRole?.displayName ?? 'Lernmodus'),
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
        actions: [
          IconButton(
            icon: Icon(optionsPanelVisible ? Icons.tune_rounded : Icons.tune_outlined),
            tooltip: 'Lernoptionen anzeigen/verbergen',
            onPressed: () {
              ref.read(learningOptionsPanelVisibleProvider.notifier).state = !optionsPanelVisible;
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1.0,
                child: child,
              );
            },
            child: optionsPanelVisible
                ? Material(
              key: const ValueKey('optionsPanel'),
              elevation: 1.0,
              color: theme.cardColor.withOpacity(0.5), // Etwas transparenter Hintergrund für das Panel
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0, top: 4.0),
                      child: Text(
                        "Lernoptionen:",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, right:8.0),
                            child: Icon(Icons.format_list_numbered_rounded, color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7), size: 22),
                          ),
                          Expanded(
                            child: Text(
                              "Fragen pro Runde",
                              style: theme.textTheme.titleMedium?.copyWith(color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                          ),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                                color: theme.canvasColor,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: Colors.grey.shade300, width: 0.8)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                value: currentNumberOfQuestions,
                                icon: Icon(Icons.expand_more_rounded, color: theme.colorScheme.primary),
                                items: _questionAmountOptions.map((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString(), style: const TextStyle(fontSize: 16, color: Colors.black87)),
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
                    const Divider(height: 1, thickness: 0.5),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.bookmark_outline_rounded, color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                      title: Text(
                        "Nur markierte Fragen",
                        style: theme.textTheme.titleMedium?.copyWith(color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      trailing: Switch(
                        value: isMarkedOnlyMode,
                        onChanged: (bool value) {
                          ref.read(markedQuestionsOnlyModeProvider.notifier).state = value;
                          _startNewLearningRound(ref);
                        },
                        activeColor: theme.colorScheme.secondary,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                    ),
                    const Divider(height: 1, thickness: 0.5),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.bolt_rounded, color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7)),
                      title: Text(
                        "Sofortige Auswertung",
                        style: theme.textTheme.titleMedium?.copyWith(color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      trailing: Switch(
                        value: isInstantEvaluationMode,
                        onChanged: (bool value) {
                          ref.read(instantEvaluationModeProvider.notifier).state = value;
                          _startNewLearningRound(ref);
                        },
                        activeColor: theme.colorScheme.primary,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                    ),
                  ],
                ),
              ),
            )
                : const SizedBox.shrink(key: ValueKey('optionsPanelHidden')),
          ),
          Expanded(
            child: questionsAsyncValue.when(
              data: (allQuestions) {
                final questionsInBatch = ref.watch(learningBatchQuestionsProvider);
                final markedQuestionIds = ref.watch(currentRoleMarkedQuestionsProvider);

                if (allQuestions.isEmpty && selectedRole != null) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline_rounded, size: 52, color: Colors.blueGrey[300]),
                          const SizedBox(height: 16),
                          Text(
                            'Keine Fragen für ${selectedRole.displayName} geladen.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.blueGrey[700]),
                          ),
                          const SizedBox(height: 8),
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
                if (isMarkedOnlyMode && markedQuestionIds.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_border_rounded, size: 52, color: theme.colorScheme.secondary),
                          const SizedBox(height: 16),
                          Text(
                            'Keine Fragen markiert.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, color: Colors.blueGrey[700], fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Markiere zuerst einige Fragen oder deaktiviere den Filter oben.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: Colors.blueGrey[500]),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (questionsInBatch.isEmpty && allQuestions.isNotEmpty && ref.watch(numberOfQuestionsPerBatchProvider) > 0 && !(isMarkedOnlyMode && markedQuestionIds.isEmpty)) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (ref.read(learningBatchQuestionsProvider).isEmpty) {
                      _startNewLearningRound(ref);
                    }
                  });
                  return const Center(child: CircularProgressIndicator());
                }
                if (questionsInBatch.isEmpty && ref.watch(numberOfQuestionsPerBatchProvider) == 0) {
                  return const Center(child: Text("Bitte wählen Sie oben eine Fragenanzahl, um zu starten."));
                }

                final isBatchSubmitted = ref.watch(learningBatchSubmittedProvider);
                final evaluatedInInstantMode = ref.watch(evaluatedQuestionsInInstantModeProvider);
                final allQuestionsInBatchEvaluated = isInstantEvaluationMode &&
                    questionsInBatch.isNotEmpty &&
                    questionsInBatch.every((q) => evaluatedInInstantMode.contains(q.id));

                if (isMarkedOnlyMode && questionsInBatch.isEmpty && markedQuestionIds.isNotEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Nicht genügend markierte Fragen für die gewählte Rundenanzahl vorhanden oder es gab ein Problem beim Laden. Bitte Filter oder Fragenanzahl anpassen.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                        itemCount: questionsInBatch.length,
                        itemBuilder: (context, index) {
                          final question = questionsInBatch[index];
                          return QuestionCard(
                            key: ValueKey(question.id + ref.watch(learningBatchSeedProvider)),
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
                          onPressed: (isInstantEvaluationMode && !allQuestionsInBatchEvaluated)
                              ? null
                              : () {
                            if (isInstantEvaluationMode || isBatchSubmitted) {
                              _startNewLearningRound(ref);
                            } else {
                              ref.read(learningBatchSubmittedProvider.notifier).state = true;
                              final currentRole = ref.read(roleProvider);
                              if (currentRole != null) {
                                for (var q_idx = 0; q_idx < questionsInBatch.length; q_idx++) {
                                  final q = questionsInBatch[q_idx];
                                  final selectedOpts = ref.read(selectedAnswersProvider)[q.id] ?? {};
                                  int achievedPointsForThisQuestionInBatch = 0;
                                  int possiblePointsForThisQuestionInBatch = q.options.length;
                                  for (var option in q.options) {
                                    bool isOptionCorrectProvidedInQuestion = q.correctAnswers.contains(option.label);
                                    bool wasOptionSelectedByUser = selectedOpts.contains(option.label);
                                    if (isOptionCorrectProvidedInQuestion) {
                                      if (wasOptionSelectedByUser) achievedPointsForThisQuestionInBatch++;
                                    } else {
                                      if (!wasOptionSelectedByUser) achievedPointsForThisQuestionInBatch++;
                                    }
                                  }
                                  ref.read(statisticsProvider.notifier).updateQuestionLearningProgress(
                                      currentRole, q.id, achievedPointsForThisQuestionInBatch, possiblePointsForThisQuestionInBatch);
                                }
                              }
                            }
                          },
                          child: Text(
                              isInstantEvaluationMode
                                  ? 'Nächste Runde (${ref.watch(numberOfQuestionsPerBatchProvider)} Fragen)'
                                  : (isBatchSubmitted ? 'Nächste ${ref.watch(numberOfQuestionsPerBatchProvider)} Fragen' : 'Auswerten & Ergebnisse anzeigen')
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                            elevation: 2,
                            backgroundColor: (isInstantEvaluationMode && !allQuestionsInBatchEvaluated) ? Colors.grey : theme.colorScheme.primary,
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
                print('Stacktrace für Fehler im LearningModeScreen: $stackTrace');
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline_rounded, size: 52, color: Colors.red.shade600),
                        const SizedBox(height: 16),
                        Text(
                          'Fehler beim Laden der Fragen.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red.shade700, fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
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
          ),
        ],
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

  void _evaluateSingleQuestion(BuildContext context, WidgetRef ref, Question q) {
    final currentRole = ref.read(roleProvider);
    if (currentRole == null) return;

    final selectedOpts = ref.read(selectedAnswersProvider)[q.id] ?? {};
    int achievedPoints = 0;
    int possiblePoints = q.options.length;

    for (var option in q.options) {
      bool isOptionCorrectProvided = q.correctAnswers.contains(option.label);
      bool wasOptionSelectedByUser = selectedOpts.contains(option.label);
      if (isOptionCorrectProvided) {
        if (wasOptionSelectedByUser) achievedPoints++;
      } else {
        if (!wasOptionSelectedByUser) achievedPoints++;
      }
    }
    ref.read(statisticsProvider.notifier).updateQuestionLearningProgress(
        currentRole, q.id, achievedPoints, possiblePoints);
    ref.read(evaluatedQuestionsInInstantModeProvider.notifier).update((state) => {...state, q.id});
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOptionsForThisQuestion = ref.watch(
        selectedAnswersProvider.select((map) => map[question.id] ?? const <String>{})
    );
    final isBatchSubmittedMode = ref.watch(learningBatchSubmittedProvider);
    final isInstantEvaluationMode = ref.watch(instantEvaluationModeProvider);
    final evaluatedInInstantModeSet = ref.watch(evaluatedQuestionsInInstantModeProvider);

    final bool isThisQuestionEvaluatedInInstantMode = isInstantEvaluationMode && evaluatedInInstantModeSet.contains(question.id);
    final bool isQuestionSubmittedForDisplay = isBatchSubmittedMode || isThisQuestionEvaluatedInInstantMode;


    final theme = Theme.of(context);
    final selectedRole = ref.watch(roleProvider);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded( // Damit der Text umbricht, falls er zu lang wird
                  child: Text(
                    'Frage ${questionIndex + 1} / $totalQuestions (ID: ${question.id})',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: theme.colorScheme.primary.withOpacity(0.8)),
                  ),
                ),
                if (selectedRole != null)
                  Consumer(builder: (context, ref, child){
                    final isMarked = ref.watch(currentRoleMarkedQuestionsProvider).contains(question.id);
                    return IconButton(
                      icon: Icon(
                        isMarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                        color: isMarked ? theme.colorScheme.secondary : Colors.grey.shade600,
                      ),
                      tooltip: isMarked ? 'Markierung entfernen' : 'Frage markieren',
                      onPressed: () {
                        ref.read(markedQuestionsProvider.notifier).toggleQuestionMark(selectedRole, question.id);
                      },
                    );
                  }),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              question.questionText,
              style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500, height: 1.45, color: Colors.black.withOpacity(0.85)),
            ),
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: question.options.length,
              itemBuilder: (context, optionIndex) {
                final option = question.options[optionIndex];
                final String explanationKey = 'learningMode_${question.id}_${option.label}_${ref.watch(learningBatchSeedProvider)}';
                final bool isExplanationVisible = ref.watch(
                    explanationVisibilityProvider.select((map) => map[explanationKey] ?? false)
                );
                bool isDefinedAsCorrect = question.correctAnswers.contains(option.label);
                bool isSelected = selectedOptionsForThisQuestion.contains(option.label);

                IconData displayIcon;
                Color iconColor;
                Color borderColor = Colors.grey.shade300;
                Color backgroundColor = Colors.transparent;
                FontWeight fontWeight = FontWeight.normal;

                if (isQuestionSubmittedForDisplay) {
                  if (isDefinedAsCorrect) {
                    if (isSelected) {
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
                    if (!isSelected) {
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
                } else {
                  displayIcon = isSelected ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded;
                  iconColor = isSelected ? theme.colorScheme.primary : Colors.grey.shade700;
                  borderColor = isSelected ? theme.colorScheme.primary.withOpacity(0.8) : Colors.grey.shade400;
                  backgroundColor = isSelected ? theme.colorScheme.primary.withOpacity(0.05) : Colors.transparent;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Material(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10.0),
                      child: InkWell(
                        onTap: (isInstantEvaluationMode && isThisQuestionEvaluatedInInstantMode) || isBatchSubmittedMode
                            ? null
                            : () {
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
                        splashColor: (isInstantEvaluationMode && isThisQuestionEvaluatedInInstantMode) || isBatchSubmittedMode
                            ? Colors.transparent
                            : theme.colorScheme.primary.withOpacity(0.1),
                        highlightColor: (isInstantEvaluationMode && isThisQuestionEvaluatedInInstantMode) || isBatchSubmittedMode
                            ? Colors.transparent
                            : theme.colorScheme.primary.withOpacity(0.05),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: borderColor, width: 1.5)
                          ),
                          child: Row(
                            children: [
                              Icon(displayIcon, color: iconColor, size: 28),
                              const SizedBox(width: 12),
                              Expanded(child: Text(option.text, style: TextStyle(fontSize: 16.5, color: Colors.black87, height: 1.3, fontWeight: fontWeight))),
                              if (isQuestionSubmittedForDisplay && option.explanation != null && option.explanation!.isNotEmpty)
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
                    if (isQuestionSubmittedForDisplay && isExplanationVisible && option.explanation != null && option.explanation!.isNotEmpty)
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
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
            if (isInstantEvaluationMode && !isThisQuestionEvaluatedInInstantMode)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check_circle_outline_rounded, size: 20),
                  label: const Text("Diese Frage prüfen"),
                  onPressed: () { // Button ist jetzt immer aktiv, wenn Sofort-Auswertung an und Frage noch nicht geprüft
                    _evaluateSingleQuestion(context, ref, question);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.8),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
