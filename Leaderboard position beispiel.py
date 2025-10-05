import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import math

def weighted_score(durchschnittliche_wertung, anzahl_pruefungen):
    """
    Zeigt die berechnung der Leaderboardposition
    """
    base_score = durchschnittliche_wertung
    
    experience_bonus = 0.0
    if anzahl_pruefungen >= 1:
        log_bonus = math.log(anzahl_pruefungen + 1) / math.log(2)
        experience_bonus = log_bonus * 1.2
    
    reliability_factor = 1.0
    if anzahl_pruefungen < 5:
        if anzahl_pruefungen == 1:
            reliability_factor = 0.70
        elif anzahl_pruefungen == 2:
            reliability_factor = 0.75
        elif anzahl_pruefungen == 3:
            reliability_factor = 0.80
        elif anzahl_pruefungen == 4:
            reliability_factor = 0.85
    elif 5 <= anzahl_pruefungen < 15:
        reliability_factor = 0.90 + ((anzahl_pruefungen - 5) * 0.01)
    elif 15 <= anzahl_pruefungen < 30:
        reliability_factor = 1.0 + ((anzahl_pruefungen - 15) * 0.01)
    elif 30 <= anzahl_pruefungen < 50:
        reliability_factor = 1.15 + ((anzahl_pruefungen - 30) * 0.015)
    elif anzahl_pruefungen >= 50:
        reliability_factor = 1.45 + ((anzahl_pruefungen - 50) * 0.01)
        
    return (base_score + experience_bonus) * reliability_factor

# 3D-Visualisierung (unverändert)
n_values = np.arange(1, 71)
avg_values = np.linspace(70, 100, 61)
N, A = np.meshgrid(n_values, avg_values)
W = np.array([[weighted_score(a, n) for n in n_values] for a in avg_values])
fig = plt.figure(figsize=(10, 7))
ax = fig.add_subplot(111, projection="3d")
surf = ax.plot_surface(N, A, W, cmap="viridis", linewidth=0, antialiased=True)
ax.set_title("3D-Visualisierung: Weighted Score - Leaderboard-Position basiert auf diesem Score")
ax.set_xlabel("Anzahl Prüfungen")
ax.set_ylabel("Durchschnittlicher Score")
ax.set_zlabel("Weighted Score")
fig.colorbar(surf, shrink=0.5, aspect=10, label="Weighted Score")
plt.tight_layout()
plt.show()

# Leaderboard-Berechnung und -Anzeige
def calculate_leaderboard():
    """
    Berechnet und zeigt die Leaderboard-Positionen basierend auf den Beispielwerten an.
    """
    test_cases = [
        {'name': 'Spieler A', 'pruefungen': 70, 'wertung': 95.0},
        {'name': 'Spieler B', 'pruefungen': 50, 'wertung': 96.0},
        {'name': 'Spieler C', 'pruefungen': 30, 'wertung': 95.0},
        {'name': 'Spieler D', 'pruefungen': 10, 'wertung': 97.0},
        {'name': 'Spieler E', 'pruefungen': 5, 'wertung': 98.0},
        {'name': 'Spieler F', 'pruefungen': 1, 'wertung': 100.0},
        # Hinzugefügte Testfälle und Edge Cases
        {'name': 'Spieler G', 'pruefungen': 4, 'wertung': 99.0},   # Edge Case < 5
        {'name': 'Spieler H', 'pruefungen': 5, 'wertung': 92.0},   # Edge Case 5
        {'name': 'Spieler I', 'pruefungen': 14, 'wertung': 90.0},  # Edge Case < 15
        {'name': 'Spieler J', 'pruefungen': 15, 'wertung': 88.0},  # Edge Case 15
        {'name': 'Spieler K', 'pruefungen': 29, 'wertung': 85.0},  # Edge Case < 30
        {'name': 'Spieler L', 'pruefungen': 30, 'wertung': 83.0},  # Edge Case 30
        {'name': 'Spieler M', 'pruefungen': 49, 'wertung': 80.0},  # Edge Case < 50
        {'name': 'Spieler N', 'pruefungen': 50, 'wertung': 75.0},  # Edge Case 50
        {'name': 'Spieler O', 'pruefungen': 65, 'wertung': 78.0},  # Hohe Anzahl, niedriger Score
        {'name': 'Spieler P', 'pruefungen': 2, 'wertung': 100.0},  # Sehr niedrige Anzahl, hoher Score
    ]

    for test_case in test_cases:
        test_case['weighted_score'] = weighted_score(test_case['wertung'], test_case['pruefungen'])

    sorted_leaderboard = sorted(test_cases, key=lambda x: x['weighted_score'], reverse=True)

    print("\n-------------------------------------------")
    print("      Leaderboard-Positionen")
    print("-------------------------------------------")
    print(f"{'Rang':<5} | {'Name':<10} | {'Prüfungen':<10} | {'Score':<10} | {'Weighted Score':<15}")
    print("-" * 65)
    
    for i, entry in enumerate(sorted_leaderboard):
        rank = i + 1
        name = entry['name']
        pruefungen = entry['pruefungen']
        wertung = f"{entry['wertung']:.2f}%"
        weighted_score_val = f"{entry['weighted_score']:.2f}"
        
        print(f"{rank:<5} | {name:<10} | {pruefungen:<10} | {wertung:<10} | {weighted_score_val:<15}")

calculate_leaderboard()