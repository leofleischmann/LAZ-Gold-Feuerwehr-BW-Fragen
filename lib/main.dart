// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/role_selection_screen.dart';
import 'screens/home_screen.dart';
import 'providers/role_provider.dart';
import 'models/app_role.dart';

// Globaler Key für den Navigator, um von überall navigieren zu können (mit Vorsicht verwenden)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // Sicherstellen, dass Flutter Widgets initialisiert sind, bevor Plugins verwendet werden
  WidgetsFlutterBinding.ensureInitialized();

  // Lade die gespeicherte Rolle beim App-Start
  final prefs = await SharedPreferences.getInstance();
  final savedRoleString = prefs.getString('selectedRole');
  AppRole? initialRole;
  if (savedRoleString != null) {
    try {
      initialRole = AppRole.values.firstWhere((e) => e.toString() == savedRoleString);
    } catch (e) {
      // Falls der gespeicherte Wert ungültig ist
      print('Ungültige gespeicherte Rolle: $savedRoleString');
      initialRole = null;
    }
  }

  runApp(
    ProviderScope(
      overrides: [
        // KORRIGIERTE ZEILE:
        // Überschreibe den initialen Status des roleProvider, falls eine Rolle gespeichert wurde
        if (initialRole != null)
          roleProvider.overrideWith((_) => RoleNotifier(initialRole)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(roleProvider);

    return MaterialApp(
      navigatorKey: navigatorKey, // Navigator-Key setzen
      title: 'Feuerwehr Lern-App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
          primary: Colors.red[700],
          secondary: Colors.amber[700],
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[700],
          foregroundColor: Colors.white,
          elevation: 4.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[600],
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: TextStyle(fontSize: 16),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: selectedRole == null ? RoleSelectionScreen() : HomeScreen(),
    );
  }
}
