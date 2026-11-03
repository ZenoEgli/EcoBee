# EcoBee - Datensimulation
# Beispielpflanze: Gentiana clusii

# Zufallszahlen reproduzierbar machen
set.seed(2000)

# Anzahl Pflanzen
n <- 250

# Pflanzen-IDs
pflanzen_id <- 1:n

# Umweltbedingungen simulieren
hoehenlage <- round(runif(n, 1200, 2400))
temperatur <- round(16 - 0.005 * (hoehenlage - 1200) + rnorm(n, 0, 1.5), 1)
sonnenstunden <- round(runif(n, 4, 10), 1)

# Bestäuberbesuche pro Blüte und Tag
besuche <- rpois(n, lambda = 6)

# Durchschnittliche Samenanzahl pro Blüte
samenanzahl <- 100 + 5 * besuche + 1.5 * (temperatur - 12) -
  0.005 * (hoehenlage - 1800) + 2 * (sonnenstunden - 7) + rnorm(n, 0, 15)

# Negative Werte ausschliessen und runden
samenanzahl <- round(pmax(0, samenanzahl), 1)

# Datensatz zusammenstellen
daten <- data.frame(
  pflanzen_id,
  samenanzahl,
  besuche,
  temperatur,
  hoehenlage,
  sonnenstunden)

# Ergebnisse kontrollieren
print(head(daten))
print(summary(daten$samenanzahl))
print(dim(daten))


# Multiple lineare Regression
modell <- lm(samenanzahl ~ besuche + temperatur + hoehenlage
  + sonnenstunden, data = daten)

# Ergebnisse anzeigen
summary(modell)


# Ergebnisse für GitHub speichern

# Ordner erstellen
dir.create("ergebnisse", showWarnings = FALSE)

# Simulierten Datensatz speichern
write.csv(daten, "ergebnisse/ecobee_daten.csv", row.names = FALSE)

# Regressionsausgabe speichern
capture.output(summary(modell), file = "ergebnisse/regression_ergebnisse.txt")

# Residuen-Diagramm speichern
png("ergebnisse/residuen.png", width = 1200, height = 850, res = 150)
plot(modell, which = 1)
dev.off()

# Q-Q-Diagramm speichern
png("ergebnisse/qq_plot.png", width = 1200, height = 850, res = 150)
plot(modell, which = 2)
dev.off()