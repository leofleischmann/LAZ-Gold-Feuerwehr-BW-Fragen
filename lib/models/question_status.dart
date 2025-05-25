// lib/models/question_status.dart

enum QuestionStatus {
  notAnswered, // Noch nicht angesehen oder keine Antwort gegeben
  answered,    // Mindestens eine Option ausgewählt
  skipped,     // Explizit übersprungen oder weitergegangen ohne Antwort (optional, kann auch notAnswered sein)
  // Marked wird separat über den markedQuestionsProvider gehandhabt, kann aber hier für die UI kombiniert werden
}
