// lib/providers/question_provider.dart
import 'dart:math'; // Für Zufallszahlen
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question.dart';
import '../models/app_role.dart';
import '../services/question_service.dart';
import 'role_provider.dart';
import '../models/question_status.dart';
import 'marked_questions_provider.dart';

// Provider für den QuestionService
final questionServiceProvider = Provider<QuestionService>((ref) => QuestionService());

// FutureProvider, um ALLE Fragen asynchron basierend auf der ausgewählten Rolle zu laden
final allQuestionsProvider = FutureProvider<List<Question>>((ref) async {
  final selectedRole = ref.watch(roleProvider);
  final questionService = ref.watch(questionServiceProvider);

  if (selectedRole == null) {
    return [];
  }
  return questionService.getQuestionsForRole(selectedRole);
});

// --- PROVIDER FÜR DEN LERNMODUS ---
final numberOfQuestionsPerBatchProvider = StateProvider<int>((ref) => 5);
final learningBatchSeedProvider = StateProvider<int>((ref) => 0);
final markedQuestionsOnlyModeProvider = StateProvider<bool>((ref) => false);
final instantEvaluationModeProvider = StateProvider<bool>((ref) => false);
final evaluatedQuestionsInInstantModeProvider = StateProvider<Set<int>>((ref) => {});

// NEU: Provider für die Sichtbarkeit des Lernoptionen-Panels
final learningOptionsPanelVisibleProvider = StateProvider<bool>((ref) => false); // Standardmäßig eingeklappt

final learningBatchQuestionsProvider = Provider<List<Question>>((ref) {
  final allQuestionsAsyncValue = ref.watch(allQuestionsProvider);
  final allQuestions = allQuestionsAsyncValue.asData?.value ?? [];

  if (allQuestions.isEmpty) return [];

  final isMarkedOnlyMode = ref.watch(markedQuestionsOnlyModeProvider);
  final markedQuestionIds = ref.watch(currentRoleMarkedQuestionsProvider);

  List<Question> sourceQuestions;

  if (isMarkedOnlyMode) {
    if (markedQuestionIds.isEmpty) {
      return [];
    }
    sourceQuestions = allQuestions.where((q) => markedQuestionIds.contains(q.id)).toList();
    if (sourceQuestions.isEmpty) {
      return [];
    }
  } else {
    sourceQuestions = allQuestions;
  }

  if (sourceQuestions.isEmpty) {
    return [];
  }

  final numberOfQuestions = ref.watch(numberOfQuestionsPerBatchProvider);
  final random = Random(ref.watch(learningBatchSeedProvider));
  List<Question> shuffledQuestions = List.from(sourceQuestions)..shuffle(random);

  return shuffledQuestions.take(min(numberOfQuestions, shuffledQuestions.length)).toList();
});

final selectedAnswersProvider = StateProvider<Map<int, Set<String>>>((ref) => {});
final learningBatchSubmittedProvider = StateProvider<bool>((ref) => false);
final explanationVisibilityProvider = StateProvider<Map<String, bool>>((ref) => {});

// --- PROVIDER FÜR DEN PRÜFUNGSMODUS ---
final examQuestionsProvider = StateProvider<List<Question>>((ref) => []);
final currentExamQuestionIndexProvider = StateProvider<int>((ref) => 0);
final selectedExamAnswersProvider = StateProvider<Map<int, Set<String>>>((ref) => {});
final examSubmittedProvider = StateProvider<bool>((ref) => false);
final examTimerProvider = StateProvider<int>((ref) => 45 * 60);
final examTimerActiveProvider = StateProvider<bool>((ref) => false);
final examQuestionStatusProvider = StateProvider<Map<int, QuestionStatus>>((ref) => {});
