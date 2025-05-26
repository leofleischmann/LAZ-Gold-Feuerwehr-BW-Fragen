// lib/providers/role_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_role.dart';

// StateNotifier für die Verwaltung der ausgewählten Rolle
class RoleNotifier extends StateNotifier<AppRole?> {
  RoleNotifier([AppRole? initialRole]) : super(initialRole);

  // Methode zur Auswahl einer Rolle und zum Speichern in SharedPreferences
  Future<void> selectRole(AppRole role) async {
    state = role;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedRole', role.toString());
  }

  // Methode zum Zurücksetzen der Rolle (z.B. für Rollenwechsel)
  Future<void> clearRole() async {
    state = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedRole');
  }
}

// Provider für den RoleNotifier
final roleProvider = StateNotifierProvider<RoleNotifier, AppRole?>((ref) {
  // Der initiale Status wird in main.dart über `overrides` gesetzt, falls vorhanden.
  // Ansonsten startet es mit null.
  return RoleNotifier();
});