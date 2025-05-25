// lib/screens/info_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import für Clipboard

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  final String _sourceUrlLFS =
      'https://www.lfs-bw.de/fileadmin/LFS-BW/themen/wettbewerb/dokumente/UEbungsfragen_Leistungsabzeichen_Gold_2017.pdf';
  final String _sourceUrlGitHub =
      'https://github.com/leofleischmann/LAZ-Gold-Feuerwehr-BW-Fragen';

  Future<void> _copyToClipboard(BuildContext context, String textToCopy, String successMessage) async {
    await Clipboard.setData(ClipboardData(text: textToCopy));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(successMessage),
        backgroundColor: Colors.green[700],
      ),
    );
  }

  // Die _showErrorSnackBar wird hier nicht mehr direkt benötigt,
  // da das Öffnen von URLs entfernt wurde.
  // void _showErrorSnackBar(BuildContext context, String urlString) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Link konnte nicht geöffnet werden: $urlString'),
  //       backgroundColor: Colors.red[700],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info & Hilfe'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Über diese App',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Diese App wurde von der Freiwilligen Feuerwehr Gottmadingen, Abteilung Randegg, entwickelt, um bei der Vorbereitung auf das Feuerwehr-Leistungsabzeichen Baden-Württemberg in Gold zu unterstützen.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Haftungsausschluss',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Für die Richtigkeit und Vollständigkeit der in dieser App enthaltenen Fragen und Antworten wird keine Gewähr übernommen. Die Nutzung erfolgt auf eigene Verantwortung.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Quellen & Entwicklung',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Die verwendeten Übungsfragen für das Leistungsabzeichen Gold basieren auf der Veröffentlichung der Landesfeuerwehrschule Baden-Württemberg (Link zum Kopieren antippen):',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => _copyToClipboard(context, _sourceUrlLFS, 'Link zur LFS-Quelle kopiert!'),
                      child: Tooltip(
                        message: 'Link kopieren: $_sourceUrlLFS',
                        child: Text(
                          _sourceUrlLFS,
                          style: TextStyle(
                            fontSize: 15,
                            color: theme.colorScheme.secondary,
                            decoration: TextDecoration.underline,
                            decorationColor: theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Der Quellcode dieser App ist öffentlich einsehbar auf GitHub (Link zum Kopieren antippen):',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => _copyToClipboard(context, _sourceUrlGitHub, 'GitHub-Link kopiert!'),
                      child: Tooltip(
                        message: 'Link kopieren: $_sourceUrlGitHub',
                        child: Text(
                          _sourceUrlGitHub,
                          style: TextStyle(
                            fontSize: 15,
                            color: theme.colorScheme.secondary,
                            decoration: TextDecoration.underline,
                            decorationColor: theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Die Row mit den Buttons wurde entfernt.
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Entwickler & Kontakt',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Freiwillige Feuerwehr Gottmadingen\nAbteilung Randegg\n\nFür Feedback oder bei Fragen melden sie sich bitte über Github.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
