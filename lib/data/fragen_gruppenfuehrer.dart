const List<Map<String, dynamic>> gruppenfuehrerFragenJson = [
  {
    "id": 1,
    "questionText": "Welche Aussagen sind richtig?",
    "options": [
      {
        "label": "a",
        "text": "Die Feuerwehr ist eine gemeinnützige, der Nächstenhilfe dienende Einrichtung",
        "explanation": "Korrekt. Dies beschreibt den Zweck und Charakter der Feuerwehr als öffentliche Einrichtung."
      },
      {
        "label": "b",
        "text": "Die Feuerwehr ist ein gemeinnütziger Verein",
        "explanation": "Falsch. Obwohl es Feuerwehrvereine gibt, ist die Feuerwehr als Institution selbst kein Verein, sondern eine Einrichtung der Gemeinde."
      },
      {
        "label": "c",
        "text": "Die Feuerwehr ist ein Verein, ohne eigene Rechtspersönlichkeit",
        "explanation": "Falsch. Die Feuerwehr ist eine Einrichtung der Gemeinde und hat als solche eine andere Rechtsform als ein Verein."
      },
      {
        "label": "d",
        "text": "Die Feuerwehr ist eine Einrichtung der Gemeinde",
        "explanation": "Korrekt. Laut Feuerwehrgesetz ist die Gemeinde für die Aufstellung und Unterhaltung ihrer Feuerwehr zuständig."
      }
    ],
    "correctAnswers": ["a", "d"]
  },
  {
    "id": 2,
    "questionText": "Welche Grundrechte können zur Erfüllung der Aufgaben der Feuerwehr nach § 2 des Feuerwehrgesetzes (FwG) Baden-Württemberg eingeschränkt werden?",
    "options": [
      {
        "label": "a",
        "text": "Freiheit der Person",
        "explanation": "Korrekt. Z.B. bei Evakuierungen oder dem Betretungsverbot von Gefahrenbereichen."
      },
      {
        "label": "b",
        "text": "Meinungsfreiheit / Pressefreiheit",
        "explanation": "Falsch. Diese Grundrechte werden durch Feuerwehreinsätze in der Regel nicht direkt eingeschränkt."
      },
      {
        "label": "c",
        "text": "Gleichheit vor dem Gesetz",
        "explanation": "Falsch. Das Prinzip der Gleichheit vor dem Gesetz bleibt unberührt."
      },
      {
        "label": "d",
        "text": "Versammlungsfreiheit",
        "explanation": "Falsch. Auch wenn eine Versammlung durch einen Einsatz betroffen sein kann, ist die Einschränkung dieses Grundrechts nicht das primäre Ziel oder eine typische Maßnahme."
      },
      {
        "label": "e",
        "text": "Unverletzlichkeit der Wohnung",
        "explanation": "Korrekt. Z.B. wenn zur Brandbekämpfung oder Menschenrettung eine Wohnung betreten werden muss."
      },
      {
        "label": "f",
        "text": "Recht auf Eigentum",
        "explanation": "Korrekt. Z.B. wenn zur Schadensbegrenzung Eigentum beschädigt werden muss (Aufbrechen einer Tür, Löschwasserschäden)."
      }
    ],
    "correctAnswers": ["a", "e", "f"]
  },
  {
    "id": 3,
    "questionText": "Welche Aufgabe hat der Feuerwehrausschuss (Abteilungsausschuss) entsprechend dem Feuerwehrgesetz (FwG) Baden-Württemberg und in welchen Zeitabständen ist er zu wählen?",
    "options": [
      {
        "label": "a",
        "text": "Jahresabschlussübung vorbereiten",
        "explanation": "Falsch. Die Übungsplanung ist Aufgabe der Führungskräfte, nicht primär des Ausschusses."
      },
      {
        "label": "b",
        "text": "Beratung des Kommandanten",
        "explanation": "Korrekt. Der Ausschuss berät den Kommandanten in wichtigen Angelegenheiten der Feuerwehr."
      },
      {
        "label": "c",
        "text": "Beschaffung von Feuerwehrfahrzeugen",
        "explanation": "Falsch. Die Beschaffung ist Aufgabe der Gemeinde, der Ausschuss kann beratend mitwirken."
      },
      {
        "label": "d",
        "text": "Feuerwehrangehörige bei fortgesetzter Nachlässigkeit im Dienst entlassen",
        "explanation": "Falsch. Disziplinarmaßnahmen obliegen dem Kommandanten bzw. der Gemeinde."
      },
      {
        "label": "e",
        "text": "Kommandant unterstützen",
        "explanation": "Korrekt. Der Ausschuss soll den Kommandanten bei seiner Arbeit unterstützen."
      },
      {
        "label": "f",
        "text": "Feuerwehrsatzung erstellen",
        "explanation": "Falsch. Die Feuerwehrsatzung wird von der Gemeinde erlassen."
      },
      {
        "label": "g",
        "text": "Drei Jahre",
        "explanation": "Falsch. Die Wahlperiode ist länger."
      },
      {
        "label": "h",
        "text": "Fünf Jahre",
        "explanation": "Korrekt. Der Feuerwehrausschuss wird für die Dauer von fünf Jahren gewählt."
      }
    ],
    "correctAnswers": ["b", "e", "h"]
  },
  {
    "id": 4,
    "questionText": "Welche Aufgaben obliegen dem Land nach dem Feuerwehrgesetz Baden-Württemberg?",
    "options": [
      {
        "label": "a",
        "text": "Förderung der Aus- und Fortbildung",
        "explanation": "Korrekt. Das Land unterstützt die Qualifizierung der Feuerwehrangehörigen."
      },
      {
        "label": "b",
        "text": "Errichtung und Unterhaltung einer Landesfeuerwehrschule",
        "explanation": "Korrekt. Die Landesfeuerwehrschule ist eine zentrale Einrichtung des Landes."
      },
      {
        "label": "c",
        "text": "Lohnfortzahlung an Arbeitnehmer bei Arbeitsunfähigkeit in Folge eines Feuerwehreinsatzes",
        "explanation": "Falsch. Die Lohnfortzahlung im Krankheitsfall ist Aufgabe des Arbeitgebers bzw. der Sozialversicherung, nicht direkt des Landes im Rahmen des FwG."
      },
      {
        "label": "d",
        "text": "Angehörige der Feuerwehr gegen Haftpflicht versichern",
        "explanation": "Falsch. Die Versicherung der Feuerwehrangehörigen ist Aufgabe der Gemeinde als Träger der Feuerwehr."
      },
      {
        "label": "e",
        "text": "Gemeinden bei der Beschaffung von Ausrüstung unterstützen",
        "explanation": "Korrekt. Das Land gewährt Zuschüsse für Fahrzeuge und Geräte."
      },
      {
        "label": "f",
        "text": "Förderung der Normung und Forschung",
        "explanation": "Korrekt. Das Land wirkt bei der Standardisierung und Weiterentwicklung im Feuerwehrwesen mit."
      },
      {
        "label": "g",
        "text": "Für jeden Landkreis mindestens einen Kreisbrandmeister nach Anhörung der Kommandanten bestellen",
        "explanation": "Falsch. Der Kreisbrandmeister wird vom Landratsamt bestellt, nicht direkt vom Land im Sinne der Landesregierung."
      }
    ],
    "correctAnswers": ["a", "b", "e", "f"]
  },
  {
    "id": 5,
    "questionText": "Welches sind die Dienstpflichten der ehrenamtlich tätigen Angehörigen der Gemeindefeuerwehr?",
    "options": [
      {
        "label": "a",
        "text": "Am Dienst einschließlich der Aus- und Fortbildung regelmäßig und pünktlich teilnehmen",
        "explanation": "Korrekt. Dies ist eine Grundvoraussetzung für die Einsatzbereitschaft."
      },
      {
        "label": "b",
        "text": "Den dienstlichen Weisungen der Vorgesetzten nachkommen",
        "explanation": "Korrekt. Im hierarchischen System der Feuerwehr ist dies unerlässlich."
      },
      {
        "label": "c",
        "text": "Sich im Dienst vorbildlich und kameradschaftlich verhalten",
        "explanation": "Korrekt. Ein gutes Miteinander und Auftreten sind wichtig."
      },
      {
        "label": "d",
        "text": "Bei Alarm unverzüglich zur Einsatzstelle fahren",
        "explanation": "Falsch. Bei Alarm ist sich unverzüglich am Feuerwehrhaus einzufinden, nicht direkt zur Einsatzstelle zu fahren (Ausnahmen können geregelt sein, sind aber nicht die Regel)."
      },
      {
        "label": "e",
        "text": "Bei Alarm sich unverzüglich am Alarmplatz (Feuerwehrhaus) einzufinden",
        "explanation": "Korrekt. Von dort rückt die Feuerwehr geschlossen aus."
      },
      {
        "label": "f",
        "text": "Die technische Einsatzleitung übernehmen",
        "explanation": "Falsch. Die Einsatzleitung wird von qualifizierten Führungskräften übernommen, nicht von jedem Angehörigen."
      },
      {
        "label": "g",
        "text": "Hydrantenplan erstellen",
        "explanation": "Falsch. Die Erstellung von Hydrantenplänen ist Aufgabe der Gemeinde bzw. der Feuerwehrführung, nicht jedes einzelnen Angehörigen."
      }
    ],
    "correctAnswers": ["a", "b", "c", "e"]
  },
  {
    "id": 6,
    "questionText": "Welche der Aussagen ist richtig?",
    "options": [
      {
        "label": "a",
        "text": "Feuerwehrangehörige sind bei der der Alarmfahrt mit dem eigenen Pkw zum Feuerwehrgerätehaus berechtigt, die §§ 35 und 38 der StVO in Anspruch zu nehmen, sie müssen nur dauernd hupen",
        "explanation": "Falsch. Sonderrechte nach §35 StVO gelten für Einsatzfahrzeuge, nicht für die private Anfahrt zum Gerätehaus. Dauerndes Hupen ist keine Legitimation."
      },
      {
        "label": "b",
        "text": "Feuerwehrangehörige müssen bei der Fahrt mit ihrem Pkw zum Feuerwehrhaus, auch bei einem Alarm, die allgemeinen Regeln der StVO einhalten",
        "explanation": "Korrekt. Für die Privatfahrt zum Gerätehaus gelten die normalen Verkehrsregeln. Es kann Ausnahmegenehmigungen geben, aber die Aussage an sich ist die Grundregel."
      },
      {
        "label": "c",
        "text": "Ein Anwesenheitsnachweis beim Einsatz- und Übungsdienst gehört zu einem geregelten Dienstbetrieb der Feuerwehr",
        "explanation": "Korrekt. Dies dient der Dokumentation und Übersicht."
      },
      {
        "label": "d",
        "text": "Die Gemeindefeuerwehr muss jährlich einen Dienstplan erstellen, der den Umfang und die Inhalte des Ausbildungs- und Übungsdienstes verbindlich festlegt",
        "explanation": "Korrekt. Ein Dienstplan ist für eine strukturierte Ausbildung unerlässlich."
      }
    ],
    "correctAnswers": ["b", "c", "d"]
  },
  {
    "id": 7,
    "questionText": "Wer entscheidet darüber, ob eine Katastrophe vorliegt?",
    "options": [
      {
        "label": "a",
        "text": "Der Feuerwehr-Einsatzleiter (Technischer Einsatzleiter)",
        "explanation": "Falsch. Der Einsatzleiter der Feuerwehr leitet den Feuerwehreinsatz, stellt aber nicht offiziell den Katastrophenfall fest."
      },
      {
        "label": "b",
        "text": "Die Ortspolizeibehörde",
        "explanation": "Falsch. Die Ortspolizeibehörde hat andere Zuständigkeiten."
      },
      {
        "label": "c",
        "text": "Die Katastrophenschutzbehörde",
        "explanation": "Korrekt. Die zuständige Katastrophenschutzbehörde (z.B. Landratsamt) stellt den Katastrophenfall offiziell fest."
      },
      {
        "label": "d",
        "text": "Das Lagezentrum im Regierungspräsidium",
        "explanation": "Falsch. Das Lagezentrum koordiniert, entscheidet aber nicht über die Feststellung des Katastrophenfalls."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 8,
    "questionText": "Welches sind die Katastrophenschutzbehörden nach dem Landeskatastrophenschutzgesetz?",
    "options": [
      {
        "label": "a",
        "text": "Die Berufsfeuerwehr eine Gemeinde",
        "explanation": "Falsch. Berufsfeuerwehren sind Einheiten des Katastrophenschutzes, aber nicht die Behörde, die den Katastrophenfall feststellt."
      },
      {
        "label": "b",
        "text": "Landratsämter und Bürgermeister der Stadtkreise",
        "explanation": "Korrekt. Dies sind die unteren Katastrophenschutzbehörden."
      },
      {
        "label": "c",
        "text": "Die Landesregierung",
        "explanation": "Falsch. Die Landesregierung ist die oberste politische Ebene, aber nicht die direkt handelnde Katastrophenschutzbehörde in diesem Sinne."
      },
      {
        "label": "d",
        "text": "Die Regierungspräsidien",
        "explanation": "Korrekt. Dies sind die höheren Katastrophenschutzbehörden."
      },
      {
        "label": "e",
        "text": "Das Innenministerium",
        "explanation": "Korrekt. Das Innenministerium ist die oberste Katastrophenschutzbehörde des Landes."
      }
    ],
    "correctAnswers": ["b", "d", "e"]
  },
  {
    "id": 9,
    "questionText": "Was versteht man unter dem Begriff „untere Explosionsgrenze“?",
    "options": [
      {
        "label": "a",
        "text": "Die Temperatur, bei der eine Explosion frühestens möglich ist",
        "explanation": "Falsch. Das wäre eher der Flammpunkt oder die Zündtemperatur."
      },
      {
        "label": "b",
        "text": "Die Explosion eines Gas-Luft-Gemisches unter Erdgleiche",
        "explanation": "Falsch. Der Ort der Explosion ist hier irrelevant."
      },
      {
        "label": "c",
        "text": "Der niedrigste Sauerstoffgehalt (%) in der Luft, bei dem eine Explosion möglich ist",
        "explanation": "Falsch. Die Explosionsgrenzen beziehen sich auf die Konzentration des brennbaren Stoffes, nicht primär des Sauerstoffs (obwohl Sauerstoff natürlich notwendig ist)."
      },
      {
        "label": "d",
        "text": "Die niedrigste Konzentration des brennbaren Stoffes im Gemisch von Gasen, Dämpfen, Nebeln und/oder Stäuben, in dem sich nach dem Zünden ein Brennen gerade nicht mehr selbstständig fortpflanzen kann",
        "explanation": "Korrekt. Unterhalb dieser Konzentration ist das Gemisch zu 'mager' und kann nicht explodieren oder selbstständig weiterbrennen."
      }
    ],
    "correctAnswers": ["d"]
  },
  {
    "id": 10,
    "questionText": "Welche der aufgeführten Stoffe gehören zur Brandklasse A?",
    "options": [
      {
        "label": "a",
        "text": "Acetylen",
        "explanation": "Falsch. Acetylen ist ein Gas und gehört zur Brandklasse C."
      },
      {
        "label": "b",
        "text": "Aceton",
        "explanation": "Falsch. Aceton ist eine brennbare Flüssigkeit und gehört zur Brandklasse B."
      },
      {
        "label": "c",
        "text": "Ammoniak",
        "explanation": "Falsch. Ammoniak ist ein Gas und unter bestimmten Bedingungen brennbar (Brandklasse C), aber nicht typisch für Brandklasse A."
      },
      {
        "label": "d",
        "text": "Autoreifen",
        "explanation": "Korrekt. Autoreifen bestehen aus festen, organischen Materialien und brennen unter Glutbildung."
      },
      {
        "label": "e",
        "text": "Baumwolle",
        "explanation": "Korrekt. Baumwolle ist ein fester, organischer Stoff."
      },
      {
        "label": "f",
        "text": "Holz (Hobelspäne)",
        "explanation": "Korrekt. Holz ist ein klassischer Vertreter der Brandklasse A."
      },
      {
        "label": "g",
        "text": "Bienenwachs",
        "explanation": "Falsch. Bienenwachs schmilzt bei Erwärmung und brennt dann als Flüssigkeit, gehört also zur Brandklasse B."
      }
    ],
    "correctAnswers": ["d", "e", "f"]
  },
  {
    "id": 11,
    "questionText": "Bei welchem der aufgeführten Löschmittel ist der Stickeffekt als Hauptlöscheffekt zu betrachten?",
    "options": [
      {
        "label": "a",
        "text": "Wasser als Sprühstrahl",
        "explanation": "Falsch. Bei Wasser ist der Kühleffekt der Hauptlöscheffekt. Ein leichter Stickeffekt kann durch Wasserdampf entstehen, ist aber sekundär."
      },
      {
        "label": "b",
        "text": "Kohlenstoffdioxid",
        "explanation": "Korrekt. CO2 verdrängt den Sauerstoff am Brandherd und erstickt so das Feuer."
      },
      {
        "label": "c",
        "text": "Pulver für Brandklasse B und C",
        "explanation": "Falsch. BC-Pulver wirkt hauptsächlich durch Inhibition (antikatalytischer Effekt)."
      },
      {
        "label": "d",
        "text": "Pulver für Brandklasse A, B und C",
        "explanation": "Falsch. ABC-Pulver wirkt bei Brandklasse A durch Schmelzschichtbildung (Trenneffekt) und bei B/C durch Inhibition."
      },
      {
        "label": "e",
        "text": "Luftschaum mit 75facher Verschäumung",
        "explanation": "Korrekt. Schaum legt sich als Decke über den Brand und trennt den Brennstoff vom Sauerstoff (Stickeffekt). Zusätzlich hat er einen Kühleffekt."
      }
    ],
    "correctAnswers": ["b", "e"]
  },
  {
    "id": 12,
    "questionText": "Bei welchen Einsätzen ist Wasser als Löschmittel nicht anzuwenden?",
    "options": [
      {
        "label": "a",
        "text": "Schornsteinbrände",
        "explanation": "Korrekt. Wasser würde im heißen Schornstein schlagartig verdampfen, der entstehende Druck kann den Schornstein sprengen."
      },
      {
        "label": "b",
        "text": "bei Zersetzung von Düngemittel",
        "explanation": "Falsch. Bei bestimmten Düngemittelbränden kann Wasser zur Kühlung eingesetzt werden, es muss aber die Art des Düngemittels beachtet werden."
      },
      {
        "label": "c",
        "text": "Metallbrände",
        "explanation": "Korrekt. Wasser kann mit brennenden Metallen heftig reagieren (z.B. Knallgasbildung)."
      },
      {
        "label": "d",
        "text": "Heustockbrände",
        "explanation": "Falsch. Wasser wird bei Heustockbränden eingesetzt, oft mit Netzmittel, um tief eindringen zu können."
      },
      {
        "label": "e",
        "text": "Schwelbrände in Kellergeschossen",
        "explanation": "Falsch. Wasser kann bei Schwelbränden eingesetzt werden, oft als Sprühstrahl zur Minimierung von Wasserschäden und zur besseren Dampfbildung."
      },
      {
        "label": "f",
        "text": "Mineralölbrände",
        "explanation": "Korrekt. Wasser (außer als feiner Sprühnebel bei bestimmten Situationen) würde brennendes Öl verteilen und kann zu Fettexplosionen führen, wenn das Öl heißer als 100°C ist."
      }
    ],
    "correctAnswers": ["a", "c", "f"]
  },
  {
    "id": 13,
    "questionText": "Wodurch ist eine Kraft gekennzeichnet?",
    "options": [
      {
        "label": "a",
        "text": "Größe der Kraft",
        "explanation": "Korrekt. Die Kraft hat einen Betrag (z.B. in Newton)."
      },
      {
        "label": "b",
        "text": "Geschwindigkeit der Kraft",
        "explanation": "Falsch. Eine Kraft selbst hat keine Geschwindigkeit; sie kann aber eine Geschwindigkeitsänderung (Beschleunigung) bewirken."
      },
      {
        "label": "c",
        "text": "Richtung der Kraft",
        "explanation": "Korrekt. Eine Kraft wirkt immer in eine bestimmte Richtung."
      },
      {
        "label": "d",
        "text": "Dauer der Kraftwirkung (Minuten / Sekunden)",
        "explanation": "Falsch. Die Dauer der Kraftwirkung ist ein anderer Aspekt (Impuls), aber nicht ein Kennzeichen der Kraft selbst zu einem bestimmten Zeitpunkt."
      },
      {
        "label": "e",
        "text": "Angriffspunkt der Kraft",
        "explanation": "Korrekt. Die Kraft wirkt an einem bestimmten Punkt auf einen Körper."
      }
    ],
    "correctAnswers": ["a", "c", "e"]
  },
  {
    "id": 14,
    "questionText": "Welche Höchstlast L kann bei der vorliegenden Seilführung mit einem Mehrzweckzug Z 16 (Zugkraft 16 kN) gehoben werden? (Bild mit Seilführung: Fp1 -> Rolle -> Last -> Rolle -> Fp2, Zug am Z16, der an Fp3 befestigt ist)",
    "options": [
      {
        "label": "a",
        "text": "L = 1600 kg",
        "explanation": "Falsch. Hier wird die Zugkraft durch die Rollen verdoppelt. 16 kN entsprechen ca. 1600 kg Zugkraft des Geräts."
      },
      {
        "label": "b",
        "text": "L = 3200 kg",
        "explanation": "Korrekt. Es handelt sich um einen Flaschenzug mit zwei tragenden Seilteilen (lose Rolle). Die Zugkraft des Z16 (16 kN) wird verdoppelt. 16 kN * 2 = 32 kN. 1 kN entspricht ca. 100 kg, also 32 kN * 100 kg/kN = 3200 kg."
      },
      {
        "label": "c",
        "text": "L = 4800 kg",
        "explanation": "Falsch. Dies würde eine Verdreifachung der Zugkraft bedeuten."
      },
      {
        "label": "d",
        "text": "L = 6400 kg",
        "explanation": "Falsch. Dies würde eine Vervierfachung der Zugkraft bedeuten."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 15,
    "questionText": "Für welchen Fahrbereich (km) oder Betrieb (h) fest eingebauter Aggregate muss der Kraftstoff bei Feuerwehrfahrzeugen mindestens ausreichend sein?",
    "options": [
      {
        "label": "a",
        "text": "200 km oder 2 h",
        "explanation": "Falsch. Die Anforderungen sind höher."
      },
      {
        "label": "b",
        "text": "300 km oder 3 h",
        "explanation": "Falsch. Die Betriebsdauer der Aggregate ist länger gefordert."
      },
      {
        "label": "c",
        "text": "300 km oder 4 h",
        "explanation": "Korrekt. Dies sind die Mindestanforderungen nach Norm für die Kraftstoffbevorratung."
      },
      {
        "label": "d",
        "text": "400 km oder 4 h",
        "explanation": "Falsch. Der Fahrbereich ist mit 300 km normiert."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 16,
    "questionText": "Welche Feuerwehrpumpen gehören nach Norm zu einem Löschgruppenfahrzeug LF 10?",
    "options": [
      {
        "label": "a",
        "text": "FPN 10/750",
        "explanation": "Falsch. Ein LF 10 hat eine leistungsstärkere Pumpe."
      },
      {
        "label": "b",
        "text": "FPN 10/1000",
        "explanation": "Korrekt. Ein LF 10 ist standardmäßig mit einer Feuerlöschkreiselpumpe FPN 10-1000 (1000 l/min bei 10 bar) ausgerüstet."
      },
      {
        "label": "c",
        "text": "TUP 3-1,5",
        "explanation": "Falsch. Eine TUP (Umfüllpumpe) ist keine Feuerlöschkreiselpumpe für den Löscheinsatz."
      },
      {
        "label": "d",
        "text": "TP 8/1",
        "explanation": "Falsch. Eine TP (Tauchpumpe) ist eine andere Pumpenart und nicht die Haupt-Feuerlöschpumpe eines LF 10."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 17,
    "questionText": "Welchen Inhalt muss der eingebaute Löschwasserbehälter bei einem Löschgruppenfahrzeug LF 20 nach Norm mindestens haben?",
    "options": [
      {
        "label": "a",
        "text": "800 Liter",
        "explanation": "Falsch. Ein LF 20 hat einen größeren Tank."
      },
      {
        "label": "b",
        "text": "1200 Liter",
        "explanation": "Falsch. Dies ist eher der Bereich eines LF 10 oder kleinerer TLFs."
      },
      {
        "label": "c",
        "text": "1600 Liter",
        "explanation": "Korrekt. Ein LF 20 hat nach aktueller Normung oft einen Tank von mindestens 1600 Litern, häufig auch 2000 Liter oder mehr."
      },
      {
        "label": "d",
        "text": "2500 Liter",
        "explanation": "Falsch. Dies wäre ein sehr großer Tank für ein LF 20, eher im Bereich größerer Tanklöschfahrzeuge."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 18,
    "questionText": "Wie reagiert ein Gruppenführer auf die Lagemeldung eines Angriffstrupps, wenn dieser meldet, er habe beim Vorgehen zur Brandbekämpfung in einem Raum Fässer mit brennbarer Flüssigkeit gefunden? Der Gruppenführer weist den Angriffstrupp an:",
    "options": [
      {
        "label": "a",
        "text": "Die Fässer heraus zu tragen",
        "explanation": "Falsch. Das Herausbringen von Fässern mit unbekanntem oder brennbarem Inhalt ist ohne weitere Erkundung und Sicherungsmaßnahmen sehr gefährlich."
      },
      {
        "label": "b",
        "text": "Die Gefahrensymbole zu beschreiben",
        "explanation": "Korrekt. Die Beschreibung der Symbole gibt wichtige Hinweise auf die Art der Gefahr."
      },
      {
        "label": "c",
        "text": "Den Zustand der Fässer zu beschreiben",
        "explanation": "Korrekt. Sind die Fässer beschädigt, undicht, heiß? Dies ist wichtig für die Lagebeurteilung."
      },
      {
        "label": "d",
        "text": "Die Fässer zu kühlen",
        "explanation": "Falsch. Kühlen kann eine Maßnahme sein, aber erst nach genauerer Lageerkundung und Risikobewertung."
      },
      {
        "label": "e",
        "text": "Die Fässer abzulöschen",
        "explanation": "Falsch. Ein direktes Ablöschen ohne Kenntnis des Inhalts und der Situation kann gefährlich sein."
      },
      {
        "label": "f",
        "text": "An den Fässern nicht vorbeigehen",
        "explanation": "Korrekt. Bis zur Klärung der Gefahr sollte der Trupp einen Sicherheitsabstand wahren und nicht tiefer in den Gefahrenbereich vordringen."
      }
    ],
    "correctAnswers": ["b", "c", "f"]
  },
  {
    "id": 19,
    "questionText": "Wann ist an Brandstellen mit gefährlichen Konzentrationen von Kohlenstoffmonoxid CO zu rechnen?",
    "options": [
      {
        "label": "a",
        "text": "Nach einer Explosion",
        "explanation": "Falsch. Nach einer Explosion können viele verschiedene Gase entstehen, aber CO ist nicht das typischste Primärprodukt einer Explosion selbst, sondern eher von nachfolgenden Bränden."
      },
      {
        "label": "b",
        "text": "Bei Bränden in geschlossenen Räumen bei mangelnder Luftzufuhr",
        "explanation": "Korrekt. Bei unvollständiger Verbrennung (Sauerstoffmangel) entsteht vermehrt CO."
      },
      {
        "label": "c",
        "text": "Bei Schwelbränden der Brandklasse A",
        "explanation": "Korrekt. Schwelbrände sind typische Beispiele für unvollständige Verbrennung mit hoher CO-Produktion."
      },
      {
        "label": "d",
        "text": "Bei Bränden der Brandklasse C",
        "explanation": "Falsch. Bei Gasbränden (Brandklasse C) mit ausreichender Luftzufuhr verbrennen Gase oft vollständiger zu CO2. CO kann aber auch hier bei Sauerstoffmangel entstehen."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 20,
    "questionText": "Welche der aufgeführten Atemgifte wirken durch Reiz- und Ätzwirkung schädigend auf den Menschen?",
    "options": [
      {
        "label": "a",
        "text": "Kohlenstoffdioxid",
        "explanation": "Falsch. CO2 wirkt erstickend, indem es den Sauerstoff verdrängt, aber nicht primär reizend oder ätzend."
      },
      {
        "label": "b",
        "text": "Blausäure und Dämpfe von Methylalkohol",
        "explanation": "Falsch. Blausäure ist ein starkes Blutgift (blockiert die Zellatmung). Methylalkohol ist giftig für das Nervensystem. Sie wirken nicht primär durch Reizung/Ätzung der Atemwege."
      },
      {
        "label": "c",
        "text": "Chlor und Säuredämpfe",
        "explanation": "Korrekt. Chlor und Säuredämpfe (z.B. Salzsäure, Schwefelsäure) sind stark reizend und ätzend für die Atemwege und Schleimhäute."
      },
      {
        "label": "d",
        "text": "Nitrose Gase",
        "explanation": "Korrekt. Nitrose Gase (Stickoxide) sind stark reizend und können zu schweren Lungenschäden führen."
      },
      {
        "label": "e",
        "text": "Stickstoff und Methan",
        "explanation": "Falsch. Stickstoff und Methan sind erstickende Gase (Inertgase), sie verdrängen den Sauerstoff, wirken aber nicht reizend oder ätzend."
      }
    ],
    "correctAnswers": ["c", "d"]
  },
  {
    "id": 21,
    "questionText": "In welchen der farblich gekennzeichneten Druckgasflaschen befinden sich brennbare Gase? In Klammer () ältere Kennzeichnung.",
    "options": [
      {
        "label": "a",
        "text": "Blaue Flaschen mit zwei weißen Kreisen auf der Flaschenschulter",
        "explanation": "Falsch. Blau kennzeichnet Sauerstoff (oxidierend)."
      },
      {
        "label": "b",
        "text": "Kastanienbraune Flasche (gelb)",
        "explanation": "Korrekt. Kastanienbraun (früher gelb) kennzeichnet Acetylen (hochentzündlich)."
      },
      {
        "label": "c",
        "text": "Grüne Flasche",
        "explanation": "Falsch. Grün kennzeichnet inerte Gase wie Argon oder Stickstoff (für medizinische Zwecke auch Sauerstoff, aber dann anders markiert)."
      },
      {
        "label": "d",
        "text": "Rote Flasche",
        "explanation": "Korrekt. Rot kennzeichnet allgemein brennbare Gase (z.B. Wasserstoff, Propan/Butan-Gemische)."
      },
      {
        "label": "e",
        "text": "Graue Flasche",
        "explanation": "Falsch. Grau kennzeichnet oft Luft oder andere nicht brennbare, nicht giftige Gase."
      },
      {
        "label": "f",
        "text": "Graue Flasche mit roter Gasflaschenschulter",
        "explanation": "Korrekt. Die rote Schulter auf einer sonst andersfarbigen Flasche (hier grau) signalisiert ebenfalls ein brennbares Gas (z.B. Formiergas)."
      }
    ],
    "correctAnswers": ["b", "d", "f"]
  },
  {
    "id": 22,
    "questionText": "Eine Acetylengasflasche ist längere Zeit der Brandwärme ausgesetzt. Was müssen Sie beachten?",
    "options": [
      {
        "label": "a",
        "text": "Eine weitere Erwärmung kann zu einem Druckgefäßzerknall führen",
        "explanation": "Korrekt. Durch die Erwärmung steigt der Druck in der Flasche, und Acetylen kann sich bei Erwärmung zersetzen, was zu einem extremen Druckanstieg und Zerknall führen kann."
      },
      {
        "label": "b",
        "text": "Flasche muss aus geschützter Stellung fortlaufend gekühlt werden",
        "explanation": "Korrekt. Kühlen mit viel Wasser ist die wichtigste Maßnahme, um einen Zerknall zu verhindern."
      },
      {
        "label": "c",
        "text": "Nach dem Abkühlen kann sich die Flasche wieder von selbst erwärmen",
        "explanation": "Korrekt. Die Zersetzungsreaktion von Acetylen kann auch nach dem Abkühlen weiterlaufen und zu einer erneuten Erwärmung führen (Polymerisation)."
      },
      {
        "label": "d",
        "text": "Flasche muss mindestens 24 Stunden nach Erreichen der normalen Temperatur an einem sicheren Ort gelagert und kontrolliert, notfalls weiterhin gekühlt werden",
        "explanation": "Korrekt. Wegen der Gefahr der Nachreaktion ist eine lange Beobachtungs- und Kühlphase notwendig."
      },
      {
        "label": "e",
        "text": "Flasche kann nach dem Abkühlen zur weiteren Benutzung verwendet werden",
        "explanation": "Falsch. Eine thermisch belastete Acetylenflasche ist als unsicher zu betrachten und darf nicht ohne Überprüfung durch Fachpersonal weiterverwendet werden."
      },
      {
        "label": "f",
        "text": "Flasche muss von der Feuerwehr gekennzeichnet und zum Füllwerk gebracht werden",
        "explanation": "Falsch. Die Feuerwehr bringt die Flasche nicht selbst zum Füllwerk. Die Übergabe erfolgt an Fachfirmen oder das Füllwerk wird informiert."
      },
      {
        "label": "g",
        "text": "Flasche muss gekennzeichnet, an Füllwerk übergeben und von diesem überprüft werden",
        "explanation": "Korrekt. Die Flasche muss als gefährdet gekennzeichnet und einer fachgerechten Überprüfung und Entsorgung zugeführt werden."
      }
    ],
    "correctAnswers": ["a", "b", "c", "d", "g"]
  },
  {
    "id": 23,
    "questionText": "Bei welcher Art der Wärmeübertragung wird kein Übertragungsmedium benötigt?",
    "options": [
      {
        "label": "a",
        "text": "Wärmeströmung",
        "explanation": "Falsch. Wärmeströmung (Konvektion) benötigt ein bewegtes Medium (Flüssigkeit oder Gas)."
      },
      {
        "label": "b",
        "text": "Wärmestrahlung",
        "explanation": "Korrekt. Wärmestrahlung (Infrarotstrahlung) ist eine elektromagnetische Welle und kann sich auch im Vakuum ausbreiten (z.B. Sonnenwärme)."
      },
      {
        "label": "c",
        "text": "Wärmeleitung",
        "explanation": "Falsch. Wärmeleitung (Konduktion) benötigt ein Medium, in dem die Wärme von Teilchen zu Teilchen weitergegeben wird."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 24,
    "questionText": "Welche Treibmittel werden in Feuerlöschern verwendet und welche Arten von tragbaren Feuerlöschern gibt es?",
    "options": [
      {
        "label": "a",
        "text": "Luft, Helium, Kohlenstoffdioxid",
        "explanation": "Korrekt. Kohlenstoffdioxid (CO2) und Stickstoff (Bestandteil von Luft) sind gängige Treibgase. Helium wird nicht typischerweise verwendet."
      },
      {
        "label": "b",
        "text": "Propan, Butan",
        "explanation": "Falsch. Propan und Butan sind brennbare Gase und als Treibmittel für Feuerlöscher ungeeignet."
      },
      {
        "label": "c",
        "text": "Flüssigkeitsbrandlöscher",
        "explanation": "Falsch. Dies ist eine Kategorisierung nach Löschmittel, nicht nach Löscherart (Bauweise) oder Treibmittel."
      },
      {
        "label": "d",
        "text": "Aufladelöscher",
        "explanation": "Korrekt. Bei Aufladelöschern wird das Treibgas erst bei Inbetriebnahme aus einer separaten Patrone freigesetzt."
      },
      {
        "label": "e",
        "text": "Dauerdrucklöscher",
        "explanation": "Korrekt. Bei Dauerdrucklöschern steht der Löschmittelbehälter ständig unter dem Druck des Treibgases."
      },
      {
        "label": "f",
        "text": "Gaslöscher",
        "explanation": "Korrekt. Gaslöscher (z.B. CO2-Löscher) verwenden das Löschmittel selbst als Treibmittel."
      },
      {
        "label": "g",
        "text": "Giftlöscher",
        "explanation": "Falsch. Diese Bezeichnung ist nicht existent und widerspricht dem Zweck eines Feuerlöschers."
      },
      {
        "label": "h",
        "text": "Schlaglöscher",
        "explanation": "Falsch. 'Schlaglöscher' ist keine gängige Typbezeichnung für moderne Feuerlöscher."
      },
      {
        "label": "i",
        "text": "Pulverlöscher",
        "explanation": "Korrekt. Pulverlöscher sind eine weit verbreitete Art von tragbaren Feuerlöschern (können Auflade- oder Dauerdrucklöscher sein)."
      }
    ],
    "correctAnswers": ["a", "d", "e", "f", "i"]
  },
  {
    "id": 25,
    "questionText": "Welche Löschmittel werden in tragbaren Feuerlöschern eingesetzt?",
    "options": [
      {
        "label": "a",
        "text": "Wasser mit Zusätzen",
        "explanation": "Korrekt. Wasserlöscher, oft mit Zusätzen zur Verbesserung der Löschwirkung (z.B. Netzmittel) oder Frostschutz."
      },
      {
        "label": "b",
        "text": "Graugussspäne",
        "explanation": "Falsch. Graugussspäne sind ein Löschmittel für Metallbrände (Brandklasse D), aber nicht typisch für Standard-Feuerlöscher."
      },
      {
        "label": "c",
        "text": "D-Löschpulver",
        "explanation": "Korrekt. Spezielles Pulver für Metallbrände (Brandklasse D)."
      },
      {
        "label": "d",
        "text": "Schaumlöschmittel",
        "explanation": "Korrekt. Schaumlöscher sind für Brände der Klassen A und B geeignet."
      },
      {
        "label": "e",
        "text": "BC-Löschpulver",
        "explanation": "Korrekt. Pulver für Brände der Klassen B (Flüssigkeiten) und C (Gase)."
      },
      {
        "label": "f",
        "text": "ABC-Löschpulver",
        "explanation": "Korrekt. Universelles Pulver für Brände der Klassen A (Feststoffe), B und C."
      },
      {
        "label": "g",
        "text": "Kohlenstoffdioxid",
        "explanation": "Korrekt. CO2-Löscher sind für Brände der Klasse B und elektrische Anlagen geeignet."
      },
      {
        "label": "h",
        "text": "Feiner Sand",
        "explanation": "Falsch. Sand kann zum Ersticken kleiner Brände verwendet werden, ist aber kein Standard-Löschmittel in tragbaren Feuerlöschern."
      },
      {
        "label": "i",
        "text": "Schweröl",
        "explanation": "Falsch. Schweröl ist ein brennbarer Stoff, kein Löschmittel."
      },
      {
        "label": "j",
        "text": "Wasser",
        "explanation": "Korrekt. Reines Wasser wird in Wasserlöschern eingesetzt (Brandklasse A)."
      }
    ],
    "correctAnswers": ["a", "c", "d", "e", "f", "g", "j"]
  },
  {
    "id": 26,
    "questionText": "Welche Vorteile hat ein Trinkwasserleitungsnetz, das als Ringleitungssystem ausgelegt ist?",
    "options": [
      {
        "label": "a",
        "text": "Es bilden sich in den Rohrleitungen weniger Ablagerungen",
        "explanation": "Korrekt. Durch die ständige Wasserbewegung von mehreren Seiten werden Stagnationszonen vermieden."
      },
      {
        "label": "b",
        "text": "Kurze Abschaltstrecken bei Rohrbruch",
        "explanation": "Korrekt. Bei einem Rohrbruch kann der betroffene Abschnitt isoliert werden, während die Versorgung der anderen Bereiche oft von anderer Seite aufrechterhalten bleibt."
      },
      {
        "label": "c",
        "text": "Geringere Bau- und Unterhaltungskosten als bei einem Verästelungssystem",
        "explanation": "Falsch. Ringsysteme sind in der Regel aufwendiger und teurer im Bau als Verästelungssysteme."
      },
      {
        "label": "d",
        "text": "Hydranten fließen von zwei Seiten Wasser zu",
        "explanation": "Korrekt. Dies erhöht die Versorgungssicherheit und die verfügbare Wassermenge an den Hydranten."
      }
    ],
    "correctAnswers": ["a", "b", "d"]
  },
  {
    "id": 27,
    "questionText": "Nach welcher Faustformel errechnet sich der Abstand (m) von Verstärkerpumpen?",
    "options": [
      {
        "label": "a",
        "text": "Abstand = (Ausgangsdruck/Druckverlust) * 100",
        "explanation": "Falsch. Der Ausgangsdruck allein ist nicht die Basis der Berechnung."
      },
      {
        "label": "b",
        "text": "Abstand = (Gesamtförderdruck / Druckverlust) * 100",
        "explanation": "Falsch. Der Gesamtförderdruck ist nicht der direkt verfügbare Druck für die Strecke."
      },
      {
        "label": "c",
        "text": "Abstand = (verfügbarer Druck / Druckverlust) * 100",
        "explanation": "Korrekt. Der verfügbare Druck (Ausgangsdruck der Pumpe minus Mindesteingangsdruck der nächsten Pumpe) geteilt durch den Druckverlust pro 100m Schlauch ergibt die maximale Länge der Schlauchstrecke in 100m-Einheiten."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 28,
    "questionText": "In welcher maximalen Entfernung von einem Hydranten kann ein Löschfahrzeug aufgestellt werden, ohne dass Gefahr besteht, den notwendigen Pumpeneingangsdruck zu unterschreiten? (Wasserdruck am Standrohr: 5,4 bar, Förderstrom Q = 800 Liter/Minute, Reibungsverlust 1,3 bar / 100 Meter, verfügbare Wassermenge am Standrohr: 1200 Liter / Minute)",
    "options": [
      {
        "label": "a",
        "text": "250 Meter",
        "explanation": "Falsch. Die Berechnung ergibt einen anderen Wert."
      },
      {
        "label": "b",
        "text": "300 Meter",
        "explanation": "Korrekt. Annahme: Mindesteingangsdruck Pumpe ca. 1,5 bar. Verfügbarer Druck: 5,4 bar - 1,5 bar = 3,9 bar. Strecke: 3,9 bar / 1,3 bar/100m = 3 * 100m = 300m. (Die verfügbare Wassermenge ist hier ausreichend und nicht der limitierende Faktor)."
      },
      {
        "label": "c",
        "text": "320 Meter",
        "explanation": "Falsch. Dies würde den verfügbaren Druck überschreiten."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 29,
    "questionText": "Wie viel Wasser (Liter/Minute) liefert ein Unterflurhydrant bei  normalem\" Druckverhältnis im Rohrleitungsnetz?",
    "options": [
      {
        "label": "a",
        "text": "Nennweite (mm) der Anschlussleitung x 7-10",
        "explanation": "Korrekt. Dies ist eine gängige Faustformel zur Abschätzung der Ergiebigkeit eines Hydranten."
      },
      {
        "label": "b",
        "text": "Nennweite (mm) der Anschlussleitung x 12-15",
        "explanation": "Falsch. Dieser Faktor ist zu hoch für eine realistische Abschätzung."
      },
      {
        "label": "c",
        "text": "Nennweite (mm) der Anschlussleitung x 15-17",
        "explanation": "Falsch. Dieser Faktor ist ebenfalls zu hoch."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 30,
    "questionText": "Welche Aufgaben muss der Wachhabende im Feuersicherheitswachdienst vor Beginn einer Veranstaltung wahrnehmen?",
    "options": [
      {
        "label": "a",
        "text": "Kontrolle der Rettungswege",
        "explanation": "Korrekt. Freie und benutzbare Rettungswege sind essenziell."
      },
      {
        "label": "b",
        "text": "Einweisung der Sicherheitsposten",
        "explanation": "Korrekt. Alle eingesetzten Kräfte müssen ihre Aufgaben kennen."
      },
      {
        "label": "c",
        "text": "Durchführung ordnungsdienstlicher Tätigkeiten",
        "explanation": "Falsch. Ordnungsdienstliche Tätigkeiten (z.B. Einlasskontrolle) sind nicht primäre Aufgabe der Feuersicherheitswache, sondern des Veranstalters oder Sicherheitsdienstes."
      },
      {
        "label": "d",
        "text": "Überprüfung der Alarmierungsmöglichkeiten",
        "explanation": "Korrekt. Es muss sichergestellt sein, dass im Notfall schnell Hilfe alarmiert werden kann."
      }
    ],
    "correctAnswers": ["a", "b", "d"]
  },
  {
    "id": 31,
    "questionText": "Welcher Baustoffklasse und welcher bauaufsichtlichen Benennung (nach DIN 4102) müssen Dekorationsmaterialien in Versammlungsräumen mindestens entsprechen?",
    "options": [
      {
        "label": "a",
        "text": "B1",
        "explanation": "Korrekt. B1 nach DIN 4102 ist die Baustoffklasse für 'schwer entflammbare' Baustoffe."
      },
      {
        "label": "b",
        "text": "Normal entflammbar",
        "explanation": "Falsch. Normal entflammbar (B2) ist in Versammlungsräumen für Dekorationen oft nicht ausreichend."
      },
      {
        "label": "c",
        "text": "Schwer entflammbar",
        "explanation": "Korrekt. Dies ist die bauaufsichtliche Benennung, die der Klasse B1 entspricht."
      },
      {
        "label": "d",
        "text": "F 30",
        "explanation": "Falsch. F 30 bezeichnet die Feuerwiderstandsklasse von Bauteilen (z.B. Wände), nicht die Entflammbarkeit von Materialien."
      }
    ],
    "correctAnswers": ["a", "c"]
  },
  {
    "id": 32,
    "questionText": "Welche der nachfolgenden Bedingungen muss erfüllt sein, damit die Standsicherheit eines Gebäudes gewährleistet ist?",
    "options": [
      {
        "label": "a",
        "text": "Brandverhütungsschau muss durchgeführt sein",
        "explanation": "Falsch. Eine Brandverhütungsschau dient der Prävention, ist aber keine direkte Bedingung für die aktuelle Standsicherheit."
      },
      {
        "label": "b",
        "text": "Brandausbreitung in baulichen Anlagen richtig abschätzen",
        "explanation": "Falsch. Das Abschätzen der Brandausbreitung ist eine taktische Überlegung im Einsatz, aber keine Bedingung für die grundsätzliche Standsicherheit."
      },
      {
        "label": "c",
        "text": "Am Gebäude wirkende Kräfte müssen im Gleichgewicht sein",
        "explanation": "Korrekt. Die Summe aller einwirkenden Kräfte (Lasten) und der widerstehenden Kräfte (Tragfähigkeit der Bauteile) muss Null ergeben, damit das Gebäude stabil ist."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 33,
    "questionText": "Welche baulichen Einrichtungen und Geräte können bei Gebäuden als Rettungsweg (Erster und zweiter Rettungsweg) angesehen werden?",
    "options": [
      {
        "label": "a",
        "text": "Notwendige Treppen",
        "explanation": "Korrekt. Notwendige Treppen sind der klassische erste Rettungsweg."
      },
      {
        "label": "b",
        "text": "Tragbare Leitern",
        "explanation": "Korrekt. Tragbare Leitern der Feuerwehr können als zweiter Rettungsweg dienen, wenn bauliche nicht vorhanden oder nutzbar sind."
      },
      {
        "label": "c",
        "text": "Fluchthauben",
        "explanation": "Falsch. Fluchthauben sind Hilfsmittel zur Selbstrettung, aber kein baulicher Rettungsweg."
      },
      {
        "label": "d",
        "text": "Aufzüge",
        "explanation": "Falsch. Aufzüge sind im Brandfall in der Regel nicht als Rettungsweg zugelassen (Ausnahme: spezielle Feuerwehraufzüge)."
      },
      {
        "label": "e",
        "text": "Drehleitern",
        "explanation": "Korrekt. Drehleitern der Feuerwehr können als zweiter Rettungsweg dienen."
      }
    ],
    "correctAnswers": ["a", "b", "e"]
  },
  {
    "id": 34,
    "questionText": "Welche bauaufsichtliche Benennung steht für die Feuerwiderstandsklasse F 30-B (nach DIN 4102) eines Bauteils?",
    "options": [
      {
        "label": "a",
        "text": "Feuerbeständig",
        "explanation": "Falsch. Feuerbeständig entspricht F 90 oder höher."
      },
      {
        "label": "b",
        "text": "Feuerhemmend",
        "explanation": "Korrekt. F 30 bedeutet, dass das Bauteil im Brandfall für mindestens 30 Minuten seine Funktion (z.B. Tragfähigkeit, Raumabschluss) behält. Das 'B' bedeutet, dass es aus brennbaren Baustoffen besteht."
      },
      {
        "label": "c",
        "text": "Nicht brennbar",
        "explanation": "Falsch. Nicht brennbar ist eine Baustoffklasse (A), keine Feuerwiderstandsklasse. Das '-B' in F30-B weist auf brennbare Baustoffe hin."
      },
      {
        "label": "d",
        "text": "Schwer entflammbar",
        "explanation": "Falsch. Schwer entflammbar ist eine Baustoffklasse (B1), keine Feuerwiderstandsklasse."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 35,
    "questionText": "Welche der aufgeführten Tätigkeiten gehören zu den lebensrettenden Sofortmaßnahmen?",
    "options": [
      {
        "label": "a",
        "text": "Verkehrssicherung, Verkehrsregelung",
        "explanation": "Falsch. Dies sind Sicherungsmaßnahmen an der Einsatzstelle, aber keine direkten lebensrettenden Maßnahmen am Patienten."
      },
      {
        "label": "b",
        "text": "Knochenbrüche schienen",
        "explanation": "Falsch. Das Schienen von Brüchen ist eine erweiterte Erste-Hilfe-Maßnahme, aber nicht unbedingt eine *sofort* lebensrettende Maßnahme im engeren Sinne (wie Atemspende)."
      },
      {
        "label": "c",
        "text": "Wiederbelebung, Atemspende",
        "explanation": "Korrekt. Dies sind Maßnahmen bei Atem- und Kreislaufstillstand und somit unmittelbar lebensrettend."
      },
      {
        "label": "d",
        "text": "Lagerung und Schockbekämpfung",
        "explanation": "Korrekt. Die richtige Lagerung (z.B. stabile Seitenlage, Schocklage) und Maßnahmen gegen einen Schock können lebensrettend sein."
      },
      {
        "label": "e",
        "text": "Anschrift und Name des Verletzten notieren",
        "explanation": "Falsch. Die Aufnahme von Personalien ist wichtig für die spätere Versorgung, aber keine Sofortmaßnahme zur Lebensrettung."
      }
    ],
    "correctAnswers": ["c", "d"]
  },
  {
    "id": 36,
    "questionText": "Welche Maßnahmen müssen eventuell durchgeführt werden, um die Vitalfunktionen einer verletzten Person aufrechtzuerhalten und/oder wieder herzustellen?",
    "options": [
      {
        "label": "a",
        "text": "Blutstillung",
        "explanation": "Korrekt. Starke Blutungen können schnell lebensbedrohlich werden und müssen gestillt werden."
      },
      {
        "label": "b",
        "text": "Warmes Getränk verabreichen",
        "explanation": "Falsch. Bewusstlosen oder schwer verletzten Personen dürfen keine Getränke verabreicht werden (Aspirationsgefahr, Verschlechterung bei inneren Verletzungen)."
      },
      {
        "label": "c",
        "text": "Injektion vorbereiten",
        "explanation": "Falsch. Injektionen sind ärztliche Maßnahmen."
      },
      {
        "label": "d",
        "text": "Lagerung",
        "explanation": "Korrekt. Die richtige Lagerung (z.B. stabile Seitenlage, Schocklage) ist wichtig."
      },
      {
        "label": "e",
        "text": "Wärmeerhaltung",
        "explanation": "Korrekt. Verletzte kühlen schnell aus, Wärmeerhalt ist wichtig zur Schockprophylaxe."
      },
      {
        "label": "f",
        "text": "Überwachung von Puls und Blutdruck",
        "explanation": "Korrekt. Die kontinuierliche Überwachung der Vitalfunktionen ist entscheidend. (Blutdruckmessung durch Feuerwehr eher selten, Puls aber schon)."
      },
      {
        "label": "g",
        "text": "Überwachung von Atmung und Bewusstseinslage",
        "explanation": "Korrekt. Dies sind grundlegende Vitalparameter, die ständig kontrolliert werden müssen."
      },
      {
        "label": "h",
        "text": "Notruf veranlassen",
        "explanation": "Falsch. Der Notruf sollte bereits erfolgt sein oder parallel erfolgen, ist aber keine direkte Maßnahme *am Patienten* zur Aufrechterhaltung der Vitalfunktionen."
      },
      {
        "label": "i",
        "text": "Verletzten über Unfallhergang befragen",
        "explanation": "Falsch. Die Befragung ist sekundär, primär geht es um die medizinische Versorgung."
      }
    ],
    "correctAnswers": ["a", "d", "e", "f", "g"]
  },
  {
    "id": 37,
    "questionText": "Welche Anzeigen deuten auf einen Schock hin?",
    "options": [
      {
        "label": "a",
        "text": "Durstgefühl",
        "explanation": "Falsch. Durstgefühl kann ein Symptom sein, ist aber nicht so eindeutig und typisch wie andere Anzeichen."
      },
      {
        "label": "b",
        "text": "Starke Kopfschmerzen",
        "explanation": "Falsch. Kopfschmerzen sind kein typisches primäres Anzeichen eines Schocks."
      },
      {
        "label": "c",
        "text": "Frieren, Zittern",
        "explanation": "Korrekt. Der Körper versucht, die Temperatur zu halten, die Durchblutung ist gestört."
      },
      {
        "label": "d",
        "text": "Blasse, kalte und feuchte Haut",
        "explanation": "Korrekt. Durch die Zentralisierung des Kreislaufs wird die Haut minderdurchblutet und Schweißbildung kann einsetzen."
      },
      {
        "label": "e",
        "text": "Starke Blutungen",
        "explanation": "Korrekt. Starke Blutungen sind eine häufige Ursache für einen Volumenmangelschock und somit ein indirektes Anzeichen."
      },
      {
        "label": "f",
        "text": "Auffallende Unruhe",
        "explanation": "Korrekt. Angst und Sauerstoffmangel im Gehirn können zu Unruhe führen."
      },
      {
        "label": "g",
        "text": "Schneller und schwächer werdender Puls",
        "explanation": "Korrekt. Das Herz versucht, den Blutdruckverlust durch schnellere Frequenz auszugleichen, der Puls wird aber fadenförmig."
      },
      {
        "label": "h",
        "text": "Tiefer Schlaf",
        "explanation": "Falsch. Eher Bewusstseinsstörungen bis hin zur Bewusstlosigkeit, aber nicht typischerweise tiefer Schlaf."
      },
      {
        "label": "i",
        "text": "Auffallende Heiterkeit",
        "explanation": "Falsch. Das Gegenteil ist meist der Fall."
      },
      {
        "label": "j",
        "text": "Großes Mitteilungsbedürfnis",
        "explanation": "Falsch. Eher Apathie oder Verwirrtheit."
      }
    ],
    "correctAnswers": ["c", "d", "e", "f", "g"]
  },
  {
    "id": 38,
    "questionText": "Welche Stelle auf der UTM-Karte wird durch die Koordinate 372378 bestimmt? (Bild mit UTM-Gitter und Punkten A und B)",
    "options": [
      {
        "label": "a",
        "text": "Stelle A",
        "explanation": "Korrekt. Die Koordinate wird interpretiert als Rechtswert 372 (zwischen den Linien 37 und 38, näher an 37, also 37 und dann 2/10) und Hochwert 378 (zwischen den Linien 37 und 38, näher an 38, also 37 und dann 8/10). Dies entspricht der Position von Punkt A im Beispieldiagramm."
      },
      {
        "label": "b",
        "text": "Stelle B",
        "explanation": "Falsch. Punkt B hätte andere Koordinaten."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 39,
    "questionText": "Was ist beim Retten von hilflosen Personen aus Schächten zu beachten?",
    "options": [
      {
        "label": "a",
        "text": "Schacht mit Sauerstoff anreichern",
        "explanation": "Falsch. Das Anreichern mit reinem Sauerstoff kann Brandgefahren erhöhen und ist keine Standardmaßnahme. Wichtiger ist das Messen der Atmosphäre und ggf. Belüften."
      },
      {
        "label": "b",
        "text": "Retter mit Atemschutzgerät und Feuerwehrleine ausrüsten",
        "explanation": "Korrekt. In Schächten können gefährliche Gase oder Sauerstoffmangel herrschen, daher ist Atemschutz unerlässlich. Die Leine dient der Sicherung des Retters."
      },
      {
        "label": "c",
        "text": "Person mit Feuerwehrleine oder Rettungsgurt sichern",
        "explanation": "Korrekt. Die zu rettende Person muss vor dem Hochziehen gesichert werden."
      }
    ],
    "correctAnswers": ["b", "c"]
  },
  {
    "id": 40,
    "questionText": "Warum gibt es Feuerwehr-Einsatzpläne?",
    "options": [
      {
        "label": "a",
        "text": "Damit sich der Bürgermeister über die Einsatzfähigkeit seiner Feuerwehr informieren kann",
        "explanation": "Falsch. Einsatzpläne sind für den operativen Einsatz gedacht, nicht primär zur Information des Bürgermeisters über die allgemeine Einsatzfähigkeit."
      },
      {
        "label": "b",
        "text": "Damit sich der Einsatzleiter bei der Anfahrt über eventuelle Gefahren und das mögliche Vorgehen informieren kann",
        "explanation": "Korrekt. Einsatzpläne enthalten wichtige Informationen zu Objekten, Gefahren und möglichen Taktiken, die dem Einsatzleiter eine schnelle Orientierung ermöglichen."
      },
      {
        "label": "c",
        "text": "Damit der Kreisbrandmeister die Einsatzleitung übernehmen kann",
        "explanation": "Falsch. Einsatzpläne dienen jedem Einsatzleiter, nicht nur dem Kreisbrandmeister."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 41,
    "questionText": "Kreuzen Sie die drei Tätigkeiten an, die der nach einem Alarm zuerst am Feuerwehrhaus eintreffende Feuerwehrangehörige vorrangig zu erledigen hat!",
    "options": [
      {
        "label": "a",
        "text": "Fahrzeugmotor warm laufen lassen",
        "explanation": "Falsch. Moderne Fahrzeuge benötigen kein langes Warmlaufen. Wichtiger sind andere vorbereitende Maßnahmen."
      },
      {
        "label": "b",
        "text": "Seine Ausrüstung holen und überprüfen",
        "explanation": "Falsch. Dies ist wichtig, aber die Informationsbeschaffung hat Vorrang."
      },
      {
        "label": "c",
        "text": "Mit der Leitstelle Verbindung aufnehmen",
        "explanation": "Korrekt. Um den genauen Einsatzort und die Art des Einsatzes zu erfahren."
      },
      {
        "label": "d",
        "text": "Kreisbrandmeister verständigen",
        "explanation": "Falsch. Die Alarmierung weiterer Führungskräfte erfolgt lageabhängig und nicht als erste Maßnahme."
      },
      {
        "label": "e",
        "text": "Einsatzauftrag von der Leitstelle erfragen",
        "explanation": "Korrekt. Die genauen Informationen zum Einsatz sind entscheidend."
      },
      {
        "label": "f",
        "text": "Einsatzauftrag der Leitstelle wiederholen und eventuell aufschreiben",
        "explanation": "Korrekt. Zur Vermeidung von Missverständnissen und zur Dokumentation."
      }
    ],
    "correctAnswers": ["c", "e", "f"]
  },
  {
    "id": 42,
    "questionText": "Wie fordern Sie als Gruppenführer in der Regel die Unterstützung anderer Feuerwehren oder Dienststellen bei einem Einsatz an?",
    "options": [
      {
        "label": "a",
        "text": "Direkt über Telefon",
        "explanation": "Falsch. Die Anforderung erfolgt koordiniert über die Leitstelle."
      },
      {
        "label": "b",
        "text": "Nur über die Leistelle",
        "explanation": "Korrekt. Die Integrierte Leitstelle koordiniert die Alarmierung weiterer Kräfte und Mittel, um Doppelalarmierungen oder Fehlkoordinationen zu vermeiden."
      },
      {
        "label": "c",
        "text": "Direkt über Funk",
        "explanation": "Falsch. Auch wenn per Funk kommuniziert wird, läuft die Nachforderung von Kräften anderer Organisationen in der Regel über die Leitstelle."
      }
    ],
    "correctAnswers": ["b"]
  },
  {
    "id": 43,
    "questionText": "Welche Begriffe muss ein Befehl enthalten?",
    "options": [
      {
        "label": "a",
        "text": "Einheit",
        "explanation": "Korrekt. Wer soll den Befehl ausführen (z.B. Angriffstrupp)?"
      },
      {
        "label": "b",
        "text": "Lage",
        "explanation": "Falsch. Die Lage ist die Grundlage für den Entschluss und den Befehl, aber nicht zwingend Teil jedes einzelnen Befehlswortlauts."
      },
      {
        "label": "c",
        "text": "Hydranten",
        "explanation": "Falsch. Die Wasserentnahmestelle ist Teil des Befehls, aber der Begriff 'Hydranten' ist zu spezifisch und nicht immer zutreffend."
      },
      {
        "label": "d",
        "text": "Auftrag",
        "explanation": "Korrekt. Was soll getan werden (z.B. Brandbekämpfung)?"
      },
      {
        "label": "e",
        "text": "Ort, Zeit, Wetter",
        "explanation": "Falsch. Diese sind Rahmenbedingungen, aber nicht zwingend Teil jedes Befehls."
      },
      {
        "label": "f",
        "text": "Mittel",
        "explanation": "Korrekt. Womit soll der Auftrag ausgeführt werden (z.B. mit C-Rohr)?"
      },
      {
        "label": "g",
        "text": "Ziel",
        "explanation": "Korrekt. Wo soll der Auftrag ausgeführt werden (z.B. im Erdgeschoss)?"
      },
      {
        "label": "h",
        "text": "Weg",
        "explanation": "Korrekt. Wie ist das Ziel zu erreichen (z.B. durch die Vordertür)?"
      },
      {
        "label": "i",
        "text": "Schadenstelle",
        "explanation": "Falsch. Die Schadenstelle ist der Ort des Geschehens, aber 'Ziel' ist der präzisere Begriff im Befehlsschema."
      }
    ],
    "correctAnswers": ["a", "d", "f", "g", "h"]
  },
  {
    "id": 44,
    "questionText": "Wer entscheidet an der Einsatzstelle vorrangig über medizinische Maßnahmen am Verletzten?",
    "options": [
      {
        "label": "a",
        "text": "Technischer Einsatzleiter",
        "explanation": "Falsch. Der technische Einsatzleiter (Feuerwehr) ist für die technischen und taktischen Maßnahmen zuständig."
      },
      {
        "label": "b",
        "text": "Bürgermeister",
        "explanation": "Falsch. Der Bürgermeister hat die Gesamtverantwortung, aber nicht die medizinische Entscheidungskompetenz."
      },
      {
        "label": "c",
        "text": "Betriebsleiter beziehungsweise Werksdirektor",
        "explanation": "Falsch. Diese Personen sind für den Betrieb zuständig, nicht für medizinische Entscheidungen im Notfall."
      },
      {
        "label": "d",
        "text": "Notarzt",
        "explanation": "Korrekt. Der Notarzt hat die höchste medizinische Kompetenz an der Einsatzstelle und trifft die Entscheidungen über medizinische Maßnahmen."
      },
      {
        "label": "e",
        "text": "Kommandant",
        "explanation": "Falsch. Der Kommandant leitet die Feuerwehr, nicht die medizinische Versorgung."
      },
      {
        "label": "f",
        "text": "Sicherheitsbeauftragte",
        "explanation": "Falsch. Sicherheitsbeauftragte sind für Arbeitssicherheit zuständig."
      }
    ],
    "correctAnswers": ["d"]
  },
  {
    "id": 45,
    "questionText": "Welche nachfolgenden Grundsätze sind im Sprechfunkverkehr zu beachten?",
    "options": [
      {
        "label": "a",
        "text": "Höflichkeitsformeln unterlassen",
        "explanation": "Korrekt. Im Einsatzfunkverkehr geht es um knappe, präzise Informationen. Auf 'Bitte' und 'Danke' wird meist verzichtet."
      },
      {
        "label": "b",
        "text": "Personennamen und Amtsbezeichnungen dürfen nicht genannt werden",
        "explanation": "Falsch. Funktionsbezeichnungen (z.B. 'Angriffstruppführer') werden verwendet. Personennamen sollten aus Datenschutzgründen vermieden werden, sind aber nicht generell verboten, wenn es zur eindeutigen Kommunikation notwendig ist."
      },
      {
        "label": "c",
        "text": "Teilnehmer mit „Sie“ anreden",
        "explanation": "Korrekt. Eine formelle Anrede ist üblich, auch wenn man sich duzt."
      },
      {
        "label": "d",
        "text": "Strenge Funkdisziplin einhalten",
        "explanation": "Korrekt. Nur notwendige Meldungen, keine Privatgespräche, Kanal freihalten."
      },
      {
        "label": "e",
        "text": "Abkürzungen benutzen, damit Funkzeit kurz ist",
        "explanation": "Falsch. Nur genormte und allgemein verständliche Abkürzungen verwenden, um Missverständnisse zu vermeiden."
      },
      {
        "label": "f",
        "text": "Eigennamen und schwer verständliche Worte buchstabieren",
        "explanation": "Korrekt. Das Buchstabieralphabet hilft bei der Übermittlung schwieriger Begriffe."
      },
      {
        "label": "g",
        "text": "Zahlen unverwechselbar aussprechen",
        "explanation": "Korrekt. Z.B. 'zwo' statt 'zwei', 'fünnef' statt 'fünf', um Verwechslungen zu vermeiden."
      },
      {
        "label": "h",
        "text": "Deutlich und laut sprechen ohne Pausen",
        "explanation": "Falsch. Deutlich und in normaler Lautstärke sprechen, mit kurzen Pausen zwischen den Wortgruppen, um die Verständlichkeit zu erhöhen."
      }
    ],
    "correctAnswers": ["a", "c", "d", "f", "g"]
  },
  {
    "id": 46,
    "questionText": "Verkehrsarten sind von den technischen Möglichkeiten der Funkgeräte abhängige Verfahren des Nachrichtenaustausches im Sprechfunkverkehr. Wie werden sie unterschieden?",
    "options": [
      {
        "label": "a",
        "text": "Wechselverkehr",
        "explanation": "Korrekt. Senden und Empfangen erfolgen abwechselnd auf derselben Frequenz (z.B. Handfunkgeräte)."
      },
      {
        "label": "b",
        "text": "Richtungsverkehr",
        "explanation": "Korrekt. Kommunikation in nur eine Richtung (z.B. Durchsagen über Lautsprecher)."
      },
      {
        "label": "c",
        "text": "Kreisverkehr",
        "explanation": "Falsch. 'Kreisverkehr' ist keine offizielle Verkehrsart im Sprechfunk."
      },
      {
        "label": "d",
        "text": "Sternverkehr",
        "explanation": "Falsch. 'Sternverkehr' beschreibt eine Netzstruktur, keine Verkehrsart der Funkgeräte."
      },
      {
        "label": "e",
        "text": "Gegenverkehr",
        "explanation": "Korrekt. Gleichzeitiges Senden und Empfangen auf unterschiedlichen Frequenzen (z.B. Relaisstellenbetrieb, Telefonie)."
      },
      {
        "label": "f",
        "text": "Bedingter Gegenverkehr",
        "explanation": "Korrekt. Eine Mischform, bei der auf einer Frequenz gesendet und auf einer anderen empfangen wird, aber nicht immer gleichzeitig gesprochen werden kann."
      },
      {
        "label": "g",
        "text": "Linienverkehr",
        "explanation": "Falsch. 'Linienverkehr' ist keine offizielle Verkehrsart im Sprechfunk."
      }
    ],
    "correctAnswers": ["a", "b", "e", "f"]
  },
  {
    "id": 47,
    "questionText": "Welche Aussage ist richtig?",
    "options": [
      {
        "label": "a",
        "text": "Einfach-Nachrichten\" werden in der Reihenfolge ihres Eingangs abgefertigt",
        "explanation": "Korrekt. Nachrichten ohne besondere Dringlichkeit werden nacheinander bearbeitet."
      },
      {
        "label": "b",
        "text": "Sofort-Nachrichten\" müssen in der Reihenfolge ihres Eingangs jedoch vor Einfach-Nachrichten\" abgefertigt werden",
        "explanation": "Korrekt. Sofort-Nachrichten haben eine höhere Priorität."
      },
      {
        "label": "c",
        "text": "Gespräche sollen stichwortartig vorgefertigt sein und von der Gegenstelle niedergeschrieben beziehungsweise aufgezeichnet werden",
        "explanation": "Falsch. Dies beschreibt eher einen 'Spruch'. Ein 'Gespräch' ist formloser."
      },
      {
        "label": "d",
        "text": "Das Gespräch\" ist ein formloser, unmittelbarer Informationsaustausch",
        "explanation": "Korrekt. Ein Gespräch dient dem schnellen, direkten Austausch von Informationen."
      },
      {
        "label": "e",
        "text": "Der Spruch\" ist eine formgebundene, schriftlich festgelegte Nachricht",
        "explanation": "Korrekt. Ein Spruch hat eine feste Form und wird oft zur Dokumentation schriftlich festgehalten."
      }
    ],
    "correctAnswers": ["a", "b", "d", "e"]
  },
  {
    "id": 48,
    "questionText": "Eine orangenfarbige Warntafel zeigt die Gefahrnummer 856. Was liegt vor?",
    "options": [
      {
        "label": "a",
        "text": "Ätzender Stoff, brandfördernd und giftig",
        "explanation": "Korrekt. 8 = Ätzender Stoff; 5 = Brandfördernd (oxidierend); 6 = Giftiger Stoff."
      },
      {
        "label": "b",
        "text": "Giftiger Stoff, brandfördernd und ätzend",
        "explanation": "Falsch. Die Reihenfolge der Ziffern hat eine Bedeutung."
      },
      {
        "label": "c",
        "text": "Oxidierend wirkender Stoff, giftig und ätzend",
        "explanation": "Falsch. Die erste Ziffer (Hauptgefahr) ist 8 (ätzend), nicht 5 (oxidierend)."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 49,
    "questionText": "Eine orangenfarbige Warntafel zeigt die Gefahrnummer X 423. Was liegt vor?",
    "options": [
      {
        "label": "a",
        "text": "Entzündbarer fester Stoff, der mit Wasser gefährlich reagiert, wobei brennbare Gase entweichen",
        "explanation": "Korrekt. X = Reaktion mit Wasser gefährlich; 4 = Entzündbarer fester Stoff; 2 = Entweichen von Gas durch Druck oder chemische Reaktion; 3 = Entzündbarkeit von Flüssigkeiten (Dämpfe) und Gasen oder selbsterhitzungsfähiger flüssiger Stoff."
      },
      {
        "label": "b",
        "text": "Leicht entzündbare Flüssigkeit, mit Wasser gefährlich reagierend, dabei entweicht Gas",
        "explanation": "Falsch. Die '4' an erster Stelle nach dem X steht für einen festen Stoff."
      },
      {
        "label": "c",
        "text": "Fester Stoff, leicht entzündbar, bei Berührung mit Wasser entweicht Gas",
        "explanation": "Falsch. Die Ziffernkombination '23' hat eine spezifischere Bedeutung als nur 'entweicht Gas'."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 50,
    "questionText": "Im Hommel\" sehen Sie für einen Stoff im Gefahrendiamant im blauen Feld eine „3“. Was bedeutet dies?",
    "options": [
      {
        "label": "a",
        "text": "Starke Reaktionsgefahr",
        "explanation": "Falsch. Reaktionsgefahr wird im gelben Feld des NFPA-Diamanten dargestellt."
      },
      {
        "label": "b",
        "text": "Vollschutzanzug erforderlich",
        "explanation": "Korrekt. Eine '3' im blauen Feld (Gesundheitsgefahr) des NFPA 704 Diamanten bedeutet eine hohe Gesundheitsgefahr, die oft spezielle Schutzausrüstung wie einen Chemikalienschutzanzug (CSA) erfordert."
      },
      {
        "label": "c",
        "text": "Sicherheitszone von mindestens 30 Meter bilden",
        "explanation": "Falsch. Die Größe der Sicherheitszone hängt von vielen Faktoren ab und wird nicht direkt durch diese Ziffer bestimmt."
      },
      {
        "label": "d",
        "text": "Stoff ist schwer entflammbar\"",
        "explanation": "Falsch. Entflammbarkeit wird im roten Feld dargestellt."
      },
      {
        "label": "e",
        "text": "Gesundheitsgefahr",
        "explanation": "Korrekt. Das blaue Feld steht für Gesundheitsgefahren, die Ziffer '3' für eine hohe Gefahr."
      }
    ],
    "correctAnswers": ["b", "e"]
  },
  {
    "id": 51,
    "questionText": "Eine Gaswolke (ätzende Gase) bildet sich im Freien aufgrund eines Lecks. Was tun Sie zuerst um die Bevölkerung zu schützen?",
    "options": [
      {
        "label": "a",
        "text": "Räumung der unmittelbar beaufschlagten Gebäude",
        "explanation": "Falsch. Dies kann eine spätere Maßnahme sein, aber das Niederschlagen der Wolke hat oft Vorrang, um die Ausbreitung zu stoppen."
      },
      {
        "label": "b",
        "text": "Leck abdichten, damit nichts mehr austritt",
        "explanation": "Falsch. Das Abdichten des Lecks ist wichtig, aber der Schutz der Bevölkerung vor der bereits ausgetretenen Wolke hat Priorität."
      },
      {
        "label": "c",
        "text": "Gaswolke mit Wasser eingrenzen beziehungsweise niederschlagen",
        "explanation": "Korrekt. Das Niederschlagen der Gaswolke mit Sprühstrahl (wenn die Gase wasserlöslich sind) ist oft die erste Maßnahme, um die unmittelbare Gefahr für die Bevölkerung zu reduzieren und die Ausbreitung zu verhindern."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 52,
    "questionText": "Meldung Verkehrsunfall! Sie kommen mit einem Löschgruppenfahrzeug LF 10 und Ihrer Löschgruppe an die Einsatzstelle. Ihre Erkundung hat ergeben, dass keine Person im unmittelbaren Bereich gefährdet ist. Auf einem kleinen Lastkraftwagen (drei Tonnen) liegen zerstörte Behälter (60 Liter). Die Kennzeichnung der Behälter nach Gefahrstoff-Verordnung (GefStoffV) ist ätzend. Welche Maßnahmen veranlassen Sie?",
    "options": [
      {
        "label": "a",
        "text": "Einsatzstelle großräumig (50 Meter) absichern",
        "explanation": "Korrekt. Bei Gefahrstoffen ist eine großräumige Absperrung (GAMS-Regel: Gefahr erkennen, Absperren...) eine der ersten Maßnahmen."
      },
      {
        "label": "b",
        "text": "Gase mit Sprühstrahl unter Atemschutz niederschlagen",
        "explanation": "Korrekt. Wenn ätzende Dämpfe/Gase austreten, ist deren Niederschlagung unter Atemschutz eine wichtige Maßnahme zum Schutz von Einsatzkräften und Umwelt."
      },
      {
        "label": "c",
        "text": "Lagemeldung abgeben und Gerätewagen Gefahrgut anfordern, Kreisbrandmeister verständigen",
        "explanation": "Korrekt. Bei einem Gefahrstoffaustritt, der die eigenen Mittel übersteigt, müssen Spezialkräfte (GW-G) und die Führungsebene informiert werden."
      },
      {
        "label": "d",
        "text": "Lagemeldung abgeben und Rüstwagen anfordern, Transportfirma verständigen und Ersatzfahrzeug anfordern",
        "explanation": "Falsch. Ein Rüstwagen ist nicht primär für Gefahrstoffeinsätze. Die Verständigung der Transportfirma oder Anforderung eines Ersatzfahrzeugs ist nicht die erste Aufgabe der Feuerwehr."
      },
      {
        "label": "e",
        "text": "Ausgelaufene Flüssigkeit mit viel Wasser (Verdünnungseffekt) ins Kanalrohr spülen",
        "explanation": "Falsch. Ätzende Stoffe dürfen nicht unkontrolliert in die Kanalisation gespült werden, da dies zu Umweltschäden und Gefahren in der Kanalisation führen kann."
      }
    ],
    "correctAnswers": ["a", "b", "c"]
  },
  {
    "id": 53,
    "questionText": "Welches Gefährlichkeitsmerkmal kann einem Stoff zugeordnet werden?",
    "options": [
      {
        "label": "a",
        "text": "Sehr giftig",
        "explanation": "Korrekt. 'Sehr giftig' (T+) ist ein genormtes Gefährlichkeitsmerkmal."
      },
      {
        "label": "b",
        "text": "Ekelhaft riechend / spontan reagierend",
        "explanation": "Falsch. 'Ekelhaft riechend' ist subjektiv. 'Spontan reagierend' ist eine Eigenschaft, aber kein genormtes Gefährlichkeitsmerkmal wie die anderen."
      },
      {
        "label": "c",
        "text": "Brandfördernd",
        "explanation": "Korrekt. 'Brandfördernd' (O) ist ein genormtes Gefährlichkeitsmerkmal."
      },
      {
        "label": "d",
        "text": "Krebserzeugend",
        "explanation": "Korrekt. 'Krebserzeugend' (karzinogen) ist ein wichtiges Gefährlichkeitsmerkmal (oft mit 'giftig' oder 'gesundheitsschädlich' kombiniert)."
      },
      {
        "label": "e",
        "text": "Explosionsgefährlich",
        "explanation": "Korrekt. 'Explosionsgefährlich' (E) ist ein genormtes Gefährlichkeitsmerkmal."
      }
    ],
    "correctAnswers": ["a", "c", "d", "e"]
  },
  {
    "id": 54,
    "questionText": "Woran erkennt man, ob ein unbekannter Stoff giftig ist?",
    "options": [
      {
        "label": "a",
        "text": "Die Giftigkeit ist nicht ohne weiteres erkennbar",
        "explanation": "Korrekt. Viele giftige Stoffe sind geruchlos, farblos und geschmacklos. Eine eindeutige Identifizierung ohne Hilfsmittel ist oft nicht möglich."
      },
      {
        "label": "b",
        "text": "Durch den Einsatz von Prüfröhrchen",
        "explanation": "Falsch. Prüfröhrchen können bestimmte Gase nachweisen, aber nicht pauschal die Giftigkeit eines unbekannten Stoffes feststellen."
      },
      {
        "label": "c",
        "text": "Mit Indikator-Papier (pH-Papier)",
        "explanation": "Falsch. pH-Papier zeigt an, ob ein Stoff sauer oder basisch ist (ätzend), aber nicht, ob er giftig ist."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 55,
    "questionText": "Die Dekontamination durch die Feuerwehr (Dekon) ist die Grobreinigung von Einsatzkräften einschließlich ihrer Schutzkleidung, von anderen Personen sowie von Geräten. Welche Aussage ist richtig?",
    "options": [
      {
        "label": "a",
        "text": "Der Dekon-Platz muss in spätestens 15 Minuten betriebsbereit sein",
        "explanation": "Korrekt. Dies ist eine übliche Zeitvorgabe für den Aufbau eines Not-Dekon-Platzes."
      },
      {
        "label": "b",
        "text": "Dekon-Stufe I = Notdekontamination von Personen",
        "explanation": "Korrekt. Stufe I ist die schnelle Erstdekontamination zur Abwehr akuter Gefahren."
      },
      {
        "label": "c",
        "text": "Dekon-Stufe II = Standard-Dekontamination",
        "explanation": "Korrekt. Stufe II ist eine gründlichere Dekontamination von Personen und Geräten."
      },
      {
        "label": "d",
        "text": "Dekon-Stufe III = Erweiterte Dekontamination im ABC-Einsatz",
        "explanation": "Korrekt. Stufe III ist die aufwendigste Form der Dekontamination bei komplexen ABC-Lagen."
      },
      {
        "label": "e",
        "text": "Ein Dekon-Platz ist bei jedem ABC-Einsatz der Gefahrengruppe II und III einzurichten und abzugrenzen",
        "explanation": "Korrekt. Bei Einsätzen mit mittlerer und hoher Gefährdung durch ABC-Stoffe ist ein Dekon-Platz zwingend erforderlich."
      }
    ],
    "correctAnswers": ["a", "b", "c", "d", "e"]
  },
  {
    "id": 56,
    "questionText": "Was bedeutet die Abkürzung  TRGS\"?",
    "options": [
      {
        "label": "a",
        "text": "Technische Regeln für Gefahrstoffe",
        "explanation": "Korrekt. Die TRGS konkretisieren die Anforderungen der Gefahrstoffverordnung."
      },
      {
        "label": "b",
        "text": "Transport-Richtlinie für Gerätewagen-Säure",
        "explanation": "Falsch. Diese Abkürzung ist nicht korrekt."
      },
      {
        "label": "c",
        "text": "Technisches Regelwerk für Gase und Säuren",
        "explanation": "Falsch. Die Bedeutung ist spezifischer auf Gefahrstoffe allgemein bezogen."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 57,
    "questionText": "Welche Aussage für Erdgas ist richtig?",
    "options": [
      {
        "label": "a",
        "text": "Erdgas ist leichter als Luft",
        "explanation": "Korrekt. Erdgas (Hauptbestandteil Methan) hat eine geringere Dichte als Luft und steigt daher nach oben."
      },
      {
        "label": "b",
        "text": "Erdgas ist gut riechbar",
        "explanation": "Falsch. Erdgas ist von Natur aus geruchlos. Es wird odoriert (mit einem stark riechenden Stoff versetzt), damit Lecks bemerkt werden können."
      },
      {
        "label": "c",
        "text": "Erdgas ist eingeatmet ein Blutgift",
        "explanation": "Falsch. Erdgas wirkt primär erstickend, indem es den Sauerstoff verdrängt. Es ist kein Blutgift wie z.B. Kohlenmonoxid."
      }
    ],
    "correctAnswers": ["a"]
  },
  {
    "id": 58,
    "questionText": "Welche grundsätzlichen Schutzmaßnahmen sind beim Einsatz mit radioaktiven Stoffen zu beachten?",
    "options": [
      {
        "label": "a",
        "text": "Abstand halten (groß)",
        "explanation": "Korrekt. Die Strahlungsintensität nimmt mit dem Quadrat der Entfernung ab (Abstandsquadratgesetz)."
      },
      {
        "label": "b",
        "text": "Aufenthaltsdauer kurz",
        "explanation": "Korrekt. Je kürzer die Einwirkzeit, desto geringer die aufgenommene Strahlendosis."
      },
      {
        "label": "c",
        "text": "Abschirmung ausnutzen",
        "explanation": "Korrekt. Geeignete Materialien (z.B. Blei, Beton, Wasser) können Strahlung absorbieren oder schwächen."
      },
      {
        "label": "d",
        "text": "Kontamination vermeiden",
        "explanation": "Korrekt. Verhindern, dass radioaktive Stoffe auf Haut, Kleidung oder Geräte gelangen."
      },
      {
        "label": "e",
        "text": "Inkorporation vermeiden",
        "explanation": "Korrekt. Verhindern, dass radioaktive Stoffe in den Körper gelangen (Einatmen, Verschlucken, über Wunden)."
      },
      {
        "label": "f",
        "text": "Radioaktiven Stoff mit viel Wasser kühlen",
        "explanation": "Falsch. Kühlen ist bei radioaktiven Stoffen nicht die primäre Schutzmaßnahme und kann bei manchen Stoffen sogar zur Ausbreitung der Kontamination führen."
      },
      {
        "label": "g",
        "text": "Radioaktiven Stoff aufnehmen",
        "explanation": "Falsch. Das Aufnehmen radioaktiver Stoffe ist Aufgabe von Spezialkräften und erfordert besondere Schutzmaßnahmen und Geräte."
      }
    ],
    "correctAnswers": ["a", "b", "c", "d", "e"]
  },
  {
    "id": 59,
    "questionText": "Welcher Abstand ist bis zur Festlegung der Absperrgrenze für nicht unmittelbar am Einsatz beteiligte Einsatzkräfte bei Unfällen mit radioaktiven Stoffen vom Schadensobjekt einzuhalten?",
    "options": [
      {
        "label": "a",
        "text": "10 Meter",
        "explanation": "Falsch. Dieser Abstand ist in der Regel zu gering."
      },
      {
        "label": "b",
        "text": "25 Meter",
        "explanation": "Falsch. Auch dieser Abstand ist oft nicht ausreichend als erste Sicherheitszone."
      },
      {
        "label": "c",
        "text": "50 Meter",
        "explanation": "Korrekt. Ein erster Sicherheitsabstand von ca. 50-100 Metern ist eine übliche erste Maßnahme, bis genauere Messungen und Lagebeurteilungen erfolgen können."
      }
    ],
    "correctAnswers": ["c"]
  },
  {
    "id": 60,
    "questionText": "Bereiche mit ABC-Gefahrstoffen werden bei der Einsatzvorbereitung entsprechend den auszuführenden Maßnahmen in drei Gefahrengruppen eingeteilt. Welche Zuordnung ist richtig?",
    "options": [
      {
        "label": "a",
        "text": "Gefahrengruppe I - Bereiche, in denen die Einsatzkräfte nur mit Sonderausrüstung und unter besonderer Überwachung und Dekontamination/Hygiene tätig werden dürfen",
        "explanation": "Falsch. Dies beschreibt eher die Anforderungen für Gefahrengruppe II oder III."
      },
      {
        "label": "b",
        "text": "Gefahrengruppe II - Bereiche, in denen die Einsatzkräfte ohne Sonderausrüstung tätig werden dürfen. Zur Vermeidung einer Inkorporation soll jedoch Atemschutz getragen werden",
        "explanation": "Falsch. In Gefahrengruppe II ist in der Regel mindestens Standard-PSA und Atemschutz erforderlich, oft auch schon spezielle Schutzkleidung."
      },
      {
        "label": "c",
        "text": "Gefahrengruppe III - Bereiche, in denen Einsatzkräfte nur mit Sonderausrüstung und unter besonderer Überwachung und Dekontamination/Hygiene tätig werden dürfen und deren Eigenart die Anwesenheit einer fachkundigen Person notwendig macht, die während des Einsatzes die entstehende Gefährdung und die anzuwendenden Schutzmaßnahmen beurteilen kann",
        "explanation": "Korrekt. Gefahrengruppe III stellt die höchste Gefährdungsstufe dar und erfordert maximale Schutzmaßnahmen und Fachexpertise."
      }
    ],
    "correctAnswers": ["c"]
  }
];