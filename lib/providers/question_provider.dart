// lib/providers/question_provider.dart
import 'dart:math'; // Für Zufallszahlen
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question.dart';
import '../models/app_role.dart';
import '../services/question_service.dart';
import 'role_provider.dart';
import '../models/question_status.dart'; // NEUER IMPORT

// Provider für den QuestionService (bleibt gleich)
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

final learningBatchQuestionsProvider = Provider<List<Question>>((ref) {
  ref.watch(learningBatchSeedProvider);
  final allQuestions = ref.watch(allQuestionsProvider).asData?.value ?? [];
  final numberOfQuestions = ref.watch(numberOfQuestionsPerBatchProvider);
  if (allQuestions.isEmpty) return [];
  final random = Random();
  List<Question> shuffledQuestions = List.from(allQuestions)..shuffle(random);
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

// NEUER PROVIDER: Status der Fragen im aktuellen Prüfungsdurchlauf
// Key: question.id, Value: QuestionStatus
final examQuestionStatusProvider = StateProvider<Map<int, QuestionStatus>>((ref) => {});
