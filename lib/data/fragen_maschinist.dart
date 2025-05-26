const List<Map<String, dynamic>> maschinistFragenJson = [
  {
    "id": 1,
    "questionText": "Auf was muss für die Betriebssicherheit an einem Feuerwehrfahrzeug geachtet werden?",
    "options": [
      {
        "label": "a",
        "text": "Wasser",
        "explanation": "Korrekt. Kühlwasser für den Motor und ggf. Löschwasser im Tank müssen kontrolliert werden."
      },
      {
        "label": "b",
        "text": "Motorenöl",
        "explanation": "Korrekt. Ausreichend Motoröl ist für die Schmierung und Kühlung des Motors unerlässlich."
      },
      {
        "label": "c",
        "text": "Beladung vollständig",
        "explanation": "Falsch. Die Vollständigkeit der Beladung ist wichtig für die Einsatzbereitschaft, aber nicht direkt für die *Betriebssicherheit des Fahrzeugs selbst* im Sinne von Fahrbereitschaft und Funktion der Fahrzeugkomponenten."
      },
      {
        "label": "d",
        "text": "Reifenluftdruck",
        "explanation": "Korrekt. Korrekter Reifendruck ist wichtig für die Fahrsicherheit und den Reifenverschleiß."
      },
      {
        "label": "e",
        "text": "Kraftstoff",
        "explanation": "Korrekt. Ein voller Tank stellt sicher, dass das Fahrzeug und die Aggregate einsatzbereit sind."
      },
      {
        "label": "f",
        "text": "Funkausrüstung",
        "explanation": "Falsch. Die Funkausrüstung ist für die Kommunikation wichtig, aber nicht direkt für die Betriebssicherheit des Fahrzeugs im engeren Sinne (Motor, Fahrwerk etc.)."
      },
      {
        "label": "g",
        "text": "Elektrische Anlage",
        "explanation": "Korrekt. Funktionierende Beleuchtung, Signalanlagen und andere elektrische Verbraucher sind wichtig für den sicheren Betrieb."
      }
    ],
    "correctAnswers": ["a", "b", "d", "e", "g"]
  },
  {
    "id": 2,
    "questionText": "Wie groß soll der Elektrodenabstand bei der Zündkerze im Motor der Tragkraftspritze mit VW- Industriemotor sein und in welcher Stellung hat der Kraftstoffhahn nach beendetem Einsatz zu stehen?",
    "options": [
      {
        "label": "a",
        "text": "0,6 bis 0,7 mm",
        "explanation": "Falsch. Dieser Wert ist für die genannten Motoren in der Regel nicht korrekt. Der spezifische Wert ist entscheidend."
      },
      {
        "label": "b",
        "text": "0,4 mm",
        "explanation": "Korrekt. Der korrekte Elektrodenabstand (hier 0,4 mm laut älteren Vorgaben für bestimmte VW-Industriemotoren) ist wichtig für einen sauberen Zündfunken. Die genauen Werte sind immer der Betriebsanleitung zu entnehmen."
      },
      {
        "label": "c",
        "text": "Unter 0,2 mm",
        "explanation": "Falsch. Ein zu geringer Abstand kann zu einem schwachen Zündfunken oder Kurzschluss führen."
      },
      {
        "label": "d",
        "text": "Auf",
        "explanation": "Korrekt. Der Kraftstoffhahn sollte nach dem Einsatz geöffnet bleiben, um ein Austrocknen von Dichtungen oder Verharzen im Vergaser bei längerer Standzeit zu vermeiden (je nach Motor und Herstellerangabe kann dies variieren; hier ist 'Auf' als richtig markiert, was oft bedeutet, dass der Kraftstoff im System verbleibt)."
      },
      {
        "label": "e",
        "text": "Zu",
        "explanation": "Falsch. Das Schließen des Hahns kann bei manchen Motoren dazu führen, dass der Vergaser leerläuft und Dichtungen austrocknen oder Kraftstoffreste verharzen."
      }
    ],
    "correctAnswers": ["b", "d"]
  },
  {
    "id": 3,
    "questionText": "Auf was muss bei der Überprüfung der Verkehrssicherheit geachtet werden?",
    "options": [
      {
        "label": "a",
        "text": "Bremsen",
        "explanation": "Korrekt. Eine funktionierende Bremsanlage ist das Wichtigste für die Sicherheit im Straßenverkehr."
      },
      {
        "label": "b",
        "text": "Beleuchtung",
        "explanation": "Korrekt. Sehen und gesehen werden ist entscheidend, besonders bei Einsatzfahrten."
      },
      {
        "label": "c",
        "text": "Bereifung",
        "explanation": "Korrekt. Ausreichend Profiltiefe und korrekter Reifendruck sind für die Haftung auf der Straße wichtig."
      },
      {
        "label": "d",
        "text": "Beladung",
        "explanation": "Korrekt. Die Beladung muss sicher verstaut sein und darf die Fahreigenschaften nicht negativ beeinflussen."
      },
      {
        "label": "e",
        "text": "Nebenantrieb",
        "explanation": "Falsch. Der Nebenantrieb (z.B. für die Pumpe) ist für die Einsatzfunktion wichtig, aber nicht primär für die Verkehrssicherheit des Fahrzeugs während der Fahrt."
      },
      {
        "label": "f",
        "text": "Lenkung",
        "explanation": "Korrekt. Eine leichtgängige und präzise Lenkung ist für die Kontrolle des Fahrzeugs notwendig."
      },
      {
        "label": "g",
        "text": "Signal",
        "explanation": "Korrekt. Blaulicht und Martinshorn müssen funktionieren, um auf die Einsatzfahrt aufmerksam zu machen und Wegerechte in Anspruch nehmen zu können."
      },
      {
        "label": "h",
        "text": "Spiegel",
        "explanation": "Korrekt. Rückspiegel müssen richtig eingestellt und unbeschädigt sein für eine gute Rundumsicht."
      },
      {
        "label": "i",
        "text": "Scheibenwischer",
        "explanation": "Korrekt. Sorgen für klare Sicht bei Regen oder Schnee."
      },
      {
        "label": "j",
        "text": "Kraftstoff",
        "explanation": "Falsch. Ausreichend Kraftstoff ist für die Betriebsbereitschaft wichtig, aber die Überprüfung des Füllstands gehört nicht direkt zur *Verkehrssicherheitsüberprüfung* im Sinne von Bremsen, Licht etc. vor Fahrtantritt."
      }
    ],
    "correctAnswers": ["a", "b", "c", "d", "f", "g", "h", "i"]
  },
  {
    "id": 4,
    "questionText": "Welche der nachfolgenden Feuerwehr-Dienstvorschriften (FwDV) geben Hinweise auf die Aufgaben des Maschinisten?",
    "options": [
      {
        "label": "a",
        "text": "FwDV 3-Einheiten im Lösch- und Hilfeleistungseinsatz",
        "explanation": "Korrekt. Die FwDV 3 ('Einheiten im Lösch- und Hilfeleistungseinsatz') beschreibt die Aufgabenverteilung innerhalb der taktischen Einheiten, auch die des Maschinisten, z.B. Bedienung der Pumpe."
      },
      {
        "label": "b",
        "text": "FwDV 500 - Einheiten im ABC-Einsatz",
        "explanation": "Falsch. Die FwDV 500 behandelt den ABC-Einsatz und ist nicht primär auf die allgemeinen Aufgaben des Maschinisten fokussiert, auch wenn er im ABC-Einsatz natürlich eine Rolle spielt."
      },
      {
        "label": "c",
        "text": "FwDV 10- Die tragbaren Leitern",
        "explanation": "Korrekt. Auch wenn primär für Trupps relevant, ist der Maschinist für die Lagerung und Entnahme der Leitern vom Fahrzeug mitverantwortlich und unterstützt dabei."
      },
      {
        "label": "d",
        "text": "FwDV 810.3- Sprechfunkdienst",
        "explanation": "Falsch. Diese FwDV regelt den Sprechfunkverkehr und ist nicht spezifisch für die Kernaufgaben des Maschinisten, auch wenn er ein Funkgerät bedient."
      },
      {
        "label": "e",
        "text": "FwDV 2-Ausbildung der Freiwilligen Feuerwehren",
        "explanation": "Korrekt. Die FwDV 2 legt die Ausbildungsinhalte fest, dazu gehört auch die Ausbildung zum Maschinisten und die dort vermittelten Aufgaben."
      }
    ],
    "correctAnswers": ["a", "c", "e"]
  },
  {
    "id": 5,
    "questionText": "Was hat der Maschinist gemäß den Feuerwehr-Dienstvorschriften und den Richtlinien zur Durchführung der Leistungsübungen beim Einsatz in der Gruppe bei offener Wasserentnahme zu tun?",
    "options": [
      {
        "label": "a",
        "text": "Er hilft den Trupps beim Entnehmen der Geräte",
        "explanation": "Korrekt. Der Maschinist unterstützt bei der Geräteentnahme vom Fahrzeug."
      },
      {
        "label": "b",
        "text": "Er legt Kupplungsschlüssel (falls erforderlich) Saugkorb, Saugschutzkorb sowie Halte- und Ventilleine bereit",
        "explanation": "Korrekt. Dies sind vorbereitende Maßnahmen für die Wasserentnahme aus offenen Gewässern."
      },
      {
        "label": "c",
        "text": "Er kuppelt den Saugkorb an die Saugleitung an",
        "explanation": "Falsch. Das Ankuppeln des Saugkorbs ist typischerweise Aufgabe des Wassertrupps."
      },
      {
        "label": "d",
        "text": "Er kuppelt die Schlauchleitung an die Pumpe an und bedient die Pumpe",
        "explanation": "Korrekt. Das Anschließen der Druckschläuche an die Pumpe und deren Bedienung sind Kernaufgaben des Maschinisten."
      },
      {
        "label": "e",
        "text": "Er schlägt die Ventilleine im Bedienbereich der Pumpe und die Halteleine an einem festen Punkt an",
        "explanation": "Korrekt. Die Ventilleine dient zur Bedienung des Saugkorbventils, die Halteleine sichert die Saugleitung."
      }
    ],
    "correctAnswers": ["a", "b", "d", "e"]
  },
  {
    "id": 6,
    "questionText": "Welche Wasserentnahmestellen erfordern ein Ansaugen des Wassers?",
    "options": [
      {
        "label": "a",
        "text": "Schachthydrant",
        "explanation": "Falsch. Schachthydranten stehen unter Druck aus dem Wassernetz, hier muss nicht angesaugt werden."
      },
      {
        "label": "b",
        "text": "Überflurhydrant",
        "explanation": "Falsch. Überflurhydranten stehen unter Druck aus dem Wassernetz."
      },
      {
        "label": "c",
        "text": "Unterflurhydrant",
        "explanation": "Falsch. Unterflurhydranten stehen unter Druck aus dem Wassernetz."
      },
      {
        "label": "d",
        "text": "Löschteich",
        "explanation": "Korrekt. Aus einem Löschteich muss das Wasser aktiv angesaugt werden, da kein Eigendruck vorhanden ist."
      },
      {
        "label": "e",
        "text": "Unterirdischer Löschwasserbehälter",
        "explanation": "Korrekt. Das Wasser aus einem solchen Behälter (Zisterne) muss angesaugt werden."
      },
      {
        "label": "f",
        "text": "Löschwasserbrunnen S",
        "explanation": "Korrekt. 'S' steht für Saugbrunnen, hier muss das Wasser angesaugt werden."
      }
    ],
    "correctAnswers": ["d", "e", "f"]
  },
  {
    "id": 7,
    "questionText": "Welche Einflüsse führen dazu, dass die theoretische Saughöhe von 10,33 Meter nicht erreicht werden kann?",
    "options": [
      {
        "label": "a",
        "text": "Luftdruck unter dem Normaldruck",
        "explanation": "Korrekt. Die Saughöhe ist direkt vom äußeren Luftdruck abhängig. Geringerer Luftdruck (z.B. in größeren Höhen) bedeutet geringere maximale Saughöhe."
      },
      {
        "label": "b",
        "text": "Für das Fließen des Wassers im Saugschlauch wird Druck benötigt",
        "explanation": "Korrekt. Strömungsverluste im Saugschlauch reduzieren den effektiv nutzbaren Druckunterschied."
      },
      {
        "label": "c",
        "text": "Reibungs- und Strömungsverluste",
        "explanation": "Korrekt. Diese Verluste in der Saugleitung und Pumpe verringern die erreichbare Saughöhe."
      },
      {
        "label": "d",
        "text": "Wasser ist schwerer als Luft",
        "explanation": "Falsch. Dieser Fakt ist zwar richtig, aber nicht der direkte Grund, warum die *theoretische* Saughöhe nicht erreicht wird. Die theoretische Saughöhe basiert ja gerade auf dem Gleichgewicht zwischen Wassersäule und Luftdruck."
      },
      {
        "label": "e",
        "text": "Entlüftungseinrichtungen erzeugen kein 100%iges Vakuum",
        "explanation": "Korrekt. Ein perfektes Vakuum ist praktisch nicht erreichbar, was die Saughöhe ebenfalls beeinflusst."
      }
    ],
    "correctAnswers": ["a", "b", "c", "e"]
  },
  {
    "id": 8,
    "questionText": "Mit welchem Knoten wird die Halte- und Ventilleine entsprechend der Richtlinie zur Durchführung der Leistungsübungen an den Festpunkten angebracht?",
    "options": [
      {
        "label": "a",
        "text": "Doppelschlinge",
        "explanation": "Falsch. Die Doppelschlinge wird für andere Zwecke verwendet, z.B. zum Hochziehen von Geräten."
      },
      {
        "label": "b",
        "text": "Mastwurf",
        "explanation": "Korrekt. Der Mastwurf (oft mit Halbschlag gesichert) ist der Standardknoten zum Befestigen von Leinen an Festpunkten oder am Saugkorb."
      },
      {
        "label": "c",
        "text": "Zimmermannsschlag",
        "explanation": "Falsch. Der Zimmermannsschlag ist ein guter Knoten zum Befestigen an Rundhölzern, aber für die Leinen an Festpunkten ist der Mastwurf üblicher."
      },
      {
        "label": "d",
        "text": "Schotstich",
        "explanation": "Falsch. Der Schotstich dient zum Verbinden zweier ungleich starker Leinen."
      },
      {
        "label": "e",
        "text": "Ankerstich",
        "explanation": "Falsch. Der Ankerstich wird ebenfalls zum Befestigen an Gegenständen verwendet, aber der Mastwurf ist für diesen Zweck in den Richtlinien oft präferiert."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 9,
    "questionText": "Welchen Ausgangsdruck soll der Maschinist in der Regel an der Feuerlöschkreiselpumpe einhalten?",
    "options": [
      {
        "label": "a",
        "text": "Fünf bis sechs bar bei kurzer Entfernung zur Einsatzstelle",
        "explanation": "Korrekt. Für CM-Strahlrohre ist dies ein üblicher Arbeitsdruck bei kurzen Schlauchleitungen."
      },
      {
        "label": "b",
        "text": "Acht bar bei Wasserförderung über lange Wege",
        "explanation": "Korrekt. Bei langen Schlauchstrecken muss der Ausgangsdruck erhöht werden, um Druckverluste auszugleichen und am Strahlrohr noch genügend Druck zu haben."
      },
      {
        "label": "c",
        "text": "Acht bis zehn bar bei Erzeugung von Schwerschaum",
        "explanation": "Korrekt. Schaumzumischer benötigen einen bestimmten Eingangsdruck, um korrekt zu funktionieren, daher ist oft ein höherer Pumpenausgangsdruck nötig."
      }
    ],
    "correctAnswers": ["a", "b", "c"]
  },
  {
    "id": 10,
    "questionText": "Löschwasserbrunnen sind künstlich angelegte Entnahmestellen für Löschwasser aus dem Grundwasser. Für welchen Zeitraum muss die Ergiebigkeit mindestens gewährleistet sein?",
    "options": [
      {
        "label": "a",
        "text": "Eine Stunde",
        "explanation": "Falsch. Eine Stunde ist für einen längeren Einsatz oft nicht ausreichend."
      },
      {
        "label": "b",
        "text": "Drei Stunden",
        "explanation": "Korrekt. Nach Norm müssen Löschwasserbrunnen eine Mindestergiebigkeit für einen Zeitraum von drei Stunden sicherstellen."
      },
      {
        "label": "c",
        "text": "Gesamtdauer des Einsatzes",
        "explanation": "Falsch. Dies wäre ideal, ist aber normativ nicht für die Mindestergiebigkeit eines Brunnens festgelegt."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 11,
    "questionText": "Was bedeutet bei einer Feuerlöschkreiselpumpe die 1. Ziffer in der Bezeichnung FPN 10/1000?",
    "options": [
      {
        "label": "a",
        "text": "Der Nennförderstrom ist 1000 Liter/Minute",
        "explanation": "Falsch. Die Zahl nach dem Schrägstrich gibt den Nennförderstrom an."
      },
      {
        "label": "b",
        "text": "Der Nennförderdruck ist 10 bar",
        "explanation": "Korrekt. FPN steht für Feuerlöschpumpe Normaldruck. Die erste Ziffer (hier 10) gibt den Nennförderdruck in bar an."
      },
      {
        "label": "c",
        "text": "Die Förderleistung ist 10 Kilowatt",
        "explanation": "Falsch. Die Bezeichnung gibt keine direkte Auskunft über die Motorleistung in Kilowatt."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 12,
    "questionText": "Welche Aussage ist richtig?",
    "options": [
      {
        "label": "a",
        "text": "Die geodätische Saughöhe kann direkt am Eingangsmanometer der der Feuerlöschkreiselpumpe während der Wasserförderung abgelesen werden",
        "explanation": "Falsch. Das Eingangsmanometer zeigt den Unterdruck (Saugdruck) an, nicht direkt die geodätische Saughöhe in Metern."
      },
      {
        "label": "b",
        "text": "Die geodätische Saughöhe ist der Höhenunterschied in Meter zwischen Pumpenmitte und saugseitigem Wasserspiegel",
        "explanation": "Korrekt. Dies ist die Definition der geodätischen Saughöhe."
      },
      {
        "label": "c",
        "text": "Das Maß der geodätischen Saughöhe ist für den Förderstrom ohne Einfluss",
        "explanation": "Falsch. Eine größere geodätische Saughöhe bedeutet, dass die Pumpe mehr Arbeit leisten muss und der maximal mögliche Förderstrom sinkt."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 13,
    "questionText": "Welche Pumpenwellenabdichtung ist während des Betriebes nachstellbar?",
    "options": [
      {
        "label": "a",
        "text": "Radialdichtringe",
        "explanation": "Falsch. Radialdichtringe (Simmerringe) sind nicht nachstellbar und müssen bei Verschleiß ausgetauscht werden."
      },
      {
        "label": "b",
        "text": "Stopfbuchsenpackung",
        "explanation": "Korrekt. Eine Stopfbuchse kann durch Anziehen der Stopfbuchsbrille nachgestellt werden, um die Dichtwirkung zu verbessern."
      },
      {
        "label": "c",
        "text": "Gleitringdichtung",
        "explanation": "Falsch. Gleitringdichtungen sind wartungsarm, aber nicht während des Betriebs nachstellbar. Bei Defekt müssen sie ersetzt werden."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 14,
    "questionText": "Welche der nachfolgenden Feuerwehrpumpen sind genormt?",
    "options": [
      {
        "label": "a",
        "text": "FPN 40/250",
        "explanation": "Korrekt. Dies ist eine genormte Feuerlöschpumpe (Hochdruckteil einer FPH)."
      },
      {
        "label": "b",
        "text": "FP 8/8",
        "explanation": "Falsch. 'FP 8/8' ist eine veraltete Bezeichnung (Vorgänger der FPN 10/1000, ehemals TS 8/8), aber nicht mehr die aktuelle Normbezeichnung für Neufahrzeuge."
      },
      {
        "label": "c",
        "text": "FPN 10/750",
        "explanation": "Korrekt. Dies ist eine genormte Feuerlöschpumpe Normaldruck."
      },
      {
        "label": "d",
        "text": "FPN 15/2000",
        "explanation": "Korrekt. Dies ist eine genormte Feuerlöschpumpe Normaldruck."
      },
      {
        "label": "e",
        "text": "FP 24/8",
        "explanation": "Falsch. Veraltete Bezeichnung, nicht mehr aktuelle Norm."
      },
      {
        "label": "f",
        "text": "FP 32/8",
        "explanation": "Falsch. Veraltete Bezeichnung, nicht mehr aktuelle Norm."
      },
      {
        "label": "g",
        "text": "LP 24/3",
        "explanation": "Falsch. 'LP' steht für Lenzpumpe, diese spezifische Bezeichnung ist nicht als Standard-Feuerlöschpumpe genormt."
      },
      {
        "label": "h",
        "text": "TUP 3-1,5",
        "explanation": "Korrekt. Tragbare Umfüllpumpe, genormt."
      },
      {
        "label": "i",
        "text": "TP 4/1",
        "explanation": "Korrekt. Tragbare Tauchpumpe, genormt."
      },
      {
        "label": "j",
        "text": "TTP 8/1/8",
        "explanation": "Korrekt. Tragbare Turbinentauchpumpe, genormt."
      }
    ],
    "correctAnswers": ["a", "c", "d", "h", "i", "j"]
  },
  {
    "id": 15,
    "questionText": "Welche Bedingungen müssen beim 1. Garantiepunkt einer Feuerlöschkreiselpumpe FPN 15/1000 erfüllt werden?",
    "options": [
      {
        "label": "a",
        "text": "Der Nennförderdruck muss mindestens 15 bar betragen",
        "explanation": "Korrekt. Die '15' in FPN 15/1000 steht für den Nennförderdruck von 15 bar."
      },
      {
        "label": "b",
        "text": "Der Nennförderstrom muss mindestens 1000 Liter/Minute sein",
        "explanation": "Korrekt. Die '1000' in FPN 15/1000 steht für den Nennförderstrom von 1000 l/min."
      },
      {
        "label": "c",
        "text": "Die Nenndrehzahl darf hierbei max. ±5% abweichen",
        "explanation": "Korrekt. Die Pumpe muss die Nennleistung bei oder nahe der Nenndrehzahl erreichen."
      },
      {
        "label": "d",
        "text": "Die geodätische Saughöhe muss 3,0 Meter betragen",
        "explanation": "Korrekt. Der erste Garantiepunkt wird bei einer geodätischen Saughöhe von 3 Metern geprüft."
      },
      {
        "label": "e",
        "text": "Die geodätische Saughöhe muss 7,5 Meter betragen",
        "explanation": "Falsch. 7,5 Meter ist die maximale Saughöhe, bei der noch ein bestimmter Teillastförderstrom erreicht werden muss (ein anderer Garantiepunkt), aber nicht die Bedingung für den 1. Garantiepunkt (Nennleistung)."
      }
    ],
    "correctAnswers": ["a", "b", "c", "d"]
  },
  {
    "id": 16,
    "questionText": "Was bewirkt Kavitation (Hohlsog) in einer Feuerlöschkreiselpumpe?",
    "options": [
      {
        "label": "a",
        "text": "In der Feuerlöschkreiselpumpe bilden sich so hohe Drücke, dass das Gehäuse schlagartig auseinander bricht",
        "explanation": "Falsch. Kavitation führt zu Materialzerstörung durch Implosion von Dampfblasen, nicht zu Überdruck und Gehäusebruch."
      },
      {
        "label": "b",
        "text": "Es bilden sich Dampfblasen in der Flüssigkeit, der Förderstrom kann nicht mehr erhöht werden",
        "explanation": "Korrekt. Durch zu niedrigen Druck auf der Saugseite verdampft Wasser, diese Dampfblasen stören die Förderung."
      },
      {
        "label": "c",
        "text": "Beim Zerfall der Dampfblasen wird der Werkstoff des Laufrades zerstört",
        "explanation": "Korrekt. Die Implosion der Dampfblasen erzeugt hohe lokale Drücke und Temperaturen, die Materialschäden (Lochfraß) verursachen."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 17,
    "questionText": "Welche Entlüftungseinrichtungen sind Strahlapparate?",
    "options": [
      {
        "label": "a",
        "text": "Wasserstrahlpumpe",
        "explanation": "Falsch. Eine Wasserstrahlpumpe ist zwar ein Strahlapparat, wird aber nicht typischerweise als *Hauptentlüftungseinrichtung* für Feuerlöschkreiselpumpen verwendet, sondern eher für Lenzarbeiten oder als Hilfsmittel."
      },
      {
        "label": "b",
        "text": "Trockenring-Entlüftungspumpe",
        "explanation": "Falsch. Dies ist eine Verdrängerpumpe, kein Strahlapparat."
      },
      {
        "label": "c",
        "text": "Gasstrahler einstufig",
        "explanation": "Korrekt. Ein Gasstrahler (Ejektor) nutzt die Energie eines Treibgasstroms (z.B. Auspuffgase), um Luft abzusaugen. Er ist ein Strahlapparat."
      },
      {
        "label": "d",
        "text": "Gasstrahler zweistufig",
        "explanation": "Korrekt. Ähnlich wie der einstufige, aber mit höherer Effizienz durch zwei Stufen."
      }
    ],
    "correctAnswers": ["c", "d"]
  },
  {
    "id": 18,
    "questionText": "Welche Möglichkeiten bestehen, wenn der Eingangsmanometer beim Ansaugen keinen negativen Druck anzeigt?",
    "options": [
      {
        "label": "a",
        "text": "Ausgangsventil der Feuerlöschkreiselpumpe ist offen",
        "explanation": "Korrekt. Wenn ein Druckausgang offen ist, kann kein Unterdruck aufgebaut werden, da Luft von der Druckseite nachströmt."
      },
      {
        "label": "b",
        "text": "Die Feuerlöschkreiselpumpe oder die Saugleitung ist undicht",
        "explanation": "Korrekt. Bei Undichtigkeiten wird Luft von außen angesaugt, was den Aufbau eines Vakuums verhindert."
      },
      {
        "label": "c",
        "text": "Das Schutzsieb am Saugkorb ist verstopft",
        "explanation": "Falsch. Ein verstopftes Sieb würde eher zu einem sehr hohen negativen Druck führen, da die Pumpe versucht, Wasser anzusaugen, aber blockiert wird."
      },
      {
        "label": "d",
        "text": "Das Rückschlagorgan sitzt im Saugkorb fest",
        "explanation": "Falsch. Wenn das Rückschlagventil (Fußventil) festsitzt und geschlossen ist, würde sich ein hoher Unterdruck aufbauen, da kein Wasser nachströmen kann. Wenn es offen festsitzt, würde die Wassersäule nach Abschalten der Pumpe zurückfallen, aber während des Ansaugens wäre es eher ein Dichtigkeitsproblem der Saugleitung, wenn kein Unterdruck entsteht."
      },
      {
        "label": "e",
        "text": "Der Saugkorb liegt teilweise außerhalb des Wassers",
        "explanation": "Korrekt. Wenn der Saugkorb Luft zieht, kann kein stabiler Unterdruck für die Wasserförderung aufgebaut werden."
      }
    ],
    "correctAnswers": ["a", "b", "e"]
  },
  {
    "id": 19,
    "questionText": "Was geschieht in der Feuerlöschkreiselpumpe, wenn der Wasserspaltring beschädigt ist?",
    "options": [
      {
        "label": "a",
        "text": "In der Feuerlöschkreiselpumpe entsteht ein Wasserkreislauf von der Druckseite zur Saugseite",
        "explanation": "Korrekt. Der Spaltring dichtet zwischen Laufrad und Gehäuse ab. Ist er beschädigt, kommt es zu einem internen Kurzschluss von der Druck- zur Saugseite (Rückströmung)."
      },
      {
        "label": "b",
        "text": "In der Feuerlöschkreiselpumpe entsteht ein Wasserkreislauf von der Saugseite zur Druckseite",
        "explanation": "Falsch. Der Druck ist auf der Druckseite höher, daher würde Wasser von dort zur Saugseite zurückströmen."
      },
      {
        "label": "c",
        "text": "Beim Hydrantenbetrieb wird der Förderstrom größer, weil zusätzlich Wasser zu den Druckausgängen gelangen kann, dafür wird bei Saugbetrieb der Förderstrom geringer",
        "explanation": "Falsch. Ein beschädigter Spaltring führt immer zu Leistungsverlust, also geringerem Förderstrom und/oder Druck, sowohl im Saug- als auch im Hydrantenbetrieb."
      },
      {
        "label": "d",
        "text": "Durch den Wasserkreislauf in der Feuerlöschkreiselpumpe wird der Schließdruck geringer",
        "explanation": "Korrekt. Der interne Kurzschluss führt zu einem Verlust, wodurch der maximal erreichbare Druck (Schließdruck) sinkt."
      }
    ],
    "correctAnswers": ["a", "d"]
  },
  {
    "id": 20,
    "questionText": "Sie bedienen an der Brandstelle eine Feuerlöschkreiselpumpe FPN 10/1000 und halten einen Ausgangsdruck von fünf bis sechs bar. Es ist zu Nachlöscharbeiten - für Sie nicht sichtbar - noch ein C-Rohr in Stellung. Wasserentnahme: offenes Gewässer, Geodätische Saughöhe sechs Meter. Auf was müssen Sie achten?",
    "options": [
      {
        "label": "a",
        "text": "Dass der Druck konstant bleibt",
        "explanation": "Korrekt. Der Maschinist muss den eingestellten Druck überwachen und ggf. nachregeln, um eine gleichmäßige Wasserabgabe zu gewährleisten."
      },
      {
        "label": "b",
        "text": "Weil die Feuerlöschkreiselpumpe nicht ausgelastet ist, brauchen Sie ihr keine besondere Aufmerksamkeit zu schenken. Sie können deshalb bei der Zurücknahme der nicht mehr benötigten Geräte behilflich sein",
        "explanation": "Falsch. Die Pumpe muss immer überwacht werden, besonders bei offener Wasserentnahme und hoher Saughöhe, da sich Bedingungen (z.B. Wasserspiegel, Verstopfung) ändern können."
      },
      {
        "label": "c",
        "text": "Das Pumpengehäuse von Zeit zu Zeit mit der Hand auf Temperatur überprüfen. Notfalls freien Druckausgang etwas öffnen der Verbindungsleitung zum eingebauten Löschwasserbehälter etwas öffnen",
        "explanation": "Korrekt. Bei geringer Wasserabgabe und hoher Saughöhe kann sich die Pumpe erwärmen. Ein leichter Bypass (z.B. zum Tank oder ein leicht geöffneter weiterer Abgang) kann zur Kühlung dienen."
      }
    ],
    "correctAnswers": ["a", "c"]
  },
  {
    "id": 21,
    "questionText": "Was bedeutet  Kavitation\" beim Fördern von Wasser mit einer Feuerlöschkreiselpumpe?",
    "options": [
      {
        "label": "a",
        "text": "Zerstörung des Laufrades",
        "explanation": "Korrekt. Die Implosion von Dampfblasen bei Kavitation führt zu Materialabtrag am Laufrad und anderen Pumpenteilen."
      },
      {
        "label": "b",
        "text": "Zerstörung des Wasserspaltringes",
        "explanation": "Falsch. Obwohl Kavitation generell schädlich für die Pumpe ist, ist die Zerstörung des Laufrades das prominenteste Schadensbild. Der Spaltring kann auch betroffen sein, aber 'Zerstörung des Laufrades' ist eine direktere und bekanntere Folge."
      },
      {
        "label": "c",
        "text": "Bildung von Wasserdampfbläschen",
        "explanation": "Korrekt. Kavitation beginnt mit der Bildung von Dampfblasen in Bereichen niedrigen Drucks (meist auf der Saugseite des Laufrades)."
      }
    ],
    "correctAnswers": ["a", "c"]
  },
  {
    "id": 22,
    "questionText": "An welchen äußeren Merkmalen erkennen Sie den Unterschied zwischen einer einstufigen und einer zweistufigen Feuerlöschkreiselpumpe?",
    "options": [
      {
        "label": "a",
        "text": "An der Zahl der Druckausgänge",
        "explanation": "Falsch. Die Anzahl der Druckausgänge hängt von der Fahrzeugkonzeption ab, nicht von der Stufigkeit der Pumpe."
      },
      {
        "label": "b",
        "text": "Am Typenschild (Nenndrehzahl)",
        "explanation": "Korrekt. Zweistufige Pumpen haben oft eine andere Nenndrehzahl oder spezifische Angaben zur Stufigkeit auf dem Typenschild."
      },
      {
        "label": "c",
        "text": "An der Form des Pumpengehäuses",
        "explanation": "Korrekt. Zweistufige Pumpen haben oft ein voluminöseres oder anders geformtes Gehäuse, da zwei Laufräder und die entsprechende Wasserführung untergebracht werden müssen."
      },
      {
        "label": "d",
        "text": "Am angegebenen Schließdruck",
        "explanation": "Falsch. Der Schließdruck allein lässt nicht direkt auf die Stufigkeit schließen, obwohl mehrstufige Pumpen oft höhere Drücke erreichen können."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 23,
    "questionText": "Die Heckpumpe vom Löschgruppenfahrzeug LF 10 ist an der Brandstelle im Einsatz. Die Wasserversorgung erfolgt über das Sammelstück vom Hydranten. Weil die Entnahme von Löschwasser aus der Versorgungsleitung unzureichend ist, wird mittels einer Tragkraftspritze PFPN 10/1000 Wasser aus einem in 200 Meter entfernten Teich entnommen. Frage: Darf die Zubringerleitung von der PFPN 10/1000 an das Sammelstück der Heckpumpe angeschlossen werden?",
    "options": [
      {
        "label": "a",
        "text": "Ja, weil Teichwasser wegen der Rückschlagklappe im Sammelstück nicht zum Hydranten gelangen kann",
        "explanation": "Falsch. Auch wenn eine Rückschlagklappe vorhanden ist, besteht die Gefahr der Kontamination des Trinkwassernetzes."
      },
      {
        "label": "b",
        "text": "Nein, weil Bakterien ins Rohrnetz der Wasserversorgung gelangen können",
        "explanation": "Korrekt. Es darf niemals Wasser aus offenen Gewässern (potenziell verunreinigt) direkt in das Trinkwassernetz eingespeist werden. Das Sammelstück am Hydrantenanschluss ist Teil dieses Netzes."
      },
      {
        "label": "c",
        "text": "Nur wenn der Druck des Rohrleitungsnetzes größer ist als der Druck in der Zubringerleitung von der PFPN 10/1000",
        "explanation": "Falsch. Die Druckverhältnisse ändern nichts an der Gefahr der Kontamination."
      },
      {
        "label": "d",
        "text": "Nur wenn der Druck des Rohrleitungsnetzes niedriger ist als der Druck in der Zubringerleitung von der PFPN 10/1000",
        "explanation": "Falsch. Die Druckverhältnisse ändern nichts an der Gefahr der Kontamination. Hier wäre die Gefahr des Eindringens sogar noch größer."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 24,
    "questionText": "Welche Ursachen sind denkbar, wenn die geodätische Saughöhe ein Meter beträgt, das Eingangsmanometer -0,6 bar anzeigt und trotz Vollgas keine Anzeige am Ausgangsmanometer erfolgt?",
    "options": [
      {
        "label": "a",
        "text": "Schutzsieb des Saugkorbs verstopft",
        "explanation": "Korrekt. Ein verstopfter Saugkorb führt zu hohem Unterdruck auf der Saugseite, aber es kommt kein oder zu wenig Wasser zur Pumpe, daher kein Ausgangsdruck."
      },
      {
        "label": "b",
        "text": "Saugkorb liegt teilweise außerhalb der Wasseroberfläche",
        "explanation": "Falsch. Wenn der Saugkorb Luft zieht, würde sich kein so hoher negativer Druck von -0,6 bar aufbauen."
      },
      {
        "label": "c",
        "text": "Schutzsieb am Pumpeneingang verstopft",
        "explanation": "Korrekt. Ähnlich wie beim Saugkorb führt eine Verstopfung direkt vor der Pumpe zu hohem Unterdruck, aber keiner Wasserförderung."
      },
      {
        "label": "d",
        "text": "Rückschlagorgan im Saugkorb fehlt",
        "explanation": "Falsch. Ein fehlendes Rückschlagorgan würde dazu führen, dass die Wassersäule nach dem Entlüften oder bei Pumpenstillstand zurückfällt, aber nicht primär zu diesem Fehlerbild während des Saugbetriebs mit laufender Pumpe."
      },
      {
        "label": "e",
        "text": "Förderstrom sehr groß",
        "explanation": "Korrekt. Wenn die Pumpe versucht, einen sehr großen Förderstrom zu ziehen, der die Kapazität der Saugleitung übersteigt (z.B. wegen Verstopfung oder zu geringem Wassernachfluss), kann der Druck auf der Saugseite stark abfallen, ohne dass ein entsprechender Ausgangsdruck aufgebaut wird (Kavitationsgefahr)."
      }
    ],
    "correctAnswers": ["a", "c", "e"]
  },
  {
    "id": 25,
    "questionText": "Welche wichtigen Bauteile sind an Feuerlöschkreiselpumpen vorhanden?",
    "options": [
      {
        "label": "a",
        "text": "Kupplung",
        "explanation": "Falsch. Eine Kupplung zum Ein- und Auskuppeln des Pumpenantriebs ist zwar oft vorhanden, aber nicht *an* der Feuerlöschkreiselpumpe selbst, sondern Teil des Antriebsstrangs vom Fahrzeugmotor oder Antriebsmotor der TS."
      },
      {
        "label": "b",
        "text": "Gehäuse mit Gehäusedeckel",
        "explanation": "Korrekt. Das Pumpengehäuse umschließt die rotierenden Teile und führt das Wasser."
      },
      {
        "label": "c",
        "text": "Kurbelwelle",
        "explanation": "Falsch. Eine Kurbelwelle ist Teil eines Verbrennungsmotors, nicht der Kreiselpumpe selbst."
      },
      {
        "label": "d",
        "text": "Kolben und Ventile",
        "explanation": "Falsch. Kolben und Ventile sind typisch für Verdrängerpumpen (z.B. Kolbenpumpen), nicht für Kreiselpumpen."
      },
      {
        "label": "e",
        "text": "Armaturen und Bedienungseinrichtungen",
        "explanation": "Korrekt. Dazu gehören Druckabgänge, Manometer, Drehzahlregelung etc."
      },
      {
        "label": "f",
        "text": "Entlüftungseinrichtung",
        "explanation": "Korrekt. Notwendig, um Luft aus der Saugleitung und Pumpe zu entfernen, damit Wasser angesaugt werden kann."
      },
      {
        "label": "g",
        "text": "Laufrad (Laufräder)",
        "explanation": "Korrekt. Das rotierende Laufrad ist das Herzstück der Kreiselpumpe und beschleunigt das Wasser."
      },
      {
        "label": "h",
        "text": "Messinstrumente",
        "explanation": "Korrekt. Eingangs- und Ausgangsmanometer sowie Drehzahlmesser sind wichtige Messinstrumente."
      },
      {
        "label": "i",
        "text": "Schutzhaube",
        "explanation": "Falsch. Eine Schutzhaube kann Teil einer Tragkraftspritze sein, ist aber kein direktes Bauteil der Feuerlöschkreiselpumpe selbst."
      }
    ],
    "correctAnswers": ["b", "e", "f", "g", "h"]
  },
  {
    "id": 26,
    "questionText": "Was besagt der Begriff  Kavitation\"?",
    "options": [
      {
        "label": "a",
        "text": "Geräuschbildung in der Feuerlöschkreiselpumpe ab vier Meter Saughöhe",
        "explanation": "Falsch. Geräuschbildung ist ein Symptom von Kavitation, aber nicht die Definition. Kavitation kann auch bei geringeren Saughöhen auftreten, wenn andere Bedingungen (z.B. hohe Wassertemperatur, Verstopfung) ungünstig sind."
      },
      {
        "label": "b",
        "text": "Fremdkörper (Flugsand o.ä.) im Löschwasser",
        "explanation": "Falsch. Fremdkörper verursachen Verschleiß, aber das ist nicht Kavitation."
      },
      {
        "label": "c",
        "text": "Bildung und Zerstörung von dampfgefüllten Hohlräumen in Flüssigkeiten",
        "explanation": "Korrekt. Kavitation ist die Bildung von Dampfblasen in einer Flüssigkeit aufgrund lokalen Druckabfalls unter den Dampfdruck und deren anschließende Implosion in Bereichen höheren Drucks."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 27,
    "questionText": "Welche der aufgeführten Armaturen legt der Maschinist bereit beziehungsweise schließt er an?",
    "options": [
      {
        "label": "a",
        "text": "Standrohr",
        "explanation": "Falsch. Das Setzen des Standrohrs ist Aufgabe des Wassertrupps."
      },
      {
        "label": "b",
        "text": "Saugkorb",
        "explanation": "Korrekt. Der Maschinist legt den Saugkorb (mit Saugschutzkorb und Leinen) für den Wassertrupp bereit."
      },
      {
        "label": "c",
        "text": "Sammelstück",
        "explanation": "Korrekt. Das Sammelstück wird vom Maschinisten an den Saugstutzen der Pumpe angeschlossen, wenn Wasser von Hydranten oder anderen Pumpen eingespeist wird."
      },
      {
        "label": "d",
        "text": "Druckbegrenzungsventil",
        "explanation": "Falsch. Ein Druckbegrenzungsventil ist eine Armatur zur Wasserfortleitung und wird bei Bedarf vom Schlauchtrupp oder Angriffstrupp eingesetzt, nicht primär vom Maschinisten an der Pumpe bereitgelegt/angeschlossen (außer es ist fest an der Pumpe verbaut)."
      },
      {
        "label": "e",
        "text": "Verteiler",
        "explanation": "Falsch. Das Setzen und Bedienen des Verteilers ist Aufgabe des Angriffstrupps oder Melders."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 28,
    "questionText": "Worauf muss der Maschinist bei der Löschwasserförderung über lange Strecken achten?",
    "options": [
      {
        "label": "a",
        "text": "Verkehrsbehinderungen beachten",
        "explanation": "Falsch. Dies ist Aufgabe des Gruppenführers und der Trupps, die die Leitung verlegen, nicht primär des Maschinisten an der Pumpe."
      },
      {
        "label": "b",
        "text": "Verkehrsbehinderungen so gering wie möglich zulassen",
        "explanation": "Falsch. Siehe Antwort a."
      },
      {
        "label": "c",
        "text": "Reserveschläuche und Ersatz-Feuerlöschkreiselpumpe bereithalten",
        "explanation": "Falsch. Das Bereithalten von Reserveschläuchen ist Aufgabe der Schlauchstrecke/des Gruppenführers. Eine Ersatzpumpe bereitzuhalten ist eine logistische Maßnahme, nicht direkte Aufgabe des Maschinisten während der Wasserförderung."
      },
      {
        "label": "d",
        "text": "Nachrichtenübermittlung sicherstellen",
        "explanation": "Falsch. Die Sicherstellung der Nachrichtenübermittlung ist Aufgabe des Gruppenführers und der eingesetzten Melder/Funker."
      },
      {
        "label": "e",
        "text": "Förderleitung langsam füllen und auf angeordneten Druck gehen",
        "explanation": "Korrekt. Langsames Füllen vermeidet Druckstöße, danach wird der vom Einsatzleiter/Pumpenmaschinisten der nächsten Pumpe angeforderte Druck eingestellt."
      },
      {
        "label": "f",
        "text": "An der Verstärker-Feuerlöschkreiselpumpe freien Druckausgang öffnen, damit Luft aus der Schlauchleitung entweichen kann",
        "explanation": "Korrekt. Bevor die Verstärkerpumpe Wasser von der vorherigen Pumpe erhält, muss die Luft aus der ankommenden Leitung entweichen können."
      },
      {
        "label": "g",
        "text": "Dass der Förderdruck von acht bar eingehalten wird",
        "explanation": "Korrekt. Ein üblicher Druck für die Wasserförderung über lange Strecken, um Druckverluste auszugleichen. Der genaue Wert wird aber oft per Funk abgestimmt."
      },
      {
        "label": "h",
        "text": "Bei Temperaturen unter 0° C stets für fließendes Wasser sorgen",
        "explanation": "Korrekt. Um ein Einfrieren der Leitung und Pumpe zu verhindern, muss das Wasser in Bewegung gehalten werden (z.B. durch leichten Bypass)."
      },
      {
        "label": "i",
        "text": "Förderleitung beaufsichtigen",
        "explanation": "Falsch. Die Beaufsichtigung der Förderleitung ist Aufgabe der Streckenposten oder des Schlauchtrupps, nicht des Maschinisten an der Pumpe."
      },
      {
        "label": "j",
        "text": "Dass Schlauchbrücken verlegt werden",
        "explanation": "Falsch. Das Verlegen von Schlauchbrücken ist Aufgabe der Trupps, die die Leitung legen."
      }
    ],
    "correctAnswers": ["e", "f", "g", "h"]
  },
  {
    "id": 29,
    "questionText": "Wie viel mm Abstand müssen zwischen Masse und Mittel-Elektrode bei Zündkerzen von Tragkraftspritzen PFPN 10/1000 vorhanden sein?",
    "options": [
      {
        "label": "a",
        "text": "Entsprechend der Betriebs- beziehungsweise Bedienungsanleitung",
        "explanation": "Korrekt. Der exakte Elektrodenabstand ist herstellerspezifisch und immer der aktuellen Betriebsanleitung der jeweiligen Tragkraftspritze zu entnehmen."
      },
      {
        "label": "b",
        "text": "Zehn Millimeter",
        "explanation": "Falsch. 10 mm ist ein viel zu großer Abstand für eine Zündkerze."
      },
      {
        "label": "c",
        "text": "Acht Millimeter",
        "explanation": "Falsch. 8 mm ist ebenfalls ein viel zu großer Abstand."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 30,
    "questionText": "Auf was muss bei der Überprüfung der Verkehrssicherheit an einem Feuerwehrfahrzeug geachtet werden?",
    "options": [
      {
        "label": "a",
        "text": "Beladung, Verriegelung der Schubfächer/Geräte",
        "explanation": "Korrekt. Lose oder ungesicherte Beladung kann während der Fahrt zur Gefahr werden."
      },
      {
        "label": "b",
        "text": "Signal-Warnanlage",
        "explanation": "Korrekt. Funktionierende Sondersignale (Blaulicht, Martinshorn) und Warnblinkanlage sind für Einsatzfahrten unerlässlich."
      },
      {
        "label": "c",
        "text": "Bereifung, Profiltiefe",
        "explanation": "Korrekt. Ausreichend Profil und korrekter Zustand der Reifen sind entscheidend für die Fahrsicherheit."
      }
    ],
    "correctAnswers": ["a", "b", "c"]
  },
  {
    "id": 31,
    "questionText": "Was muss vor der Prüfung der Leistungswerte (Garantie-Punkte) einer Feuerlöschkreiselpumpe durchgeführt werden?",
    "options": [
      {
        "label": "a",
        "text": "Geodätische Saughöhe muss überprüft werden",
        "explanation": "Korrekt. Die Garantiepunkte sind an definierte Saughöhen gebunden (z.B. 3m für Nennleistung). Diese muss korrekt eingestellt und gemessen werden."
      },
      {
        "label": "b",
        "text": "Ölstand überprüfen",
        "explanation": "Falsch. Der Ölstand des Antriebsmotors ist für den Betrieb wichtig, aber nicht eine direkte Vorbedingung für die *Messung* der Pumpenleistungswerte, solange der Motor läuft."
      },
      {
        "label": "c",
        "text": "Kraftstoffinhalt überprüfen",
        "explanation": "Falsch. Ausreichend Kraftstoff ist für den Betrieb wichtig, aber nicht eine direkte Vorbedingung für die *Messung* der Pumpenleistungswerte, solange der Motor für die Dauer der Prüfung läuft."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 32,
    "questionText": "Kreuzen Sie die Entlüftungseinrichtungen an, die verdrängungstechnisch wirken!",
    "options": [
      {
        "label": "a",
        "text": "Flüssigkeitsring-Entlüftungseinrichtung",
        "explanation": "Korrekt. Eine Flüssigkeitsringpumpe ist eine Verdrängerpumpe, bei der ein Flüssigkeitsring die Luft verdrängt."
      },
      {
        "label": "b",
        "text": "Doppel-Freikolben-Entlüftungseinrichtung",
        "explanation": "Korrekt. Kolbenpumpen sind klassische Verdrängerpumpen."
      },
      {
        "label": "c",
        "text": "Trockenring-Entlüftungseinrichtung",
        "explanation": "Korrekt. Ähnlich der Flüssigkeitsringpumpe, aber ohne separaten Flüssigkeitsvorrat, nutzt das Förderwasser. Wirkt ebenfalls nach dem Verdrängerprinzip."
      },
      {
        "label": "d",
        "text": "Gasstrahler (einstufig)-Entlüftungseinrichtung",
        "explanation": "Falsch. Ein Gasstrahler (Ejektor) arbeitet nach dem Strahlpumpenprinzip, nicht nach dem Verdrängerprinzip."
      },
      {
        "label": "e",
        "text": "Gasstrahler (zweistufig)-Entlüftungseinrichtung",
        "explanation": "Falsch. Arbeitet ebenfalls nach dem Strahlpumpenprinzip."
      }
    ],
    "correctAnswers": ["a", "b", "c"]
  },
  {
    "id": 33,
    "questionText": "Wann darf die Feuerwehr Sonderrechte im Straßenverkehr in Anspruch nehmen?",
    "options": [
      {
        "label": "a",
        "text": "Bei allen Einsätzen",
        "explanation": "Falsch. Sonderrechte sind nicht pauschal für jeden Einsatz erlaubt, sondern an bestimmte Bedingungen geknüpft."
      },
      {
        "label": "b",
        "text": "Wenn der Einsatzleiter es anordnet",
        "explanation": "Falsch. Die Anordnung des Einsatzleiters allein reicht nicht, die gesetzlichen Voraussetzungen müssen erfüllt sein."
      },
      {
        "label": "c",
        "text": "Wenn Menschenleben in Gefahr sind",
        "explanation": "Korrekt. Die Abwehr von Gefahren für Menschenleben ist ein wichtiger Grund für die Inanspruchnahme von Sonderrechten."
      },
      {
        "label": "d",
        "text": "Zur Erfüllung hoheitlicher Aufgaben, wenn höchste Eile dringend geboten ist",
        "explanation": "Korrekt. Dies ist die Kernaussage des §35 StVO. Die Feuerwehr erfüllt hoheitliche Aufgaben, und wenn höchste Eile geboten ist, um schwere Schäden abzuwenden, dürfen Sonderrechte in Anspruch genommen werden."
      }
    ],
    "correctAnswers": ["c", "d"]
  },
  {
    "id": 34,
    "questionText": "Bei einem Löschfahrzeug fällt die Entlüftungseinrichtung aus, weil die Auspuffanlage defekt ist. Welche Entlüftungseinrichtung hat das Fahrzeug?",
    "options": [
      {
        "label": "a",
        "text": "Flüssigkeitsring-Entlüftungseinrichtung",
        "explanation": "Falsch. Flüssigkeitsringpumpen werden meist elektrisch oder mechanisch direkt vom Pumpenantrieb angetrieben, nicht über die Auspuffanlage."
      },
      {
        "label": "b",
        "text": "Trockenring-Entlüftungseinrichtung",
        "explanation": "Falsch. Trockenringpumpen werden ebenfalls nicht über die Auspuffanlage angetrieben."
      },
      {
        "label": "c",
        "text": "Gasstrahler-Entlüftungseinrichtung",
        "explanation": "Korrekt. Gasstrahler (Ejektoren) nutzen die Abgase des Fahrzeugmotors als Treibgas. Ein Defekt der Auspuffanlage kann deren Funktion beeinträchtigen."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 35,
    "questionText": "Zur Überprüfung der Einsatzbereitschaft einer Feuerlöschkreiselpumpe müssen Trockensaugproben gemacht werden. Wie oft soll dies geschehen?",
    "options": [
      {
        "label": "a",
        "text": "Mindestens einmal im Jahr",
        "explanation": "Falsch. Jährlich ist zu selten, um die ständige Einsatzbereitschaft sicherzustellen."
      },
      {
        "label": "b",
        "text": "Mindestens einmal im Monat",
        "explanation": "Korrekt. Regelmäßige, z.B. monatliche, Überprüfungen sind üblich, um die Dichtheit und Funktion der Pumpe sicherzustellen."
      },
      {
        "label": "c",
        "text": "Nach jedem Einsatz und jeder Übung",
        "explanation": "Korrekt. Nach jeder Benutzung sollte die Pumpe überprüft werden, um sicherzustellen, dass sie für den nächsten Einsatz wieder voll funktionsfähig ist."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 36,
    "questionText": "Was tut man, wenn die grüne Kontrollleuchte einer Tragkraftspritze PFPN 10-1000 mit VW- Industriemotor während des Pumpenbetriebes plötzlich erlischt?",
    "options": [
      {
        "label": "a",
        "text": "Motor abstellen, Ursache überprüfen und beseitigen, Pumpe in Betrieb nehmen, Einsatzleiter verständigen",
        "explanation": "Falsch. Ein sofortiges Abstellen des Motors im Einsatz ist nicht immer die beste Option, wenn die Wasserförderung kritisch ist und die Ursache möglicherweise nur eine Kleinigkeit ist."
      },
      {
        "label": "b",
        "text": "Motordrehzahl etwas zurück nehmen, optisch prüfen, ob Keilriemen noch Gebläserad und Lichtmaschine antreibt, wenn ja, Wasserförderung nicht unterbrechen, da nur eine elektrische Störung vorliegt. Einsatzleiter verständigen",
        "explanation": "Korrekt. Die grüne Leuchte signalisiert oft die Ladekontrolle der Lichtmaschine. Wenn der Keilriemen intakt ist und die Pumpe weiter Wasser fördert, kann es sich um eine Störung der Ladeanzeige handeln. Die Wasserförderung sollte, wenn möglich, aufrechterhalten und der Einsatzleiter informiert werden."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 37,
    "questionText": "Warum müssen während des Betriebes alle Blindkupplungen an den Druckausgängen einer Feuerlöschkreiselpumpe angenommen werden?",
    "options": [
      {
        "label": "a",
        "text": "Weil der Druck in der Pumpe sonst zu groß würde",
        "explanation": "Falsch. Offene, nicht genutzte Druckausgänge würden den Druck eher senken, da Wasser austreten könnte."
      },
      {
        "label": "b",
        "text": "Weil sich zwischen dem Absperrorgan und der Blindkupplung ein Druck aufbauen könnte",
        "explanation": "Korrekt. Auch wenn das Absperrorgan (Niederschraubventil) geschlossen ist, kann durch geringe Undichtigkeiten oder thermische Ausdehnung Druck im Stutzen entstehen."
      },
      {
        "label": "c",
        "text": "Weil sonst beim späteren Abnehmen der Blindkupplungen erhöhte Unfallgefahr besteht",
        "explanation": "Korrekt. Steht der Stutzen unter Druck, kann die Blindkupplung beim Lösen mit Wucht wegfliegen und Personen verletzen."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 38,
    "questionText": "In welcher Stellung soll sich die Kupplung einer Tragkraftspritze PFPN 10/1000 befinden, wenn sie im Fahrzeug gelagert ist?",
    "options": [
      {
        "label": "a",
        "text": "Betrieb",
        "explanation": "Korrekt. Die Pumpe sollte im eingekuppelten Zustand ('Betrieb') gelagert werden, um bei Bedarf sofort einsatzbereit zu sein und ein versehentliches Starten des Motors ohne Pumpenantrieb zu vermeiden."
      },
      {
        "label": "b",
        "text": "Saugen",
        "explanation": "Falsch. 'Saugen' ist keine Kupplungsstellung, sondern ein Betriebszustand der Pumpe."
      },
      {
        "label": "c",
        "text": "Kupplung ein",
        "explanation": "Korrekt. 'Kupplung ein' (oder 'Betrieb') ist die eingekuppelte Stellung."
      },
      {
        "label": "d",
        "text": "Kupplung aus",
        "explanation": "Falsch. Im ausgekuppelten Zustand ist die Pumpe nicht sofort einsatzbereit."
      }
    ],
    "correctAnswers": ["a", "c"]
  },
  {
    "id": 39,
    "questionText": "Wie berechnet man überschlägig den Kraftstoffverbrauch bei einem Löschgruppenfahrzeug während des Einsatzes der Pumpe, wenn die Tankuhr defekt ist?",
    "options": [
      {
        "label": "a",
        "text": "Eine Betriebsstunde der Feuerlöschkreiselpumpe entspricht etwa 60 km Fahrleistung",
        "explanation": "Korrekt. Dies ist eine gängige Faustformel, um den Kraftstoffverbrauch im Pumpenbetrieb abzuschätzen, da die Pumpe unter Last ähnlich viel Kraftstoff verbrauchen kann wie das Fahrzeug bei einer bestimmten Fahrleistung."
      },
      {
        "label": "b",
        "text": "Eine Betriebsstunde der Feuerlöschkreiselpumpe entspricht etwa 100 km Fahrleistung",
        "explanation": "Falsch. 100 km ist in der Regel eine zu hohe Annahme für den Verbrauch einer Pumpenbetriebsstunde."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 40,
    "questionText": "Nach einem zweistündigen Einsatz an der Tragkraftspritze PFPN 10/1000 soll der Maschinist abgelöst werden. Worauf hat er zu achten, bevor er von der PFPN 10/1000 weggeht?",
    "options": [
      {
        "label": "a",
        "text": "Dass die Tragkraftspritze PFPN 10/1000 nur in stillstehendem Zustand übergeben wird",
        "explanation": "Falsch. Eine laufende Pumpe kann übergeben werden, wenn die Situation es erfordert und eine saubere Einweisung erfolgt."
      },
      {
        "label": "b",
        "text": "Dass ausreichend Kraftstoff vorhanden ist",
        "explanation": "Korrekt. Der ablösende Maschinist muss wissen, wie lange die Pumpe mit dem aktuellen Tankinhalt noch betrieben werden kann."
      },
      {
        "label": "c",
        "text": "Dass er den Ablösenden einweist",
        "explanation": "Korrekt. Eine gründliche Einweisung über den aktuellen Zustand, eingestellte Drücke, Besonderheiten etc. ist unerlässlich."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 41,
    "questionText": "Während des Einsatzes einer Feuerlöschkreiselpumpe bleibt plötzlich der Antriebsmotor stehen. Welche Ursachen sind denkbar?",
    "options": [
      {
        "label": "a",
        "text": "Motor und Motorenöl wurden zu heiß",
        "explanation": "Falsch. Überhitzung kann zwar zu Motorschäden führen, aber ein plötzliches Stehenbleiben wird eher durch andere Ursachen ausgelöst. Ein Festsitzen durch Überhitzung wäre ein schwerwiegender Schaden."
      },
      {
        "label": "b",
        "text": "Vergaser beziehungsweise Einspritzpumpe defekt",
        "explanation": "Korrekt. Probleme mit der Kraftstoffzufuhr durch einen defekten Vergaser oder eine defekte Einspritzpumpe können zum plötzlichen Ausfall des Motors führen."
      },
      {
        "label": "c",
        "text": "Kraftstoffmangel",
        "explanation": "Korrekt. Ohne Kraftstoff kann der Motor nicht laufen."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 42,
    "questionText": "Der statische beziehungsweise dynamische Prüfdruck beträgt bei den Feuerlöschkreiselpumpen FPN 10/1000",
    "options": [
      {
        "label": "a",
        "text": "15 bar bei stehender, 22,5 bar bei laufender Pumpe",
        "explanation": "Korrekt. Der statische Prüfdruck (Dichtheitsprobe bei stehender Pumpe) ist typischerweise 1,5-mal der Nenndruck (10 bar * 1,5 = 15 bar, oft aufgerundet oder nach Norm etwas höher). Der dynamische Prüfdruck (während des Betriebs) kann höher liegen, um die Festigkeit unter Last zu testen. Die Werte können je nach Norm leicht variieren, aber diese Option ist plausibel."
      },
      {
        "label": "b",
        "text": "16 bar bei stehender, 24,0 bar bei laufender Pumpe",
        "explanation": "Falsch. Während 16 bar als statischer Prüfdruck denkbar ist (z.B. bei Pumpen mit höherem Nenndruck oder spezifischen Normvorgaben), ist die Kombination hier weniger typisch für eine FPN 10/1000 im Vergleich zu Option a)."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 43,
    "questionText": "Welche Feuerwehrpumpen dürfen zum Fördern von Heizöl extra leicht verwendet werden?",
    "options": [
      {
        "label": "a",
        "text": "Handmembranpumpe",
        "explanation": "Korrekt. Handmembranpumpen sind oft für verschiedene Flüssigkeiten, auch Mineralölprodukte, geeignet, wenn sie entsprechend beständig sind."
      },
      {
        "label": "b",
        "text": "Tragkraftspritze",
        "explanation": "Falsch. Tragkraftspritzen (Feuerlöschkreiselpumpen) sind primär für Wasser konstruiert. Heizöl kann Dichtungen angreifen und es besteht Explosionsgefahr durch Dämpfe im Motorbereich, wenn die TS nicht EX-geschützt ist."
      },
      {
        "label": "c",
        "text": "Feuerlöschkreiselpumpe",
        "explanation": "Falsch. Siehe Erklärung bei Tragkraftspritze."
      },
      {
        "label": "d",
        "text": "Umfüllpumpe TUP 3-1,5 ex geschützt",
        "explanation": "Korrekt. 'Ex geschützt' bedeutet explosionsgeschützt, was für das Fördern von brennbaren Flüssigkeiten wie Heizöl notwendig ist. TUPs sind dafür ausgelegt."
      },
      {
        "label": "e",
        "text": "tragbare Tauchpumpe mit Elektromotor TP 4-1",
        "explanation": "Falsch. Standard-Tauchpumpen sind für Wasser, nicht für Heizöl. Es besteht die Gefahr der Beschädigung und bei nicht Ex-geschützten Motoren auch Explosionsgefahr."
      },
      {
        "label": "f",
        "text": "Lenz-Kreiselpumpe",
        "explanation": "Falsch. Lenzpumpen sind meist für Wasser oder Schmutzwasser ausgelegt, nicht für Heizöl."
      }
    ],
    "correctAnswers": ["a", "d"]
  },
  {
    "id": 44,
    "questionText": "Welche Tätigkeiten gehören zu den Aufgaben des Maschinisten nach der Feuerwehr-Dienstvorschrift FwDV 3 „Einheiten im Lösch- und Hilfeleistungseinsatz“?",
    "options": [
      {
        "label": "a",
        "text": "Bedienung der Feuerlöschkreiselpumpe",
        "explanation": "Korrekt. Dies ist eine der Hauptaufgaben des Maschinisten."
      },
      {
        "label": "b",
        "text": "Fahren des Löschfahrzeugs",
        "explanation": "Korrekt. Der Maschinist ist der Fahrer des Fahrzeugs."
      },
      {
        "label": "c",
        "text": "Absichern der Einsatzstelle",
        "explanation": "Falsch. Das Absichern der Einsatzstelle ist primär Aufgabe des Gruppenführers und der Trupps (z.B. Wassertrupp, Angriffstrupp), der Maschinist sichert das Fahrzeug."
      },
      {
        "label": "d",
        "text": "Mithilfe bei der Entnahme von Geräten aus dem Löschfahrzeug",
        "explanation": "Korrekt. Der Maschinist unterstützt die Trupps bei der Geräteentnahme."
      },
      {
        "label": "e",
        "text": "Bedienung von Sonderaggregaten",
        "explanation": "Korrekt. Dazu gehören Stromerzeuger, hydraulische Aggregate etc., die auf dem Fahrzeug verlastet sind."
      },
      {
        "label": "f",
        "text": "Anschließen der Schlauchleitungen an die Feuerlöschkreiselpumpe",
        "explanation": "Korrekt. Der Maschinist kuppelt die Druckschläuche an die Pumpe an."
      },
      {
        "label": "g",
        "text": "Bereitlegen von Kupplungsschlüsseln (falls erforderlich), Saugkorb, Saugschutzkorb, Halte- und Ventilleine bei offener Wasserentnahme",
        "explanation": "Korrekt. Dies sind vorbereitende Tätigkeiten für die Wasserentnahme."
      },
      {
        "label": "h",
        "text": "Standrohr in Stellung bringen bei Wasserentnahme aus dem Rohrnetz",
        "explanation": "Falsch. Das Setzen des Standrohrs ist Aufgabe des Wassertrupps."
      }
    ],
    "correctAnswers": ["a", "b", "d", "e", "f", "g"]
  },
  {
    "id": 45,
    "questionText": "Was sagt die Bezeichnung  TLF 2000\"?",
    "options": [
      {
        "label": "a",
        "text": "Es handelt sich um ein Trockenlöschfahrzeug",
        "explanation": "Falsch. 'T' steht für Tank, nicht für Trocken."
      },
      {
        "label": "b",
        "text": "Es handelt sich um ein Tanklöschfahrzeug",
        "explanation": "Korrekt. TLF steht für Tanklöschfahrzeug."
      },
      {
        "label": "c",
        "text": "Das Fahrzeug hat eine Feuerlöschkreiselpumpe FPN 15/10000",
        "explanation": "Falsch. Die '2000' bezieht sich auf den Mindest-Tankinhalt in Litern, nicht auf die Pumpenleistung. Eine FPN 15/10000 wäre eine extrem leistungsstarke Pumpe."
      },
      {
        "label": "d",
        "text": "Das Fahrzeug hat einen Motor mit 200 KW",
        "explanation": "Falsch. Die Fahrzeugbezeichnung gibt keine direkte Auskunft über die Motorleistung."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 46,
    "questionText": "Welche der nachfolgenden Feuerwehrfahrzeuge sind Löschfahrzeuge?",
    "options": [
      {
        "label": "a",
        "text": "Löschgruppenfahrzeug LF 20",
        "explanation": "Korrekt. LF steht für Löschgruppenfahrzeug."
      },
      {
        "label": "b",
        "text": "Tanklöschfahrzeug TLF 3000",
        "explanation": "Korrekt. TLF steht für Tanklöschfahrzeug."
      },
      {
        "label": "c",
        "text": "Löschgruppenfahrzeug LF 16TS",
        "explanation": "Korrekt. Ein älteres, aber immer noch verbreitetes Löschgruppenfahrzeug mit Tragkraftspritze."
      },
      {
        "label": "d",
        "text": "Schlauchwagen SW 2000",
        "explanation": "Falsch. Ein Schlauchwagen dient primär dem Transport von Schläuchen für die Wasserförderung über lange Wegstrecken, nicht als primäres Angriffs-Löschfahrzeug."
      },
      {
        "label": "e",
        "text": "Gerätewagen-Gefahrgut",
        "explanation": "Falsch. Ein GW-G ist für Gefahrguteinsätze ausgerüstet, nicht primär für die Brandbekämpfung."
      },
      {
        "label": "f",
        "text": "Tragkraftspritzenfahrzeug TSF",
        "explanation": "Korrekt. Ein TSF ist ein Löschfahrzeug, das eine tragbare Pumpe (TS) mitführt."
      }
    ],
    "correctAnswers": ["a", "b", "c", "f"]
  },
  {
    "id": 47,
    "questionText": "Welche der nachfolgenden kraftbetriebenen Geräte können sich nach Norm als zusätzliche Beladung auf einem genormten Löschfahrzeug befinden?",
    "options": [
      {
        "label": "a",
        "text": "Tauchpumpe TP 4-1",
        "explanation": "Korrekt. Tauchpumpen gehören oft zur Zusatzbeladung, z.B. für Hochwassereinsätze oder zum Auspumpen."
      },
      {
        "label": "b",
        "text": "Tragbarer Stromerzeuger 5 kVA",
        "explanation": "Korrekt. Stromerzeuger sind häufig Teil der Beladung für Beleuchtung und Betrieb elektrischer Geräte."
      },
      {
        "label": "c",
        "text": "Brennschneidgerät",
        "explanation": "Falsch. Brennschneidgeräte sind eher auf Rüstwagen oder speziellen Gerätewagen zu finden, nicht als Standard-Zusatzbeladung auf jedem Löschfahrzeug."
      },
      {
        "label": "d",
        "text": "Plasma-Schneidgerät",
        "explanation": "Falsch. Plasmaschneider sind spezielle Geräte, die nicht zur typischen Zusatzbeladung von Löschfahrzeugen gehören."
      },
      {
        "label": "e",
        "text": "Presslufthammer",
        "explanation": "Falsch. Presslufthämmer sind schwere Baugeräte und nicht Teil der Normbeladung von Löschfahrzeugen."
      },
      {
        "label": "f",
        "text": "Motorkettensäge",
        "explanation": "Korrekt. Motorkettensägen sind oft Teil der Beladung für technische Hilfeleistungen (z.B. Sturmschäden)."
      },
      {
        "label": "g",
        "text": "Hydraulisches Rettungsgerät",
        "explanation": "Korrekt. Auf Hilfeleistungslöschgruppenfahrzeugen (HLF) gehört ein hydraulischer Rettungssatz zur Normbeladung. Auf reinen Löschgruppenfahrzeugen (LF) kann es als Zusatzbeladung vorhanden sein."
      }
    ],
    "correctAnswers": ["a", "b", "f", "g"]
  },
  {
    "id": 48,
    "questionText": "Was beinhaltet die Bezeichnung  HLF 20\"?",
    "options": [
      {
        "label": "a",
        "text": "Löschgruppenfahrzeug",
        "explanation": "Korrekt. Das 'LF' in HLF steht für Löschgruppenfahrzeug. Das 'H' für Hilfeleistung."
      },
      {
        "label": "b",
        "text": "Eingebauter Löschwasserbehälter mit einer nutzbaren Wassermenge von mindestens 1600 Liter vorhanden",
        "explanation": "Korrekt. Bei einem HLF 20 (nach aktueller Normung, die sich an der Pumpenleistung orientiert) ist ein Löschwassertank von mindestens 1600 Litern (oft 2000 Liter oder mehr) üblich."
      },
      {
        "label": "c",
        "text": "Schnellangriff Wasser vorhanden",
        "explanation": "Korrekt. Ein Schnellangriff ist typisch für Fahrzeuge mit eigenem Wassertank."
      },
      {
        "label": "d",
        "text": "Feuerlöschkreiselpumpe FPN 10/1000 im Heck eingebaut",
        "explanation": "Falsch. Die '20' in HLF 20 bezieht sich auf die Pumpenleistung von 2000 l/min bei 10 bar (also FPN 10-2000). Eine FPN 10/1000 wäre für ein HLF 10."
      },
      {
        "label": "e",
        "text": "Feuerlöschkreiselpumpe FPN 15/1000 als Frontpumpe angebaut",
        "explanation": "Falsch. Die Pumpenbezeichnung und der Anbauort sind hier nicht korrekt für ein HLF 20."
      }
    ],
    "correctAnswers": ["a", "b", "c"]
  },
  {
    "id": 49,
    "questionText": "Was verstehen Sie unter dem Begriff „Entlüftungszeit“?",
    "options": [
      {
        "label": "a",
        "text": "Ein negativer Druck von - 0,8 bar muss in 30 Sekunden erreicht sein",
        "explanation": "Falsch. Dies beschreibt die Anforderung an die Trockensaugprobe (Dichtheit), nicht die Entlüftungszeit."
      },
      {
        "label": "b",
        "text": "Erforderliche Zeit in Sekunden, um eine Pumpe einschließlich der Saugleitung zu entlüften und das Löschwasser mit positivem Druck bis zum Austrittsquerschnitt zu fördern.",
        "explanation": "Korrekt. Dies ist die Definition der Entlüftungszeit, also die Zeit, bis die Pumpe nach dem Start des Entlüftungsvorgangs Wasser fördert."
      },
      {
        "label": "c",
        "text": "Er negative Druck darf von - 0,8 bar innerhalb einer Minute nicht mehr als 0,1 bar steigen",
        "explanation": "Falsch. Dies beschreibt ebenfalls eine Anforderung der Trockensaugprobe (Dichtheit über Zeit)."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 50,
    "questionText": "Warum benötigen Feuerlöschkreiselpumpen eine Entlüftungseinrichtung?",
    "options": [
      {
        "label": "a",
        "text": "Weil Ein- und Auslassventile nicht vorhanden sind",
        "explanation": "Falsch. Das Fehlen von Ventilen ist ein Merkmal von Kreiselpumpen, aber nicht der direkte Grund, warum sie eine Entlüftungseinrichtung brauchen. Verdrängerpumpen haben Ventile und sind oft selbstansaugend."
      },
      {
        "label": "b",
        "text": "Weil auch Schmutzwasser gefördert werden kann",
        "explanation": "Falsch. Die Fähigkeit, Schmutzwasser zu fördern, hat nichts mit der Notwendigkeit einer Entlüftungseinrichtung zu tun."
      },
      {
        "label": "c",
        "text": "Weil die Drehzahl des Laufrades zu niedrig ist",
        "explanation": "Falsch. Die Drehzahl ist für die Förderleistung relevant, aber Kreiselpumpen können prinzipbedingt keine Luft fördern, um ein Vakuum zu erzeugen, unabhängig von der Drehzahl."
      },
      {
        "label": "d",
        "text": "Weil der Luftdruck dem Wasserdruck entgegen wirkt",
        "explanation": "Falsch. Der äußere Luftdruck hilft ja gerade dabei, das Wasser in die entlüftete Saugleitung zu drücken."
      },
      {
        "label": "e",
        "text": "Weil zwischen Laufrad und Pumpengehäuse kein luftdichter Abschluss ist",
        "explanation": "Korrekt. Kreiselpumpen sind nicht selbstansaugend, weil sie Luft nicht effektiv verdrängen können, um den notwendigen Unterdruck zum Ansaugen von Wasser aus tieferliegenden Quellen zu erzeugen. Die Spalte zwischen Laufrad und Gehäuse sind für Wasser ausgelegt, nicht um Luft zu verdichten und ein Vakuum zu erzeugen."
      }
    ],
    "correctAnswers": ["e"]
  },
  {
    "id": 51,
    "questionText": "Welcher Zusammenhang besteht zwischen Saughöhe und Luftdruck?",
    "options": [
      {
        "label": "a",
        "text": "Hoher Luftdruck - hohe praktische Saughöhe",
        "explanation": "Korrekt. Der äußere Luftdruck drückt das Wasser in die entlüftete Saugleitung. Je höher der Luftdruck, desto höher kann die Wassersäule steigen."
      },
      {
        "label": "b",
        "text": "Niederer Luftdruck - hohe praktische Saughöhe",
        "explanation": "Falsch. Bei niederem Luftdruck (z.B. in Gebirgen) ist die maximal erreichbare Saughöhe geringer."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 52,
    "questionText": "Welche Knoten, Schläge oder Stiche sind zum Aufbau einer Saugleitung nach den Richtlinien erforderlich?",
    "options": [
      {
        "label": "a",
        "text": "Mastwurf",
        "explanation": "Korrekt. Zum Befestigen der Halte- und/oder Ventilleine am Saugkorb oder an einem Festpunkt."
      },
      {
        "label": "b",
        "text": "Pfahlstich",
        "explanation": "Falsch. Der Pfahlstich bildet eine feste Schlaufe und wird eher für Rettungszwecke oder zum Befestigen von Geräten verwendet, nicht typischerweise direkt beim Aufbau der Saugleitung selbst."
      },
      {
        "label": "c",
        "text": "Halbschlag",
        "explanation": "Korrekt. Oft zur Sicherung des Mastwurfs oder anderer Knoten verwendet."
      },
      {
        "label": "d",
        "text": "Schotenstich",
        "explanation": "Falsch. Dient zum Verbinden zweier Leinen."
      },
      {
        "label": "e",
        "text": "Doppelschlinge",
        "explanation": "Falsch. Wird eher zum Anschlagen von Lasten verwendet."
      },
      {
        "label": "f",
        "text": "Zimmermannschlag",
        "explanation": "Korrekt. Kann ebenfalls zum Befestigen der Halteleine am Saugkorb oder einem Festpunkt verwendet werden."
      }
    ],
    "correctAnswers": ["a", "c", "f"]
  },
  {
    "id": 53,
    "questionText": "Bei welcher Pumpe darf am Druckausgang beziehungsweise in der Druckleitung kein Absperr- organ angebracht werden?",
    "options": [
      {
        "label": "a",
        "text": "Wasserstrahlpumpe",
        "explanation": "Falsch. Wasserstrahlpumpen haben in der Regel keine Druckleitung, die abgesperrt werden müsste, da sie offen fördern."
      },
      {
        "label": "b",
        "text": "Turbinentauchpumpe",
        "explanation": "Falsch. Turbinentauchpumpen sind Kreiselpumpen und können mit Absperrorganen in der Druckleitung betrieben werden."
      },
      {
        "label": "c",
        "text": "Tauchpumpe mit elektrischem Antrieb",
        "explanation": "Falsch. Elektrische Tauchpumpen sind meist Kreiselpumpen und können mit Absperrorganen in der Druckleitung betrieben werden."
      },
      {
        "label": "d",
        "text": "Exzenterschneckenpumpe",
        "explanation": "Korrekt. Exzenterschneckenpumpen sind Verdrängerpumpen. Wird der Druckausgang bei laufender Pumpe geschlossen, steigt der Druck unzulässig an und kann die Pumpe oder Leitung zerstören. Sie benötigen ein Überdruckventil."
      },
      {
        "label": "e",
        "text": "Feuerlöschkreiselpumpe",
        "explanation": "Falsch. Feuerlöschkreiselpumpen können und werden mit Absperrorganen an den Druckausgängen betrieben."
      },
      {
        "label": "f",
        "text": "Fass- und Behälterpumpe",
        "explanation": "Falsch. Je nach Bauart (Kreisel- oder Verdrängerprinzip) können hier Absperrorgane zulässig sein oder nicht. Die Frage zielt aber auf ein generelles Verbot ab, was bei Exzenterschneckenpumpen zutrifft."
      }
    ],
    "correctAnswers": ["d"]
  },
  {
    "id": 54,
    "questionText": "Wovon hat sich der Maschinist zu überzeugen, bevor eine Einsatz- oder Unfallstelle verlassen wird?",
    "options": [
      {
        "label": "a",
        "text": "Brandwache bereitgestellt",
        "explanation": "Falsch. Die Entscheidung über eine Brandwache trifft der Einsatzleiter, nicht der Maschinist."
      },
      {
        "label": "b",
        "text": "Hydranten entwässert",
        "explanation": "Falsch. Das Entwässern von Hydranten ist Aufgabe des Wassertrupps oder der Einheit, die ihn benutzt hat."
      },
      {
        "label": "c",
        "text": "Verkehrssicherungsgerät ins Fahrzeug zurück gebracht",
        "explanation": "Korrekt. Der Maschinist ist für die Vollständigkeit der Fahrzeugbeladung mitverantwortlich."
      },
      {
        "label": "d",
        "text": "Feuerlöschkreiselpumpe entwässert",
        "explanation": "Korrekt. Um Frostschäden oder Korrosion zu vermeiden, muss die Pumpe nach Gebrauch entwässert werden."
      },
      {
        "label": "e",
        "text": "Absperreinrichtungen geschlossen und Blindkupplungen aufgesetzt",
        "explanation": "Korrekt. Alle Druckausgänge müssen geschlossen und mit Blindkupplungen versehen sein."
      },
      {
        "label": "f",
        "text": "Löschgruppe vollzählig",
        "explanation": "Falsch. Die Überprüfung der Vollzähligkeit der Mannschaft ist Aufgabe des Gruppenführers."
      }
    ],
    "correctAnswers": ["c", "d", "e"]
  },
  {
    "id": 55,
    "questionText": "Welche der folgenden Aussagen sind gemäß Unfallverhütungsvorschriften richtig?",
    "options": [
      {
        "label": "a",
        "text": "Der Fahrer eines Feuerwehrfahrzeuges hat erst dann anzufahren, wenn der Gruppenführer dazu das Zeichen gibt",
        "explanation": "Korrekt. Der Gruppenführer gibt das Kommando 'Aufsitzen!' und nach Überprüfung der Vollzähligkeit das Zeichen zum Abfahren."
      },
      {
        "label": "b",
        "text": "Während der Fahrt ist für die Einhaltung der Straßenverkehrsvorschriften allein der Fahrer verantwortlich",
        "explanation": "Korrekt. Der Fahrer (Maschinist) trägt die Verantwortung für die sichere Führung des Fahrzeugs im Straßenverkehr."
      },
      {
        "label": "c",
        "text": "Den sonstigen Straßenverkehr auf das abgestellte Feuerwehrfahrzeug aufmerksam machen",
        "explanation": "Korrekt. Abgestellte Einsatzfahrzeuge müssen gesichert und für andere Verkehrsteilnehmer erkennbar gemacht werden (z.B. Warnblinker, Beleuchtung)."
      },
      {
        "label": "d",
        "text": "Nie mit überladenem Fahrzeug fahren",
        "explanation": "Korrekt. Überladung beeinträchtigt die Fahrsicherheit und kann zu Schäden am Fahrzeug führen."
      },
      {
        "label": "e",
        "text": "Keine Schnelligkeit auf Kosten der Sicherheit",
        "explanation": "Korrekt. Auch bei Einsatzfahrten hat die Sicherheit oberste Priorität."
      },
      {
        "label": "f",
        "text": "Zusätzliche Schutzkleidung beim Betrieb der Motorkettensäge, des Trennschleifers und der hydraulischen Rettungsgeräte tragen",
        "explanation": "Korrekt. Für diese Arbeiten ist spezielle Schutzausrüstung (Schnittschutzkleidung, Gesichtsschutz, Gehörschutz etc.) vorgeschrieben."
      },
      {
        "label": "g",
        "text": "Wer Sonderrechte nach § 35 Straßenverkehrsordnung in Anspruch nimmt, ist zu erhöhter Aufmerksamkeit verpflichtet",
        "explanation": "Korrekt. Sonderrechte entbinden nicht von der Sorgfaltspflicht. Es muss stets auf andere Verkehrsteilnehmer geachtet werden."
      }
    ],
    "correctAnswers": ["a", "b", "c", "d", "e", "f", "g"]
  },
  {
    "id": 56,
    "questionText": "Während des Betriebes einer Tragkraftspritze PFPN 10/1000 mit VW-Industriemotor leuchtet anfangs die grüne Kontrolllampe auf und erlischt nach kurzer Zeit. Welche Ursachen können vorliegen?",
    "options": [
      {
        "label": "a",
        "text": "Der Öldruck hat sich verringert",
        "explanation": "Falsch. Ein Problem mit dem Öldruck würde eher durch eine rote Öldruck-Kontrollleuchte signalisiert."
      },
      {
        "label": "b",
        "text": "Die Glühbirne ist durchgebrannt",
        "explanation": "Korrekt. Eine defekte Glühbirne der Ladekontrollleuchte ist eine mögliche Ursache."
      },
      {
        "label": "c",
        "text": "Der Keilriemen ist abgerissen",
        "explanation": "Korrekt. Wenn der Keilriemen reißt, wird die Lichtmaschine nicht mehr angetrieben und die Ladekontrollleuchte (oft grün) würde aufleuchten oder, wenn sie vorher brannte, erlöschen, weil keine Spannung mehr erzeugt wird bzw. die Erregerspannung fehlt."
      },
      {
        "label": "d",
        "text": "Die Stromzuführung zur Glühbirne ist defekt",
        "explanation": "Korrekt. Ein Defekt in der Verkabelung kann ebenfalls zum Ausfall der Leuchte führen."
      }
    ],
    "correctAnswers": ["b", "c", "d"]
  },
  {
    "id": 57,
    "questionText": "Welches sind Einflüsse, die verhindern, dass die theoretische Saughöhe von 10,33 Meter praktisch nicht erreicht werden kann?",
    "options": [
      {
        "label": "a",
        "text": "Niederer Barometerstand als normal",
        "explanation": "Korrekt. Die Saughöhe ist direkt vom äußeren Luftdruck abhängig. Bei geringerem Luftdruck (z.B. in größeren Höhen oder bei Tiefdruckwetterlage) sinkt die maximal erreichbare Saughöhe."
      },
      {
        "label": "b",
        "text": "Entlüftungseinrichtung erzeugt kein vollkommenes Vakuum",
        "explanation": "Korrekt. Ein perfektes Vakuum ist technisch nicht erreichbar, was die praktische Saughöhe reduziert."
      },
      {
        "label": "c",
        "text": "Wassertemperatur ist höher als 4° C",
        "explanation": "Korrekt. Mit steigender Wassertemperatur steigt der Dampfdruck des Wassers. Wenn der Druck in der Saugleitung den Dampfdruck erreicht, beginnt das Wasser zu verdampfen (Kavitation), was die Saughöhe begrenzt. Bei 4°C hat Wasser seine höchste Dichte, aber der Dampfdruck ist hier der entscheidende Faktor."
      },
      {
        "label": "d",
        "text": "In der Saugleitung oder Feuerlöschkreiselpumpe sind Undichtigkeiten",
        "explanation": "Korrekt. Durch Undichtigkeiten wird Luft angesaugt, was den Aufbau des notwendigen Unterdrucks verhindert oder reduziert."
      },
      {
        "label": "e",
        "text": "Bei der saugseitigen Wasserförderung treten hydraulische Verluste (Strömungs- und Reibungsverluste) auf",
        "explanation": "Korrekt. Diese Verluste reduzieren den effektiv nutzbaren Druckunterschied und damit die praktische Saughöhe."
      },
      {
        "label": "f",
        "text": "Die Feuerlöschkreiselpumpe erreicht keine Nenndrehzahl mehr",
        "explanation": "Falsch. Die Drehzahl beeinflusst den Förderstrom und -druck, aber nicht direkt die *maximal mögliche theoretische Saughöhe*, die primär vom Luftdruck und den physikalischen Eigenschaften des Wassers abhängt. Eine zu geringe Drehzahl kann aber verhindern, dass die Pumpe überhaupt effektiv entlüftet oder Wasser gegen die vorhandene Saughöhe fördert."
      }
    ],
    "correctAnswers": ["a", "b", "c", "d", "e"]
  },
  {
    "id": 58,
    "questionText": "Wie kann sich der Maschinist helfen, wenn die Entlüftungseinrichtung der Feuerlöschkreiselpumpe ausgefallen ist?",
    "options": [
      {
        "label": "a",
        "text": "Bei Tanklöschfahrzeugen Feuerlöschkreiselpumpe und Saugleitung aus dem eingebauten Löschwasserbehälter füllen",
        "explanation": "Korrekt. Wenn die Pumpe und Saugleitung mit Wasser gefüllt sind (z.B. aus dem Tank), kann die Pumpe ohne Entlüftungseinrichtung Wasser fördern, solange der Wasserspiegel nicht unter Pumpenniveau sinkt oder die Saugleitung leerläuft."
      },
      {
        "label": "b",
        "text": "Gruppenführer benachrichtigen, damit eine Feuerlöschkreiselpumpe nachgefordert wird",
        "explanation": "Korrekt. Wenn die Pumpe nicht betriebsbereit gemacht werden kann, muss dies gemeldet und ggf. Ersatz angefordert werden."
      },
      {
        "label": "c",
        "text": "Pumpe und Saugleitung „von Hand“ auffüllen",
        "explanation": "Korrekt. Ist keine andere Möglichkeit vorhanden, kann versucht werden, die Saugleitung und Pumpe manuell mit Wasser zu befüllen (z.B. mit Eimern), um den Saugvorgang zu ermöglichen. Dies ist aber oft schwierig und zeitaufwendig."
      }
    ],
    "correctAnswers": ["a", "b", "c"]
  },
  {
    "id": 59,
    "questionText": "Worauf hat der Maschinist im Winter bei einer Flüssigkeitsring-Entlüftungseinrichtung zu achten?",
    "options": [
      {
        "label": "a",
        "text": "Dass die Feuerlöschkreiselpumpe nur im beheizten Feuerwehrhaus abgestellt wird",
        "explanation": "Falsch. Dies ist eine allgemeine Maßnahme zum Frostschutz, aber nicht spezifisch für die Flüssigkeitsring-Entlüftungseinrichtung allein. Die Pumpe muss auch nach Einsätzen bei Frost geschützt werden."
      },
      {
        "label": "b",
        "text": "Dass die Feuerlöschkreiselpumpe samt Entlüftungseinrichtung nach jedem Einsatz und jeder Übung entleert wird",
        "explanation": "Korrekt. Um Frostschäden zu vermeiden, müssen die Pumpe und die wasserführenden Teile der Entlüftungseinrichtung bei Frostgefahr vollständig entleert werden."
      },
      {
        "label": "c",
        "text": "Dass die Entlüftungseinrichtung mit Frostschutzmittel aufgefüllt wird",
        "explanation": "Korrekt. Bei einigen Bauarten von Flüssigkeitsringpumpen kann der Flüssigkeitsvorrat mit einem geeigneten Frostschutzmittel versehen werden, um ein Einfrieren zu verhindern."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 60,
    "questionText": "Wer ist bei einer Einsatzfahrt für das Feuerwehrfahrzeug verantwortlich?",
    "options": [
      {
        "label": "a",
        "text": "Der Maschinist als Fahrer des Feuerwehrfahrzeuges",
        "explanation": "Korrekt. Der Maschinist ist als Fahrer für die sichere Führung des Fahrzeugs und die Einhaltung der Verkehrsvorschriften verantwortlich."
      },
      {
        "label": "b",
        "text": "Der Gruppenführer",
        "explanation": "Falsch. Der Gruppenführer ist der Einheitsführer und für den Einsatzablauf verantwortlich, nicht aber für das Führen des Fahrzeugs im Straßenverkehr."
      },
      {
        "label": "c",
        "text": "Der Zugführer",
        "explanation": "Falsch. Der Zugführer führt einen Zug (mehrere Gruppen) und ist nicht direkt für ein einzelnes Fahrzeug während der Fahrt verantwortlich."
      }
    ],
    "correctAnswers": ["a"]
  }
];