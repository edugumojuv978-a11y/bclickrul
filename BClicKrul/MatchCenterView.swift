import SwiftUI

struct MatchCenterView: View {
    @EnvironmentObject private var store: MatchStore
    @State private var showingResetAlert = false
    @AppStorage("bclic.krul.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    BrandHeader(
                        eyebrow: language.text("Match board", "Matchtafel", "Tableau de match", "Marcador"),
                        title: language.text("Track a local game with simple scoring and saved history.", "Ein lokales Spiel mit einfacher Wertung und gespeicherter Historie erfassen.", "Suivre une partie locale avec un score simple et un historique enregistre.", "Registrar una partida local con puntuacion simple e historial guardado."),
                        subtitle: language.text("Enter side names, set a target score, mark which side owns the next line, and save the result on the device when the game ends.", "Seitennamen eingeben, Zielwert festlegen, die bessere Linie markieren und das Ergebnis am Ende lokal speichern.", "Saisir les noms, definir un score cible, indiquer quel cote tient la meilleure ligne et enregistrer le resultat sur l'appareil en fin de partie.", "Introduce nombres, define la puntuacion objetivo, marca que lado tiene la mejor linea y guarda el resultado en el dispositivo al final de la partida.")
                    )

                    matchIntro
                    nameInputs
                    setupCard
                    scoreboard
                    statusRow
                    controls
                    notesCard

                    SectionTitle(
                        title: language.text("Saved local history", "Gespeicherte Historie", "Historique local enregistre", "Historial local guardado"),
                        detail: language.text("Saved results stay on the device and can be reused during club sessions, demonstrations, or training evenings.", "Gespeicherte Ergebnisse bleiben auf dem Gerat und konnen bei Clubabenden, Vorfuhrungen oder Trainings erneut aufgerufen werden.", "Les resultats enregistres restent sur l'appareil et peuvent etre consultes pendant les soirees de club, demonstrations ou entrainements.", "Los resultados guardados quedan en el dispositivo y pueden consultarse en sesiones de club, demostraciones o entrenamientos.")
                    )

                    if store.logs.isEmpty {
                        EmptyStateCard(
                            title: language.text("No saved matches yet", "Noch keine gespeicherten Matches", "Aucun match enregistre", "Todavia no hay partidos guardados"),
                            systemImage: "clock.badge.questionmark",
                            detail: language.text("Save a finished game and it will appear here as part of the local match history.", "Ein abgeschlossenes Spiel speichern und es erscheint hier in der lokalen Matchhistorie.", "Enregistrez une partie terminee et elle apparaitra ici dans l'historique local.", "Guarda una partida terminada y aparecera aqui dentro del historial local.")
                        )
                    } else {
                        VStack(spacing: 10) {
                            ForEach(store.logs) { log in
                                historyRow(log)
                            }
                        }
                    }
                }
                .padding(20)
                .padding(.bottom, 88)
            }
            .background(BrandPalette.background.ignoresSafeArea())
            .navigationTitle(Copy.scoreTab(language))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(language.text("Reset", "Reset", "Reinitialiser", "Reiniciar")) {
                        showingResetAlert = true
                    }
                    .disabled(store.score.homeScore == 0 && store.score.awayScore == 0)
                    .foregroundStyle(BrandPalette.white)
                }
            }
            .alert(language.text("Reset match", "Match zurucksetzen", "Reinitialiser le match", "Reiniciar partido"), isPresented: $showingResetAlert) {
                Button(language.text("Cancel", "Abbrechen", "Annuler", "Cancelar"), role: .cancel) {}
                Button(language.text("Reset", "Reset", "Reinitialiser", "Reiniciar"), role: .destructive) {
                    store.resetCurrentMatch()
                }
            } message: {
                Text(language.text("Saved history stays untouched.", "Gespeicherte Historie bleibt erhalten.", "L'historique enregistre reste intact.", "El historial guardado no se borra."))
            }
        }
    }

    private var matchIntro: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(language.text("How this simplified format works", "So funktioniert dieses vereinfachte Format", "Comment fonctionne ce format simplifie", "Como funciona este formato simplificado"), systemImage: "text.badge.checkmark")
                .font(.headline)
                .foregroundStyle(BrandPalette.gold)

            VStack(alignment: .leading, spacing: 8) {
                introStep("1", language.text("Set the target score before the first end.", "Den Zielwert vor dem ersten End festlegen.", "Definir le score cible avant le premier end.", "Definir la puntuacion objetivo antes del primer end."))
                introStep("2", language.text("Use the lead marker to show which side controls the better line for the next throw.", "Mit dem Linienmarker festhalten, welche Seite fur den nachsten Wurf die bessere Linie hat.", "Utiliser le marqueur pour indiquer quel cote controle la meilleure ligne pour le lancer suivant.", "Usar el marcador para indicar que lado controla la mejor linea para el siguiente tiro."))
                introStep("3", language.text("Add points, correct mistakes with Undo, and save the final score when the game is finished.", "Punkte erfassen, Fehler mit Undo korrigieren und das Endergebnis nach Spielende speichern.", "Ajouter les points, corriger avec Annuler et enregistrer le score final a la fin de la partie.", "Sumar puntos, corregir con Deshacer y guardar el resultado final cuando termine la partida."))
            }
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var nameInputs: some View {
        VStack(spacing: 12) {
            TextField(language.text("Left side / club", "Linke Seite / Club", "Cote gauche / club", "Lado izquierdo / club"), text: $store.score.homeName)
                .textFieldStyle(.plain)
                .padding(16)
                .foregroundStyle(BrandPalette.white)
                .background(BrandPalette.card)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            TextField(language.text("Right side / club", "Rechte Seite / Club", "Cote droit / club", "Lado derecho / club"), text: $store.score.awayName)
                .textFieldStyle(.plain)
                .padding(16)
                .foregroundStyle(BrandPalette.white)
                .background(BrandPalette.card)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }

    private var setupCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(language.text("Session setup", "Session-Setup", "Configuration de session", "Configuracion de sesion"))
                .font(.headline)
                .foregroundStyle(BrandPalette.white)

            Picker("Target", selection: $store.score.targetScore) {
                Text("7").tag(7)
                Text("9").tag(9)
                Text("11").tag(11)
                Text("13").tag(13)
            }
            .pickerStyle(.segmented)

            HStack(spacing: 12) {
                leadBadge(name: store.score.homeName, isActive: store.score.servingHome)
                leadBadge(name: store.score.awayName, isActive: !store.score.servingHome)
            }

            Button {
                store.toggleLead()
            } label: {
                Label(language.text("Switch lead marker", "Fuhren wechseln", "Changer le marqueur", "Cambiar marcador"), systemImage: "arrow.left.arrow.right")
            }
            .buttonStyle(WhiteCTAButtonStyle())
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var scoreboard: some View {
        HStack(spacing: 12) {
            scoreCard(name: displayName(store.score.homeName, fallback: language.text("Left", "Links", "Gauche", "Izquierda")), score: store.score.homeScore, accent: BrandPalette.gold, side: .home)
            scoreCard(name: displayName(store.score.awayName, fallback: language.text("Right", "Rechts", "Droite", "Derecha")), score: store.score.awayScore, accent: BrandPalette.white, side: .away)
        }
    }

    private var statusRow: some View {
        HStack(spacing: 12) {
            StatPill(value: "\(store.score.targetScore)", label: language.text("target", "Ziel", "cible", "objetivo"))
            StatPill(value: "\(store.score.ends)", label: language.text("ends", "Ends", "ends", "ends"))
            StatPill(value: leadingText, label: language.text("status", "Status", "statut", "estado"))
        }
    }

    private var controls: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                Button {
                    store.addPoint(toHome: true)
                } label: {
                    Text("+ \(shortName(store.score.homeName, fallback: language.text("Left", "Links", "Gauche", "Izquierda")))")
                }
                .buttonStyle(WhiteCTAButtonStyle())

                Button {
                    store.addPoint(toHome: false)
                } label: {
                    Text("+ \(shortName(store.score.awayName, fallback: language.text("Right", "Rechts", "Droite", "Derecha")))")
                }
                .buttonStyle(WhiteCTAButtonStyle())
            }

            HStack(spacing: 12) {
                Button(language.text("Undo", "Undo", "Annuler", "Deshacer")) {
                    store.undoPoint()
                }
                .buttonStyle(.bordered)
                .tint(BrandPalette.gold)
                .disabled(store.score.ends == 0)

                Button(language.text("Save match", "Match speichern", "Enregistrer le match", "Guardar partido")) {
                    store.saveMatch()
                }
                .buttonStyle(WhiteCTAButtonStyle())
                .disabled(store.score.homeScore == 0 && store.score.awayScore == 0)
            }
        }
    }

    private var notesCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label(language.text("Club note", "Clubhinweis", "Note club", "Nota de club"), systemImage: "info.bubble")
                .font(.headline)
                .foregroundStyle(BrandPalette.gold)
            Text(language.text("If a local club uses a more detailed scoring format, keep the explanation consistent: nearest bolle, tactical clear-outs, and a clear throwing order.", "Wenn ein lokaler Club ein genaueres Wertungssystem nutzt, sollte die Erklarung trotzdem konsistent bleiben: nachste Scheibe, taktisches Freiraeumen und klare Wurfreihenfolge.", "Si un club local utilise un comptage plus detaille, gardez une explication constante : bolle la plus proche, tirs tactiques et ordre de lancer clair.", "Si un club local usa un sistema de puntuacion mas detallado, mantengan la explicacion consistente: bolle mas cercana, despejes tacticos y orden claro de tiro."))
                .font(.subheadline)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var leadingText: String {
        if store.score.homeScore == store.score.awayScore {
            return Copy.tie(language)
        }
        return store.score.homeScore > store.score.awayScore ? shortName(store.score.homeName, fallback: language.text("Left", "Links", "Gauche", "Izquierda")) : shortName(store.score.awayName, fallback: language.text("Right", "Rechts", "Droite", "Derecha"))
    }

    private func introStep(_ value: String, _ text: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(value)
                .font(.caption.weight(.black))
                .foregroundStyle(BrandPalette.background)
                .frame(width: 24, height: 24)
                .background(BrandPalette.white)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            Text(text)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.white)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func leadBadge(name: String, isActive: Bool) -> some View {
        VStack(spacing: 6) {
            Text(shortName(name, fallback: language.text("Side", "Seite", "Cote", "Lado")))
                .font(.headline.weight(.bold))
                .foregroundStyle(BrandPalette.white)
                .lineLimit(1)
            Text(isActive ? language.text("currently leading line", "aktuell bessere Linie", "meilleure ligne actuelle", "linea actual lider") : language.text("waiting", "wartet", "attente", "en espera"))
                .font(.caption)
                .foregroundStyle(isActive ? BrandPalette.gold : BrandPalette.secondaryText)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(isActive ? BrandPalette.cardSoft : BrandPalette.deepRed)
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(isActive ? BrandPalette.gold.opacity(0.5) : BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private func scoreCard(name: String, score: Int, accent: Color, side: MatchSide) -> some View {
        VStack(spacing: 10) {
            scoreBadge(accent: accent, side: side)
            Text(name)
                .font(.caption.weight(.bold))
                .foregroundStyle(BrandPalette.secondaryText)
            Text("\(score)")
                .font(.system(size: 54, weight: .black, design: .rounded))
                .monospacedDigit()
                .foregroundStyle(BrandPalette.white)
            Capsule()
                .fill(accent)
                .frame(width: 42, height: 6)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(accent.opacity(0.32), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func scoreBadge(accent: Color, side: MatchSide) -> some View {
        ZStack {
            Circle()
                .fill(BrandPalette.white.opacity(0.1))
                .frame(width: 50, height: 50)

            Circle()
                .stroke(accent.opacity(0.35), lineWidth: 1)
                .frame(width: 50, height: 50)

            if side == .home {
                BrandLogoMark()
                    .frame(width: 30, height: 30)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(BrandPalette.white, lineWidth: 2.4)
                        .frame(width: 22, height: 26)

                    Rectangle()
                        .fill(BrandPalette.white)
                        .frame(width: 2.4, height: 20)

                    HStack(spacing: 4) {
                        Rectangle()
                            .fill(BrandPalette.white)
                            .frame(width: 2.4, height: 16)
                        Rectangle()
                            .fill(BrandPalette.white)
                            .frame(width: 2.4, height: 16)
                    }
                }
            }
        }
    }

    private func historyRow(_ log: MatchLog) -> some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(log.homeName) vs \(log.awayName)")
                    .font(.headline)
                    .foregroundStyle(BrandPalette.white)
                Text(log.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundStyle(BrandPalette.secondaryText)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text(log.summary)
                    .font(.headline.monospacedDigit())
                    .foregroundStyle(BrandPalette.gold)
                Text("\(language.text("to", "bis", "a", "a")) \(log.targetScore)")
                    .font(.caption)
                    .foregroundStyle(BrandPalette.secondaryText)
            }
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func displayName(_ name: String, fallback: String) -> String {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? fallback : trimmed
    }

    private func shortName(_ name: String, fallback: String) -> String {
        let clean = displayName(name, fallback: fallback)
        return clean.count > 10 ? String(clean.prefix(10)) : clean
    }
}

private enum MatchSide {
    case home
    case away
}
