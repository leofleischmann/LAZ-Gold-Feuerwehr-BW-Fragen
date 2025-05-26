// lib/services/question_service.dart
import '../models/question.dart';
import '../models/app_role.dart';

// Importiere deine JSON-Daten-Dateien
// Stelle sicher, dass diese Dateien im 'lib/data/' Ordner existieren
// und die korrekten Variablennamen haben.
import '../data/fragen_mannschaft.dart';
import '../data/fragen_maschinist.dart';
import '../data/fragen_gruppenfuehrer.dart';

class QuestionService {
  Future<List<Question>> getQuestionsForRole(AppRole role) async {
    List<Map<String, dynamic>> questionsJsonList = [];

    // Lade die Fragen basierend auf der ausgewählten Rolle
    switch (role) {
      case AppRole.mannschaft:
        questionsJsonList = mannschaftFragenJson;
        break;
      case AppRole.maschinist:
        questionsJsonList = maschinistFragenJson;
        break;
      case AppRole.gruppenfuehrer:
        questionsJsonList = gruppenfuehrerFragenJson;
        break;
    }

    if (questionsJsonList.isEmpty) {
      // Fallback, falls keine Fragen für die Rolle geladen wurden oder die Liste leer ist
      print('Warnung: Keine Fragen für Rolle ${role.displayName} geladen oder Liste ist leer.');
      return Future.value([]); // Leere Liste zurückgeben
    }

    // Konvertiere die JSON-Liste in eine Liste von Question-Objekten
    try {
      return questionsJsonList.map((json) => Question.fromJson(json)).toList();
    } catch (e, stacktrace) {
      print('Fehler beim Parsen der Fragen für Rolle ${role.displayName}: $e');
      print('Stacktrace: $stacktrace');
      // Versuche, das problematische JSON-Objekt zu finden und auszugeben
      for (var i = 0; i < questionsJsonList.length; i++) {
        try {
          Question.fromJson(questionsJsonList[i]);
        } catch (parseError) {
          print('Fehlerhaftes JSON-Objekt an Index $i für Rolle ${role.displayName}: ${questionsJsonList[i]}');
          print('Parse-Fehler: $parseError');
          break; // Stoppe nach dem ersten fehlerhaften Objekt
        }
      }
      return Future.value([]); // Leere Liste im Fehlerfall zurückgeben
    }
  }
}
