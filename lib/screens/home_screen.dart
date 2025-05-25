import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/role_provider.dart';
import '../models/app_role.dart';
import 'learning_mode_screen.dart';
import 'exam_mode_screen.dart';
import 'statistics_screen.dart';
import 'role_selection_screen.dart';
import 'info_screen.dart'; // NEUER IMPORT für die Info-Seite

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(roleProvider);
    final theme = Theme.of(context);

    // Fallback, falls keine Rolle ausgewählt ist (sollte nicht passieren)
    if (selectedRole == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ModalRoute.of(context)?.isCurrent ?? false) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
                (Route<dynamic> route) => false,
          );
        }
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LAZ Gold Trainer', // Allgemeiner Titel
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Container(
            color: theme.primaryColorDark.withOpacity(0.5), // Subtiler Hintergrund für die Rolle
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            alignment: Alignment.center,
            child: Text(
              'Rolle: ${selectedRole.displayName}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Rolle wechseln',
            onPressed: () async {
              await ref.read(roleProvider.notifier).clearRole();
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
                      (Route<dynamic> route) => false,
                );
              }
            },
          ),
        ],
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0, // Sorgt für quadratischere Kacheln
          children: <Widget>[
            _buildDashboardCard(
              context,
              title: 'Lernmodus',
              icon: Icons.school_outlined,
              colors: [Colors.orange.shade400, Colors.orange.shade700],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningModeScreen()),
                );
              },
            ),
            _buildDashboardCard(
              context,
              title: 'Prüfungsmodus',
              icon: Icons.assignment_outlined,
              colors: [Colors.blue.shade400, Colors.blue.shade700],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExamModeScreen()), // const hinzugefügt
                );
              },
            ),
            _buildDashboardCard(
              context,
              title: 'Statistiken',
              icon: Icons.bar_chart_outlined,
              colors: [Colors.green.shade400, Colors.green.shade700],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatisticsScreen()),
                );
              },
            ),
            _buildDashboardCard(
              context,
              title: 'Info & Hilfe',
              icon: Icons.info_outline_rounded,
              colors: [Colors.purple.shade400, Colors.purple.shade700],
              onTap: () {
                // Navigation zur neuen InfoScreen-Seite
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required List<Color> colors, // Für den Farbverlauf
        required VoidCallback onTap,
      }) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0), // Stärkere Rundung
      ),
      clipBehavior: Clip.antiAlias, // Wichtig für den Farbverlauf innerhalb der Card-Rundung
      child: Material( // Material für den Ripple-Effekt auf dem Farbverlauf
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: colors.last.withOpacity(0.3),
          highlightColor: colors.first.withOpacity(0.2),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(12.0), // Etwas mehr Padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon, size: 55, color: Colors.white.withOpacity(0.95)), // Größeres Icon, leicht transparent
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17, // Leicht angepasste Schriftgröße
                      fontWeight: FontWeight.w600, // Etwas fetter
                      color: Colors.white,
                      shadows: [ // Subtiler Textschatten für bessere Lesbarkeit
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(1.0, 1.0),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
