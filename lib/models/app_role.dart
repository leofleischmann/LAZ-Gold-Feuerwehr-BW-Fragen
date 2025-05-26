// Enum zur Definition der verschiedenen Rollen in der Feuerwehr
enum AppRole {
  mannschaft,
  maschinist,
  gruppenfuehrer,
}

// Erweiterung für AppRole, um einen benutzerfreundlichen Namen zu erhalten
extension AppRoleExtension on AppRole {
  String get displayName {
    switch (this) {
      case AppRole.mannschaft:
        return 'Mannschaft';
      case AppRole.maschinist:
        return 'Maschinist';
      case AppRole.gruppenfuehrer:
        return 'Gruppenführer';
      default:
        return '';
    }
  }
}