# LAZ-Gold-Feuerwehr-BW-Fragen
Repo für alle Fragen für das Feuerwehr Leistungsabzeichen Gold in Baden-Württemberg 

Quelle: https://www.lfs-bw.de/fileadmin/LFS-BW/themen/wettbewerb/dokumente/UEbungsfragen_Leistungsabzeichen_Gold_2017.pdf

# Der Quellcode für die App befindet sich in /lib
---
# Fun Fact:

![Entscheidungsbaum](https://github.com/leofleischmann/LAZ-Gold-Feuerwehr-BW-Fragen/blob/fdd0bab6832b1dddb262328398e8a37a4870e827/decision_tree_full_large.png)

# Entscheidungsbaum-Analyse der Fragen

Dieser Entscheidungsbaum ist das Ergebnis eines Experiments, bei dem eine Strategie entwickelt wurde, um die 90 Testfragen basierend auf dem Datensatz für `Mannschaft.json`) optimal zu beantworten.

**Erfolgsaussicht mit diesem Baum:**
Wenn man die Entscheidungslogik dieses spezifischen, maximal komplexen Baumes auf die bekannten 90 Fragen anwendet, ergibt eine Simulation (10.000 Durchläufe) für eine zufällig zusammengestellte Prüfung aus 30 Fragen eine **geschätzte Bestehenswahrscheinlichkeit von 100 %** (basierend auf dem Erreichen von mindestens 75 % der Gesamtpunkte in der simulierten Prüfung).


### Verwendete Merkmale (Features) zur Erstellung des Baumes:

Der Baum trifft seine Entscheidungen basierend auf den folgenden Merkmalen, die für jede Antwortoption aus den Fragen extrahiert wurden:

1.  **`option_text_laenge`**:
    * Die Anzahl der Wörter im Text der jeweiligen Antwortoption.
2.  **`frage_text_laenge`**:
    * Die Anzahl der Wörter im Text der zugehörigen Frage.
3.  **`anzahl_optionen_in_frage`**:
    * Die Gesamtzahl der Antwortmöglichkeiten für die aktuelle Frage.
4.  **`enthaelt_nicht_option`**:
    * Ein Ja/Nein-Wert (1/0), ob das Wort "nicht" im Text der Antwortoption vorkommt.
5.  **`enthaelt_immer_nie_nur_option`**:
    * Ein Ja/Nein-Wert (1/0), ob eines der Wörter "immer", "nie" oder "nur" im Text der Antwortoption vorkommt.
6.  **`enthaelt_zahl_option`**:
    * Ein Ja/Nein-Wert (1/0), ob eine Ziffer (0-9) im Text der Antwortoption vorkommt.
7.  **`option_position_numeric`**:
    * Die numerische Position der Antwortoption (z.B. a=0, b=1, c=2,...).
8.  **`frage_enthaelt_nicht_kein`**:
    * Ein Ja/Nein-Wert (1/0), ob "nicht" oder "kein" im Text der Frage vorkommt.
9.  **`option_enthaelt_und_oder`**:
    * Ein Ja/Nein-Wert (1/0), ob "und" oder "oder" im Text der Antwortoption vorkommt.
10. **`relative_option_laenge`**:
    * Das Verhältnis der Wortanzahl der Option zur Wortanzahl der Frage (`option_text_laenge / frage_text_laenge`).

---
