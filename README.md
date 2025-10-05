# 🔥 Feuerwehr-Leistungsabzeichen Gold Baden-Württemberg - Fragen-App

[![App on Google Play](https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com/store/apps/details?id=com.leofle.laz_gold_feuerwehr_bw_fragen)
[![Web App](https://img.shields.io/badge/Web_App-LAZ.leofle.com-blue?style=for-the-badge)](https://laz.leofle.com)

---

### 📖 Über das Projekt

Dieses Repository enthält den Quellcode für eine App, die zum Üben der Fragen für das Feuerwehr-Leistungsabzeichen Gold in Baden-Württemberg entwickelt wurde. Die App ist in Flutter geschrieben, um eine plattformübergreifende Nutzung zu gewährleisten.

Das Projekt wurde ins Leben gerufen, um Feuerwehrleuten eine moderne und effiziente Möglichkeit zu bieten, sich gezielt auf die theoretische Prüfung vorzubereiten. Es umfasst alle offiziellen Fragen des Landesfeuerwehrverbandes Baden-Württemberg (Stand 2017).

**Fragenkatalog-Quelle:**
Offizieller Übungsfragenkatalog des Landesfeuerwehrverbands Baden-Württemberg für das Leistungsabzeichen Gold: [lfs-bw.de/fileadmin/LFS-BW/themen/wettbewerb/dokumente/UEbungsfragen_Leistungsabzeichen_Gold_2017.pdf](https://www.lfs-bw.de/fileadmin/LFS-BW/themen/wettbewerb/dokumente/UEbungsfragen_Leistungsabzeichen_Gold_2017.pdf)

---

### 📈 Berechnung des Leaderboard-Scores

Die Position im Leaderboard wird nicht nur durch die prozentuale Richtigkeit bestimmt, sondern auch durch die Anzahl der abgeschlossenen Prüfungen. Dies sorgt für eine faire und aussagekräftige Rangliste, in der Erfahrung und Beständigkeit belohnt werden.

Die Formel für den **gewichteten Score** lautet:

$$
\text{Weighted Score} = (\text{Durchschnittliche Wertung} + \text{Erfahrungsbonus}) \times \text{Zuverlässigkeitsfaktor}
$$

* **Durchschnittliche Wertung:** Der durchschnittliche Prozent-Score aus allen absolvierten Prüfungen.
* **Erfahrungsbonus:** Ein logarithmischer Bonus, der mit zunehmender Anzahl der Prüfungen steigt.
* **Zuverlässigkeitsfaktor:** Ein Multiplikator, der die Wertung anpasst. Eine geringe Anzahl von Prüfungen wird bestraft, während eine hohe Anzahl belohnt wird.

#### Visualisierung des Leaderboard-Scores
Die Grafik veranschaulicht, wie der gewichtete Score auf Basis der Prüfungsanzahl und des Durchschnitts-Scores berechnet wird. Die "Berge" und "Täler" in der Oberfläche zeigen, wie stark die Anzahl der Prüfungen die endgültige Platzierung beeinflusst.

![Leaderboard Position Beispiel](https://github.com/leofleischmann/LAZ-Gold-Feuerwehr-BW-Fragen/blob/d0dd7664e856471be91a0e4c2203683caa8775a7/Leaderboard%20position%20beispiel.png)

#### Beispiele für Leaderboard-Positionen:

| Rang | Name | Prüfungen | Score | Weighted Score |
|:---|:---|:---|:---|:---|
| 1 | Person A | 70 | 95.00% | 168.93 |
| 2 | Person B | 50 | 96.00% | 149.07 |
| 3 | Person C | 30 | 95.00% | 116.09 |
| 4 | Person D | 10 | 97.00% | 96.09 |
| 5 | Person E | 5 | 98.00% | 90.99 |
| 6 | Person F | 1 | 100.00% | 70.84 |

---

---
