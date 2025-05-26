import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_role.dart';
import '../providers/role_provider.dart';
import 'home_screen.dart'; // Import für die Navigation

class RoleSelectionScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rolle auswählen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: AppRole.values.map((role) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: Text(role.displayName),
                  onPressed: () async {
                    await ref.read(roleProvider.notifier).selectRole(role);
                    // Nach der Rollenauswahl zum HomeScreen navigieren und den RoleSelectionScreen entfernen
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                          (Route<dynamic> route) => false, // Entfernt alle vorherigen Routen
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}