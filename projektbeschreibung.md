# EcoBee – Projektbeschreibung

**Semesterprojekt SMS HS26**



## 1. Projektteam

- Djordje Djenadic
- Zeno Egli

## 2. Handelt es sich um eine Online-App oder ein Start-up? Wie lautet der Name?

Es handelt sich um eine mobile App namens **EcoBee**.

## 3. Welches Problem in Life Sciences löst sie?

- Durch den Klimawandel und den Rückgang von Wildbienen sowie weiteren Bestäubern sind alpine Ökosysteme stark gefährdet.

- Für Naturschutzorganisationen und Ökologen ist oft unklar und schwer messbar, wie stark sich der Rückgang von Bestäubern unter veränderten Umweltbedingungen auf die Fortpflanzung und Samenproduktion bedrohter Gebirgspflanzen auswirkt.

- Ohne quantitative Entscheidungshilfen können Schutzmassnahmen oder Beweidungsbeschränkungen im Gelände nicht gezielt an den am stärksten betroffenen Standorten priorisiert werden.

## 4. Was leistet die App? (Zentrale Idee)

- EcoBee fungiert als digitaler Assistent für Feldökologen, Ranger und landwirtschaftliche Betriebe.

- Nutzer erfassen direkt vor Ort oder über automatisierte Kamera-Zählungen die Aktivität der Bestäuber und kombinieren diese mit lokalen Mikroklima- und Höhendaten.

- Die App prognostiziert über ein integriertes Rechenmodell die zu erwartende Samenproduktion und visualisiert ein drohendes Bestäubungsdefizit frühzeitig über ein intuitives Ampelsystem.

## 5. Wie löst sie das oben benannte Problem?

- Statt erst am Ende der Vegetationsperiode festzustellen, dass Bestände schrumpfen oder Erträge ausbleiben, liefert die App eine datenbasierte Frühwarnung.

- Verantwortliche können gezielte Erhaltungsmassnahmen wie das Anlegen von Blühstreifen, das Aufstellen von Nisthilfen oder Nutzungsanpassungen an Standorten durchführen, an denen die Prognose ein erhöhtes Risiko für eine geringe Samenproduktion zeigt.

## 6. Wie genau wendet ihr Regression an, welche Regressionsart und warum?

**Regressionsart:** Multiple lineare Regression

- Die Zielgrösse (durchschnittliche Samenanzahl pro Blüte) ist eine metrische, kontinuierlich erfassbare Grösse, die von mehreren Umwelt- und Feldfaktoren beeinflusst wird.

- Die multiple lineare Regression ermöglicht es, den Zusammenhang zwischen der Bestäuberfrequenz und der Samenproduktion zu untersuchen. Dabei werden auch Temperatur, Höhenlage und Sonnenstunden berücksichtigt.

## 7. Welche Daten werdet ihr simulieren, wie gross wird der Datensatz sein, wofür stehen die Spalten und Zeilen?

**Datensatzgrösse:** n = 250 Beobachtungen (eine solide Stichprobengrösse zur Schätzung der Regressionskoeffizienten).

**Zeileneinheit:** Jede Zeile steht für eine untersuchte Einzelpflanze an einem bestimmten Messstandort. Die Samenanzahl beschreibt den Durchschnitt mehrerer Blüten dieser Pflanze, falls die Pflanze mehrere Blüten ausbildet.

**Spalten:**

| Variable | Beschreibung |
|---|---|
| `pflanzen_id` | Eindeutige Kennung der Messung (1 bis 250) |
| `samenanzahl` (Y) | Durchschnittliche Anzahl produzierter Samen pro Blüte |
| `besuche` (X1) | Registrierte Bestäuberanflüge pro Tag pro Blüte |
| `temperatur` (X2) | Durchschnittliche Tagestemperatur während der Blütephase in °C |
| `hoehenlage` (X3) | Höhenlage des Messpunkts in Metern über Meer |
| `sonnenstunden` (X4) | Tägliche Sonnenscheindauer während der Hauptblüte in Stunden |

## 8. Wie werdet ihr die Regression auf die simulierten Daten anwenden und wie hilft dies eurer Geschäftsidee?

- **Anwendung auf die Daten:** In R wird das Modell `lm(samenanzahl ~ besuche + temperatur + hoehenlage + sonnenstunden)` auf den simulierten Datensatz kalibriert, um die Regressionskoeffizienten (β-Werte) und deren Signifikanz zu bestimmen.

- **Nutzen für die Geschäftsidee:** Das Modell zeigt, wie sich die erwartete durchschnittliche Samenanzahl bei einem zusätzlichen Bestäuberbesuch verändert, wenn die übrigen Umweltbedingungen gleich bleiben.

- Unterschreitet die vorhergesagte Samenproduktion einen zuvor festgelegten kritischen Schwellenwert, kann die App eine Warnmeldung versenden.
