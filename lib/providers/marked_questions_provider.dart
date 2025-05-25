// lib/providers/marked_questions_provider.dart
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laz_gold_bw/providers/role_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_role.dart';

const String _markedQuestionsKeyPrefix = 'markedQuestions_';

class MarkedQuestionsNotifier extends StateNotifier<Map<AppRole, Set<int>>> {
  MarkedQuestionsNotifier() : super({}) {
    _loadAllMarkedQuestions();
  }

  Future<void> _loadAllMarkedQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<AppRole, Set<int>> allMarks = {};
    for (AppRole role in AppRole.values) {
      final String? markedJson = prefs.getString(_markedQuestionsKeyPrefix + role.toString());
      if (markedJson != null) {
        try {
          final List<dynamic> idList = jsonDecode(markedJson) as List<dynamic>;
          allMarks[role] = idList.map((id) => id as int).toSet();
        } catch (e) {
          print("Fehler beim Laden markierter Fragen für Rolle $role: $e");
          allMarks[role] = {};
        }
      } else {
        allMarks[role] = {};
      }
    }
    state = allMarks;
  }

  Future<void> _saveMarkedQuestionsForRole(AppRole role) async {
    final prefs = await SharedPreferences.getInstance();
    final Set<int> markedForRole = state[role] ?? {};
    await prefs.setString(_markedQuestionsKeyPrefix + role.toString(), jsonEncode(markedForRole.toList()));
  }

  void toggleQuestionMark(AppRole role, int questionId) {
    final Map<AppRole, Set<int>> newState = Map.from(state); // Kopie erstellen
    final Set<int> markedForRole = Set.from(newState[role] ?? {}); // Kopie des Sets für die Rolle

    if (markedForRole.contains(questionId)) {
      markedForRole.remove(questionId);
    } else {
      markedForRole.add(questionId);
    }

    newState[role] = markedForRole;
    state = newState;
    _saveMarkedQuestionsForRole(role);
  }

  bool isQuestionMarked(AppRole role, int questionId) {
    return state[role]?.contains(questionId) ?? false;
  }

  // Optional: Methode zum Zurücksetzen aller Markierungen für eine Rolle
  Future<void> clearMarksForRole(AppRole role) async {
    final Map<AppRole, Set<int>> newState = Map.from(state);
    newState[role] = {};
    state = newState;
    await _saveMarkedQuestionsForRole(role);
  }

  // Optional: Methode zum Zurücksetzen aller Markierungen
  Future<void> clearAllMarks() async {
    state = {};
    final prefs = await SharedPreferences.getInstance();
    for (AppRole role in AppRole.values) {
      await prefs.remove(_markedQuestionsKeyPrefix + role.toString());
    }
  }
}

final markedQuestionsProvider = StateNotifierProvider<MarkedQuestionsNotifier, Map<AppRole, Set<int>>>((ref) {
  return MarkedQuestionsNotifier();
});

// Ein spezifischer Provider, der nur das Set der markierten IDs für die aktuell ausgewählte Rolle liefert.
// Dies kann helfen, unnötige Rebuilds zu vermeiden, wenn sich Markierungen für andere Rollen ändern.
final currentRoleMarkedQuestionsProvider = Provider<Set<int>>((ref) {
  final currentRole = ref.watch(roleProvider);
  final allMarkedQuestions = ref.watch(markedQuestionsProvider);
  if (currentRole == null) {
    return const <int>{};
  }
  return allMarkedQuestions[currentRole] ?? const <int>{};
});
