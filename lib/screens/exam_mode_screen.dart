// lib/screens/exam_mode_screen.dart
import 'dart:async'; // Für den Timer
import 'package:flutter/foundation.dart'; // Für kDebugMode
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_role.dart';
import '../models/question.dart';
import '../models/question_status.dart';
import '../providers/question_provider.dart';
import '../providers/role_provider.dart';
import '../providers/statistics_provider.dart';
import '../models/statistics_data.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'exam_review_screen.dart';
import '../providers/marked_questions_provider.dart';

const int TOTAL_EXAM_QUESTIONS = 30;
const int EXAM_DURATION_MINUTES = 45;

class ExamModeScreen extends ConsumerStatefulWidget {
  const ExamModeScreen({super.key});

  @override
  _ExamModeScreenState createState() => _ExamModeScreenState();
}

class _ExamModeScreenState extends ConsumerState<ExamModeScreen> {
  Timer? _timer;
  ExamAttempt? _currentAttemptForReview;
  bool _isInitializingExam = false;
  final ScrollController _questionScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Die Logik zum Starten einer neuen Prüfung wird nun hauptsächlich
    // durch den Listener auf allQuestionsProvider und den Zustand von examQuestionsProvider
    // sowie durch die build-Methode selbst gesteuert.
  }

  Future<void> _startNewExam([List<Question>? allQuestionsParam]) async {
    if (!mounted) return;
    if (_isInitializingExam && allQuestionsParam == null) {
      if (kDebugMode) {
        print("ExamModeScreen: _startNewExam wird bereits ausgeführt oder ist im Begriff zu starten.");
      }
      return;
    }

    setState(() {
      _isInitializingExam = true;
    });

    await Future.delayed(const Duration(milliseconds: 50));

    final allQuestions = allQuestionsParam ?? ref.read(allQuestionsProvider).asData?.value ?? [];
    final currentRole = ref.read(roleProvider);

    if (allQuestions.isEmpty && currentRole != null) {
      if (mounted) {
        ref.read(examQuestionsProvider.notifier).state = [];
        setState(() {
          _isInitializingExam = false;
        });
        if (kDebugMode) {
          print("ExamModeScreen: Keine Fragen für Rolle ${currentRole.displayName} verfügbar, um neue Prüfung zu starten.");
        }
      }
      return;
    }
    if (allQuestions.isEmpty && currentRole == null){
      if (mounted) {
        setState(() {
          _isInitializingExam = false;
        });
        if (kDebugMode) {
          print("ExamModeScreen: Keine Rolle ausgewählt, kann keine Prüfung starten.");
        }
      }
      return;
    }

    final random = Random();
    List<Question> shuffledQuestions = List.from(allQuestions)..shuffle(random);
    final examBatch = shuffledQuestions.take(min(TOTAL_EXAM_QUESTIONS, shuffledQuestions.length)).toList();
    _currentAttemptForReview = null;

    if (mounted) {
      ref.read(examQuestionsProvider.notifier).state = examBatch;
      ref.read(currentExamQuestionIndexProvider.notifier).state = 0;
      ref.read(selectedExamAnswersProvider.notifier).state = {};
      ref.read(examSubmittedProvider.notifier).state = false;
      ref.read(examTimerProvider.notifier).state = EXAM_DURATION_MINUTES * 60;
      ref.read(examTimerActiveProvider.notifier).state = true;

      final Map<int, QuestionStatus> initialStatus = {};
      for (var q in examBatch) {
        initialStatus[q.id] = QuestionStatus.notAnswered;
      }
      ref.read(examQuestionStatusProvider.notifier).state = initialStatus;

      if (currentRole != null) {
        await ref.read(markedQuestionsProvider.notifier).clearMarksForRole(currentRole);
      }

      _startTimer();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if(mounted) {
          setState(() {
            _isInitializingExam = false;
          });
        }
      });
      if (kDebugMode) {
        print("ExamModeScreen: Neue Prüfung gestartet mit ${examBatch.length} Fragen.");
      }
    } else {
      _isInitializingExam = false;
    }
  }

  void _startTimer() {
    _timer?.cancel();
    if (!mounted || !ref.read(examTimerActiveProvider)) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (ref.read(examTimerActiveProvider)) {
        final currentTime = ref.read(examTimerProvider);
        if (currentTime > 0) {
          ref.read(examTimerProvider.notifier).state = currentTime - 1;
        } else {
          if (mounted && !ref.read(examSubmittedProvider)) {
            _submitExam(timeout: true);
          }
          timer.cancel();
        }
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _submitExam({bool timeout = false}) async {
    if (!mounted || ref.read(examSubmittedProvider)) return;

    _timer?.cancel();
    ref.read(examTimerActiveProvider.notifier).state = false;

    final examQuestions = ref.read(examQuestionsProvider);
    final selectedAnswers = ref.read(selectedExamAnswersProvider);
    final currentRole = ref.read(roleProvider);

    if (currentRole == null || examQuestions.isEmpty) {
      if (mounted) {
        _currentAttemptForReview = null;
        ref.read(examSubmittedProvider.notifier).state = true;
      }
      return;
    }

    int totalAchievedPoints = 0;
    int totalPossiblePoints = 0;

    for (var question in examQuestions) {
      // Jede AntwortMÖGLICHKEIT (Option) ist einen Punkt wert, wenn korrekt behandelt.
      totalPossiblePoints += question.options.length;

      final userSelectedOptionsForThisQuestion = selectedAnswers[question.id] ?? {};

      for (var option in question.options) {
        bool isOptionCorrectProvidedInQuestion = question.correctAnswers.contains(option.label);
        bool wasOptionSelectedByUser = userSelectedOptionsForThisQuestion.contains(option.label);

        if (isOptionCorrectProvidedInQuestion) {
          // Option ist eine der richtigen Antworten laut Fragendefinition
          if (wasOptionSelectedByUser) {
            totalAchievedPoints++; // Richtig angekreuzt
          }
        } else {
          // Option ist eine der falschen Antworten laut Fragendefinition
          if (!wasOptionSelectedByUser) {
            totalAchievedPoints++; // Falsch (laut Definition), und korrekterweise NICHT angekreuzt
          }
        }
      }
    }

    final attempt = ExamAttempt(
      date: DateTime.now(),
      totalPossiblePoints: totalPossiblePoints,
      achievedPoints: totalAchievedPoints,
      role: currentRole,
    );

    if (mounted) {
      setState(() {
        _currentAttemptForReview = attempt;
      });
    }

    await ref.read(statisticsProvider.notifier).addExamAttempt(currentRole, attempt);

    if (mounted) {
      ref.read(examSubmittedProvider.notifier).state = true;
      if (timeout) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Zeit abgelaufen! Prüfung wurde automatisch ausgewertet.'), duration: Duration(seconds: 3)),
        );
      }
    }
  }

  void _updateQuestionStatusOnNavigate(int questionId) {
    final currentQuestionSelections = ref.read(selectedExamAnswersProvider)[questionId] ?? {};
    QuestionStatus newStatus;
    if (currentQuestionSelections.isEmpty) {
      newStatus = QuestionStatus.notAnswered;
    } else {
      newStatus = QuestionStatus.answered;
    }

    final currentStatusMap = ref.read(examQuestionStatusProvider);
    if (currentStatusMap[questionId] != newStatus) {
      ref.read(examQuestionStatusProvider.notifier).update((state) {
        final newState = Map<int, QuestionStatus>.from(state);
        newState[questionId] = newStatus;
        return newState;
      });
    }
  }

  void _jumpToQuestion(int index) {
    final examQuestions = ref.read(examQuestionsProvider);
    if (index >= 0 && index < examQuestions.length) {
      final currentQuestionId = examQuestions[ref.read(currentExamQuestionIndexProvider)].id;
      _updateQuestionStatusOnNavigate(currentQuestionId);
      ref.read(currentExamQuestionIndexProvider.notifier).state = index;
    }
  }

  void _resetExamProgressOnLeave() {
    if (kDebugMode) {
      print("ExamModeScreen: _resetExamProgressOnLeave aufgerufen.");
    }
    _timer?.cancel();
    ref.read(examTimerActiveProvider.notifier).state = false;
    ref.read(examTimerProvider.notifier).state = EXAM_DURATION_MINUTES * 60;

    ref.read(selectedExamAnswersProvider.notifier).state = {};
    ref.read(currentExamQuestionIndexProvider.notifier).state = 0;
    ref.read(examQuestionStatusProvider.notifier).state = {};

    ref.read(examQuestionsProvider.notifier).state = [];
    ref.read(examSubmittedProvider.notifier).state = false;
  }

  Future<bool> _onWillPop() async {
    final isSubmitted = ref.read(examSubmittedProvider);
    if (!isSubmitted && mounted) {
      final shouldPop = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Prüfung abbrechen?'),
          content: const Text('Möchten Sie die laufende Prüfung wirklich verlassen? Ihr aktueller Fortschritt geht dabei verloren und die Prüfung wird zurückgesetzt.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Nein, weiter prüfen'),
            ),
            TextButton(
              onPressed: () {
                _resetExamProgressOnLeave();
                Navigator.of(context).pop(true);
              },
              child: const Text('Ja, verlassen', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      );
      return shouldPop ?? false;
    }
    return true;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _questionScrollController.dispose();
    super.dispose();
  }

  String _formatDuration(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final selectedRole = ref.watch(roleProvider);
    final allQuestionsState = ref.watch(allQuestionsProvider);
    final examQuestions = ref.watch(examQuestionsProvider);
    final currentQuestionIndex = ref.watch(currentExamQuestionIndexProvider);
    final isSubmitted = ref.watch(examSubmittedProvider);
    final timeLeft = ref.watch(examTimerProvider);
    final theme = Theme.of(context);

    ref.listen<AsyncValue<List<Question>>>(allQuestionsProvider, (previous, next) {
      final examQsCurrentlySet = ref.read(examQuestionsProvider);
      final submittedState = ref.read(examSubmittedProvider);

      if (next is AsyncData<List<Question>> && next.value.isNotEmpty && examQsCurrentlySet.isEmpty && !submittedState) {
        if (kDebugMode) {
          print("ExamModeScreen Listener: Starte neue Prüfung via Listener.");
        }
        if (!_isInitializingExam) {
          _startNewExam(next.value);
        }
      } else if (next is AsyncData<List<Question>> && next.value.isEmpty && examQsCurrentlySet.isEmpty && !submittedState) {
        if (kDebugMode) {
          print("ExamModeScreen Listener: Alle Fragen geladen, aber Liste für Rolle ist leer.");
        }
      }
    });

    if (allQuestionsState.isLoading || _isInitializingExam) {
      return Scaffold(
        appBar: AppBar(title: Text(selectedRole?.displayName ?? 'Prüfungsmodus')),
        body: Center(child: CircularProgressIndicator(color: theme.colorScheme.primary)),
      );
    }

    if (allQuestionsState.hasError) {
      return Scaffold(
        appBar: AppBar(title: Text(selectedRole?.displayName ?? 'Prüfungsmodus')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline_rounded, size: 52, color: Colors.red.shade600),
                const SizedBox(height: 16),
                Text(
                  'Fehler beim Laden der Fragenbasis.',
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
        ),
      );
    }

    if (examQuestions.isEmpty && !isSubmitted) {
      final allLoadedQuestions = allQuestionsState.asData?.value;
      if (allLoadedQuestions != null && allLoadedQuestions.isNotEmpty && !_isInitializingExam) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && ref.read(examQuestionsProvider).isEmpty && !ref.read(examSubmittedProvider) && !_isInitializingExam) {
            if (kDebugMode) {
              print("ExamModeScreen Build: Triggering _startNewExam automatisch.");
            }
            _startNewExam(allLoadedQuestions);
          }
        });
        return Scaffold(
          appBar: AppBar(title: Text(selectedRole?.displayName ?? 'Prüfungsmodus')),
          body: Center(child: CircularProgressIndicator(color: theme.colorScheme.primary)),
        );
      } else {
        return Scaffold(
          appBar: AppBar(title: Text(selectedRole?.displayName ?? 'Prüfungsmodus')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.quiz_outlined, size: 52, color: Colors.blueGrey[300]),
                  const SizedBox(height: 16),
                  Text(
                    _isInitializingExam ? 'Prüfung wird initialisiert...' : 'Prüfung wird vorbereitet...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey[700], fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    (allQuestionsState.asData?.value ?? []).isEmpty
                        ? 'Keine Fragen für die Rolle "${selectedRole?.displayName ?? "unbekannt"}" verfügbar.'
                        : 'Bitte warten.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.blueGrey[500]),
                  ),
                  if ((allQuestionsState.asData?.value ?? []).isEmpty && selectedRole != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Für die Rolle "${selectedRole.displayName}" konnten keine Fragen geladen werden.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.red[700]),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }
    }


    if (isSubmitted) {
      final attemptToReview = _currentAttemptForReview ??
          (ref.watch(statisticsProvider).getExamHistoryForRole(selectedRole!).isNotEmpty
              ? ref.watch(statisticsProvider).getExamHistoryForRole(selectedRole!).last
              : null);
      return Scaffold(
          appBar: AppBar(
            title: Text(selectedRole?.displayName ?? 'Prüfungsergebnis'),
            automaticallyImplyLeading: false,
          ),
          body: _buildExamResultView(context, ref, attemptToReview));
    }

    if (currentQuestionIndex >= examQuestions.length && examQuestions.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          if (kDebugMode) {
            print("ExamModeScreen: currentQuestionIndex ist außerhalb des Bereichs, starte neue Prüfung.");
          }
          _startNewExam(allQuestionsState.asData?.value);
        }
      });
      return Scaffold(
          appBar: AppBar(title: Text(selectedRole?.displayName ?? 'Prüfungsmodus')),
          body: Center(child: CircularProgressIndicator(color: theme.colorScheme.primary)));
    }

    if (examQuestions.isEmpty) {
      return Scaffold(
          appBar: AppBar(title: Text(selectedRole?.displayName ?? 'Prüfungsmodus')),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Fehler: Keine Fragen für die Prüfung geladen.'),
                  ElevatedButton(
                      onPressed: () => _startNewExam(allQuestionsState.asData?.value),
                      child: const Text('Neue Prüfung versuchen'))
                ],
              )
          )
      );
    }

    final currentQuestion = examQuestions[currentQuestionIndex];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(selectedRole?.displayName ?? 'Prüfungsmodus'),
          elevation: 2.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  'Zeit: ${_formatDuration(timeLeft)}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: timeLeft < (5 * 60)
                          ? (timeLeft < 60 ? Colors.red.shade700 : Colors.orange.shade600)
                          : Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: examQuestions.isNotEmpty ? (currentQuestionIndex + 1) / examQuestions.length : 0,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
              minHeight: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Frage ${currentQuestionIndex + 1} von ${examQuestions.length}',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                  if (selectedRole != null)
                    Consumer(builder: (context, ref, child) {
                      final isMarked = ref.watch(markedQuestionsProvider.select(
                              (marks) => marks[selectedRole]?.contains(currentQuestion.id) ?? false));
                      return IconButton(
                        icon: Icon(
                          isMarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                          color: isMarked ? theme.colorScheme.secondary : Colors.grey.shade600,
                          size: 28,
                        ),
                        tooltip: isMarked ? 'Markierung entfernen' : 'Frage markieren',
                        onPressed: () {
                          ref.read(markedQuestionsProvider.notifier).toggleQuestionMark(selectedRole, currentQuestion.id);
                        },
                      );
                    })
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ExamQuestionCard(
                  question: currentQuestion,
                  key: ValueKey("${currentQuestion.id}_exam_${currentQuestionIndex}_${examQuestions.hashCode}"),
                ),
              ),
            ),
            QuestionNavigationAndStatusRow(
              totalQuestions: examQuestions.length,
              currentIndex: currentQuestionIndex,
              onQuestionTap: (index) {
                _jumpToQuestion(index);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                      label: const Text('Zurück', overflow: TextOverflow.ellipsis, maxLines: 1),
                      onPressed: currentQuestionIndex > 0
                          ? () {
                        _updateQuestionStatusOnNavigate(currentQuestion.id);
                        ref.read(currentExamQuestionIndexProvider.notifier).state--;
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade600,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          textStyle: const TextStyle(fontSize: 15)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      label: Text(
                        currentQuestionIndex == examQuestions.length - 1 ? 'Prüfung abgeben' : 'Weiter / Überspringen',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      icon: Icon(
                          currentQuestionIndex == examQuestions.length - 1
                              ? Icons.done_all_rounded
                              : Icons.arrow_forward_ios_rounded,
                          size: 18),
                      onPressed: () async {
                        _updateQuestionStatusOnNavigate(currentQuestion.id);
                        if (currentQuestionIndex == examQuestions.length - 1) {
                          await _submitExam();
                        } else {
                          ref.read(currentExamQuestionIndexProvider.notifier).state++;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          textStyle: const TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExamResultView(BuildContext context, WidgetRef ref, ExamAttempt? attemptToDisplay) {
    final selectedRole = ref.watch(roleProvider);
    final theme = Theme.of(context);

    if (selectedRole == null) {
      return const Center(child: Text("Fehler: Keine Rolle ausgewählt."));
    }
    final ExamAttempt? lastAttempt = attemptToDisplay;

    if (lastAttempt == null) {
      return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: Colors.red.shade700, size: 48),
                const SizedBox(height: 16),
                const Text("Kein aktuelles Prüfungsergebnis für die Anzeige gefunden.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text("Neue Prüfung starten"),
                  onPressed: () => _startNewExam(ref.read(allQuestionsProvider).asData?.value),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('Zurück zum Hauptmenü'),
                  onPressed: () {
                    if(Navigator.canPop(context)) Navigator.of(context).pop();
                  },
                )
              ],
            ),
          )
      );
    }

    final List<Question> questionsOfThisExam = ref.read(examQuestionsProvider);
    final Map<int, Set<String>> answersOfThisExam = ref.read(selectedExamAnswersProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            lastAttempt.passed ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: lastAttempt.passed ? Colors.green.shade600 : Colors.red.shade600,
            size: 80,
          ),
          const SizedBox(height: 16),
          Text(
            lastAttempt.passed ? "Prüfung Bestanden!" : "Prüfung Nicht Bestanden",
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: lastAttempt.passed ? Colors.green.shade700 : Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    "Ihr Ergebnis:",
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "${lastAttempt.achievedPoints} / ${lastAttempt.totalPossiblePoints} Punkte erreicht",
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "(${lastAttempt.percentage.toStringAsFixed(1)}%)",
                    style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Datum: ${DateFormat('dd.MM.yyyy, HH:mm').format(lastAttempt.date)} Uhr",
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            icon: const Icon(Icons.checklist_rtl_rounded),
            label: const Text('Antworten überprüfen'),
            onPressed: () {
              if (questionsOfThisExam.isNotEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ExamReviewScreen(
                    examQuestions: questionsOfThisExam,
                    selectedAnswers: answersOfThisExam,
                    attemptDetails: lastAttempt,
                  ),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Keine Daten für die Überprüfung verfügbar.')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 17)
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Neue Prüfung starten'),
            onPressed: () => _startNewExam(ref.read(allQuestionsProvider).asData?.value),
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 17),
                side: BorderSide(color: theme.colorScheme.primary, width: 1.5)
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.home_rounded),
            label: const Text('Zurück zum Hauptmenü'),
            onPressed: () {
              if(Navigator.canPop(context)) Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 17),
                side: BorderSide(color: Colors.grey.shade600, width: 1.5)
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionNavigationAndStatusRow extends ConsumerWidget {
  final int totalQuestions;
  final int currentIndex;
  final Function(int) onQuestionTap;

  const QuestionNavigationAndStatusRow({
    super.key,
    required this.totalQuestions,
    required this.currentIndex,
    required this.onQuestionTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (totalQuestions == 0) return const SizedBox.shrink();

    final questionStatusMap = ref.watch(examQuestionStatusProvider);
    final examQuestions = ref.watch(examQuestionsProvider);
    final currentRole = ref.watch(roleProvider);
    final markedQuestions = ref.watch(currentRoleMarkedQuestionsProvider);
    final theme = Theme.of(context);

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, -2),
            )
          ]
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: totalQuestions,
        itemBuilder: (context, index) {
          if (index >= examQuestions.length) return const SizedBox.shrink();
          final questionId = examQuestions[index].id;
          final status = questionStatusMap[questionId] ?? QuestionStatus.notAnswered;
          final isMarked = currentRole != null && markedQuestions.contains(questionId);

          Color itemColor = Colors.grey.shade400;
          if (status == QuestionStatus.answered) {
            itemColor = theme.colorScheme.primary;
          } else if (status == QuestionStatus.skipped) {
            itemColor = Colors.orange.shade400;
          }

          Color highlightColor = isMarked ? theme.colorScheme.secondary : itemColor;


          return GestureDetector(
            onTap: () => onQuestionTap(index),
            child: Container(
              width: 42,
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                color: currentIndex == index ? highlightColor.withOpacity(0.3) : highlightColor.withOpacity(0.15),
                border: Border.all(
                  color: currentIndex == index ? theme.colorScheme.primary : highlightColor,
                  width: currentIndex == index ? 2.2 : 1.2,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: currentIndex == index ? theme.colorScheme.primary : itemColor,
                      fontWeight: currentIndex == index ? FontWeight.bold : FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  if (isMarked)
                    Positioned(
                      top: 2,
                      right: 2,
                      child: Icon(
                        Icons.bookmark_rounded,
                        color: theme.colorScheme.secondary.withOpacity(0.9),
                        size: 12,
                      ),
                    ),
                  if (status == QuestionStatus.answered && !isMarked)
                    Positioned(
                      bottom: 2,
                      left: 2,
                      child: Icon(
                        Icons.check_circle_outline_rounded,
                        color: theme.colorScheme.primary.withOpacity(0.9),
                        size: 12,
                      ),
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

class ExamQuestionCard extends ConsumerWidget {
  final Question question;

  const ExamQuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOptionsForThisQuestion = ref.watch(
        selectedExamAnswersProvider.select((map) => map[question.id] ?? const <String>{})
    );
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.grey.shade300, width: 0.8)
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.questionText,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, height: 1.4, color: Colors.black.withOpacity(0.9)),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: question.options.length,
                itemBuilder: (context, optionIndex) {
                  final option = question.options[optionIndex];
                  bool isSelected = selectedOptionsForThisQuestion.contains(option.label);
                  IconData checkboxIcon = isSelected ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded;
                  Color checkboxColor = isSelected ? theme.colorScheme.primary : Colors.grey.shade700;
                  Color optionBorderColor = isSelected ? theme.colorScheme.primary.withOpacity(0.8) : Colors.grey.shade400;
                  Color optionBackgroundColor = isSelected ? theme.colorScheme.primary.withOpacity(0.05) : Colors.transparent;

                  return Material(
                    color: optionBackgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      onTap: () {
                        final currentSelectionsMap = Map<int, Set<String>>.from(ref.read(selectedExamAnswersProvider));
                        final questionSelections = Set<String>.from(currentSelectionsMap[question.id] ?? {});

                        if (questionSelections.contains(option.label)) {
                          questionSelections.remove(option.label);
                        } else {
                          questionSelections.add(option.label);
                        }
                        currentSelectionsMap[question.id] = questionSelections;
                        ref.read(selectedExamAnswersProvider.notifier).state = currentSelectionsMap;

                        // Status-Update Logik
                        ref.read(examQuestionStatusProvider.notifier).update((state) {
                          final newState = Map<int, QuestionStatus>.from(state);
                          if (questionSelections.isEmpty) {
                            newState[question.id] = QuestionStatus.notAnswered;
                          } else {
                            newState[question.id] = QuestionStatus.answered;
                          }
                          return newState;
                        });
                      },
                      borderRadius: BorderRadius.circular(8.0),
                      splashColor: theme.colorScheme.primary.withOpacity(0.1),
                      highlightColor: theme.colorScheme.primary.withOpacity(0.05),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: optionBorderColor, width: 1.2)
                        ),
                        child: Row(
                          children: [
                            Icon(checkboxIcon, color: checkboxColor, size: 26),
                            const SizedBox(width: 12),
                            Expanded(child: Text(option.text, style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.85), height: 1.35))),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
