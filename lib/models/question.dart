// Datenmodell für eine einzelne Frage, basierend auf Ihrer JSON-Struktur

class Question {
  final int id;
  final String questionText;
  final List<Option> options;
  final List<String> correctAnswers; // Liste der korrekten Antwort-Labels, z.B. ["a", "c"]

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswers,
  });

  // Factory-Konstruktor, um eine Question aus einer JSON-Map zu erstellen
  factory Question.fromJson(Map<String, dynamic> json) {
    // Sicherstellen, dass 'options' eine Liste ist und dann parsen
    var optionsFromJson = json['options'] as List?;
    List<Option> optionList = optionsFromJson?.map((i) => Option.fromJson(i as Map<String, dynamic>)).toList() ?? [];

    // Sicherstellen, dass 'correctAnswers' eine Liste von Strings ist
    var correctAnswersFromJson = json['correctAnswers'] as List?;
    List<String> correctAnswersList = correctAnswersFromJson?.map((e) => e.toString()).toList() ?? [];

    return Question(
      id: json['id'] as int,
      questionText: json['questionText'] as String,
      options: optionList,
      correctAnswers: correctAnswersList,
    );
  }

  // Methode, um eine Question zurück in eine JSON-Map zu konvertieren (optional)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionText': questionText,
      'options': options.map((option) => option.toJson()).toList(),
      'correctAnswers': correctAnswers,
    };
  }
}

class Option {
  final String label; // z.B. "a", "b", "c"
  final String text;  // Der Text der Antwortmöglichkeit
  final String? explanation; // Die Erklärung, kann null sein

  Option({
    required this.label,
    required this.text,
    this.explanation,
  });

  // Factory-Konstruktor, um eine Option aus einer JSON-Map zu erstellen
  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      label: json['label'] as String,
      text: json['text'] as String,
      explanation: json['explanation'] as String?,
    );
  }

  // Methode, um eine Option zurück in eine JSON-Map zu konvertieren (optional)
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'text': text,
      'explanation': explanation,
    };
  }
}
