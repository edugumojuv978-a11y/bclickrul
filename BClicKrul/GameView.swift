import SwiftUI

struct GameView: View {
    @AppStorage("bclic.krul.best.round") private var bestRound = 0
    @AppStorage("bclic.krul.unlocked.level") private var unlockedLevel = 1
    @AppStorage("bclic.krul.language") private var languageRawValue = AppLanguage.english.rawValue

    @State private var selectedLevelID = 1
    @State private var previewEnd: CGPoint?
    @State private var discPosition: CGPoint?
    @State private var trail: [CGPoint] = []
    @State private var roundScore = 0
    @State private var shotsTaken = 0
    @State private var shotResults: [Int] = []
    @State private var statusText = ""
    @State private var isAnimating = false

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    private var levels: [GameLevel] {
        AppData.levels(language)
    }

    private var selectedLevel: GameLevel {
        levels.first(where: { $0.id == selectedLevelID }) ?? levels[0]
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    BrandHeader(
                        eyebrow: language.text("Practice mode", "Trainingsmodus", "Mode entrainement", "Modo practica"),
                        title: language.text("Work on line, pace, and finish across six training lanes.", "Linie, Tempo und Abschluss uber sechs Trainingsbahnen verbessern.", "Travailler la ligne, la vitesse et la finition sur six pistes d'entrainement.", "Trabajar linea, ritmo y cierre en seis pistas de practica."),
                        subtitle: language.text("Each lane focuses on a slightly different control task, from reading the curve to finishing through traffic near the stake.", "Jede Bahn legt den Schwerpunkt auf eine etwas andere Aufgabe, von der Kurvenlese bis zum Abschluss durch Verkehr am Pflock.", "Chaque piste met l'accent sur une tache de controle differente, de la lecture de courbe a la finition autour du piquet.", "Cada pista se centra en una tarea de control distinta, desde leer la curva hasta cerrar jugadas con trafico cerca de la estaca.")
                    )

                    scoreRow
                    levelsRow
                    laneCard

                    VStack(spacing: 12) {
                        Button(language.text("Start level again", "Level neu starten", "Rejouer le niveau", "Reiniciar nivel")) {
                            resetRound()
                        }
                        .buttonStyle(WhiteCTAButtonStyle())

                        Text(statusText)
                            .font(.footnote)
                            .foregroundStyle(BrandPalette.secondaryText)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    SectionTitle(
                        title: language.text("Lane objectives", "Bahnziele", "Objectifs de piste", "Objetivos de pista"),
                        detail: language.text("Reach the target score before the allotted shots run out. Later lanes reward cleaner release, better reading, and stronger finishing control.", "Erreiche den Zielwert, bevor die vorgegebenen Wurfe aufgebraucht sind. Spatere Bahnen belohnen sauberere Abgabe, besseres Lesen und kontrollierteren Abschluss.", "Atteignez le score cible avant d'epuiser les tirs. Les pistes suivantes demandent une meilleure sortie, une meilleure lecture et plus de controle a la finition.", "Alcanza la puntuacion objetivo antes de agotar los tiros. Las pistas avanzadas exigen mejor salida, mejor lectura y mas control al cerrar.")
                    )

                    VStack(spacing: 10) {
                        explanationRow(title: language.text("Current lane", "Aktuelle Bahn", "Piste actuelle", "Pista actual"), detail: selectedLevel.subtitle)
                        explanationRow(title: language.text("Target", "Ziel", "Cible", "Objetivo"), detail: "\(selectedLevel.targetScore) \(language.text("points in", "Punkte in", "points en", "puntos en")) \(selectedLevel.shots) \(language.text("shots", "Wurfen", "tirs", "tiros"))")
                        explanationRow(title: language.text("Progress guide", "Fortschritt", "Progression", "Progreso"), detail: language.text("All lanes are available at any time. Use the score targets as a way to measure consistency from one lane to the next.", "Alle Bahnen sind jederzeit spielbar. Die Zielwerte helfen dabei, die eigene Konstanz von Bahn zu Bahn zu messen.", "Toutes les pistes sont disponibles a tout moment. Les scores cibles servent a mesurer la regularite d'une piste a l'autre.", "Todas las pistas estan disponibles en cualquier momento. Las puntuaciones objetivo sirven para medir la regularidad entre pistas."))
                    }
                }
                .padding(20)
            }
            .background(BrandPalette.background.ignoresSafeArea())
            .navigationTitle(Copy.playTab(language))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                selectedLevelID = min(max(1, selectedLevelID), levels.count)
                resetRound()
            }
        }
    }

    private var scoreRow: some View {
        HStack(spacing: 12) {
            StatPill(value: "\(roundScore)", label: language.text("round", "Runde", "manche", "ronda"))
            StatPill(value: "\(bestRound)", label: language.text("best", "Bestwert", "meilleur", "mejor"))
            StatPill(value: "\(max(0, selectedLevel.shots - shotsTaken))", label: language.text("shots left", "Wurfe ubrig", "tirs restants", "tiros restantes"))
        }
    }

    private var levelsRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(levels) { level in
                    Button {
                        selectedLevelID = level.id
                        resetRound()
                    } label: {
                        VStack(spacing: 6) {
                            Text("\(level.id)")
                                .font(.headline.weight(.black))
                            Text(level.title)
                                .font(.caption.weight(.semibold))
                        }
                        .frame(width: 78, height: 62)
                        .background(level.id == selectedLevelID ? BrandPalette.white : (level.id <= unlockedLevel ? BrandPalette.card : BrandPalette.deepRed.opacity(0.82)))
                        .foregroundStyle(level.id == selectedLevelID ? BrandPalette.background : BrandPalette.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(level.id == selectedLevelID ? BrandPalette.gold : (level.id <= unlockedLevel ? BrandPalette.line : BrandPalette.white.opacity(0.14)), lineWidth: 1)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .opacity(1)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var laneCard: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let start = CGPoint(x: size.width * 0.18, y: size.height * 0.82)
            let pin = CGPoint(x: size.width * 0.78, y: size.height * 0.22)
            let shownDisc = discPosition ?? start

            ZStack {
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [BrandPalette.sand.opacity(0.18), BrandPalette.deepRed, BrandPalette.card],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(BrandPalette.white.opacity(0.14), lineWidth: 1)
                    .padding(12)

                targetRings(at: pin)
                obstacles(in: size)

                if trail.count > 1 {
                    Path { path in
                        path.addLines(trail)
                    }
                    .stroke(BrandPalette.gold, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                }

                if let previewEnd {
                    Path { path in
                        path.move(to: start)
                        path.addQuadCurve(to: previewEnd, control: previewControlPoint(for: start, end: previewEnd, size: size))
                    }
                    .stroke(BrandPalette.white.opacity(0.5), style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [6, 8]))
                }

                stake(at: pin)
                bolle(at: shownDisc)

                VStack {
                    HStack {
                        TagChip(title: selectedLevel.title)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("\(language.text("Shots", "Wurfe", "Tirs", "Tiros")): \(shotResults.map(String.init).joined(separator: " · "))")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(BrandPalette.secondaryText)
                            .lineLimit(2)
                        Spacer()
                    }
                }
                .padding(20)
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 10)
                    .onChanged { value in
                        guard !isAnimating, shotsTaken < selectedLevel.shots else { return }
                        previewEnd = predictedEnd(from: start, drag: value.translation, size: size)
                    }
                    .onEnded { value in
                        guard !isAnimating, shotsTaken < selectedLevel.shots else { return }
                        let end = predictedEnd(from: start, drag: value.translation, size: size)
                        previewEnd = nil
                        runShot(from: start, to: end, pin: pin, size: size)
                    }
            )
            .onAppear {
                if discPosition == nil {
                    discPosition = start
                }
            }
        }
        .frame(height: 390)
    }

    private func runShot(from start: CGPoint, to end: CGPoint, pin: CGPoint, size: CGSize) {
        isAnimating = true
        trail = [start]
        discPosition = start

        let control = previewControlPoint(for: start, end: end, size: size)

        Task {
            for step in 1...36 {
                let t = Double(step) / 36
                let point = pointOnCurve(start: start, control: control, end: end, progress: t)
                await MainActor.run {
                    discPosition = point
                    trail.append(point)
                }
                try? await Task.sleep(nanoseconds: 16_000_000)
            }

            let award = awardScore(for: end, pin: pin)

            await MainActor.run {
                shotsTaken += 1
                roundScore += award
                shotResults.append(award)
                if roundScore > bestRound {
                    bestRound = roundScore
                }

                if shotsTaken == selectedLevel.shots {
                    finishRound()
                } else {
                    statusText = awardMessage(for: award)
                }

                isAnimating = false
            }
        }
    }

    private func finishRound() {
        if roundScore >= selectedLevel.targetScore {
            unlockedLevel = min(levels.count, max(unlockedLevel, selectedLevel.id + 1))
            statusText = language.text("Target reached. Move on or replay the lane for a cleaner finish.", "Ziel erreicht. Weiter zur nachsten Bahn oder fur einen saubereren Abschluss erneut spielen.", "Objectif atteint. Passez a la piste suivante ou rejouez-la pour une finition plus propre.", "Objetivo cumplido. Pasa a la siguiente pista o repitela para cerrar mejor.")
        } else {
            statusText = language.text("Target missed. Try again with better pace and a cleaner curve.", "Ziel verpasst. Versuche es noch einmal mit besserem Tempo und sauberer Kurve.", "Objectif manque. Reessayez avec une meilleure vitesse et une courbe plus propre.", "Objetivo no alcanzado. Intentalo de nuevo con mejor ritmo y una curva mas limpia.")
        }
    }

    private func predictedEnd(from start: CGPoint, drag: CGSize, size: CGSize) -> CGPoint {
        let power = min(max((-drag.height + drag.width * 0.28) / (260 * selectedLevel.powerTightness), 0.18), 1.0)
        let curve = min(max((drag.width - 40) / 170, -0.15), 1.0)

        let x = size.width * (0.50 + (curve + selectedLevel.curveBias) * 0.25)
        let y = size.height * (0.22 + (1 - power) * 0.46)

        return CGPoint(
            x: min(max(x, size.width * 0.28), size.width * 0.88),
            y: min(max(y, size.height * 0.16), size.height * 0.80)
        )
    }

    private func previewControlPoint(for start: CGPoint, end: CGPoint, size: CGSize) -> CGPoint {
        CGPoint(
            x: start.x + (end.x - start.x) * 0.35 + size.width * 0.18,
            y: start.y - (start.y - end.y) * 0.28
        )
    }

    private func pointOnCurve(start: CGPoint, control: CGPoint, end: CGPoint, progress: Double) -> CGPoint {
        let t = progress
        let x = pow(1 - t, 2) * start.x + 2 * (1 - t) * t * control.x + pow(t, 2) * end.x
        let y = pow(1 - t, 2) * start.y + 2 * (1 - t) * t * control.y + pow(t, 2) * end.y
        return CGPoint(x: x, y: y)
    }

    private func awardScore(for end: CGPoint, pin: CGPoint) -> Int {
        let distance = hypot(end.x - pin.x, end.y - pin.y)
        let obstaclePenalty = selectedLevel.obstacleMode == .doublePressure ? 5 : 0

        switch distance {
        case ..<24: return 50 - obstaclePenalty
        case ..<46: return 30 - obstaclePenalty
        case ..<78: return 15
        case ..<140: return 5
        default: return 0
        }
    }

    private func awardMessage(for award: Int) -> String {
        switch award {
        case 45...:
            return language.text("Perfect settle.", "Perfektes Finish.", "Pose parfaite.", "Asentamiento perfecto.")
        case 25...:
            return language.text("Strong line into the target.", "Starke Linie ins Ziel.", "Belle ligne vers la cible.", "Gran linea hacia el objetivo.")
        case 10...:
            return language.text("Solid finish near the stake.", "Solides Finish nahe am Pflock.", "Bonne fin de trajectoire pres du piquet.", "Buen cierre cerca de la estaca.")
        case 1...:
            return language.text("Playable result. Shape the next curve better.", "Spielbarer Wurf. Die nachste Kurve sauberer setzen.", "Resultat jouable. Mieux dessiner la prochaine courbe.", "Resultado jugable. Ajusta mejor la siguiente curva.")
        default:
            return language.text("Too wide. Shorten the line and commit to the curve.", "Zu weit. Linie verkurzen und zur Kurve stehen.", "Trop large. Raccourcissez la ligne et engagez la courbe.", "Muy abierto. Acorta la linea y compromete la curva.")
        }
    }

    private func resetRound() {
        roundScore = 0
        shotsTaken = 0
        shotResults = []
        trail = []
        previewEnd = nil
        discPosition = nil
        statusText = language.text("Drag upward and slightly right to send the bolle on a curved lane.", "Ziehe nach oben und leicht nach rechts fur die Kurvenbahn.", "Glissez vers le haut et legerement a droite pour lancer la courbe.", "Desliza hacia arriba y un poco a la derecha para trazar la curva.")
    }

    @ViewBuilder
    private func obstacles(in size: CGSize) -> some View {
        switch selectedLevel.obstacleMode {
        case .none:
            EmptyView()
        case .blocker:
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(BrandPalette.white.opacity(0.26))
                .frame(width: 22, height: 70)
                .position(x: size.width * 0.58, y: size.height * 0.44)
        case .narrowGate:
            Group {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(BrandPalette.white.opacity(0.26))
                    .frame(width: 20, height: 72)
                    .position(x: size.width * 0.54, y: size.height * 0.46)
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(BrandPalette.white.opacity(0.26))
                    .frame(width: 20, height: 72)
                    .position(x: size.width * 0.67, y: size.height * 0.40)
            }
        case .doublePressure:
            Group {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(BrandPalette.white.opacity(0.24))
                    .frame(width: 24, height: 82)
                    .position(x: size.width * 0.50, y: size.height * 0.54)
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(BrandPalette.white.opacity(0.24))
                    .frame(width: 24, height: 82)
                    .position(x: size.width * 0.66, y: size.height * 0.36)
            }
        }
    }

    private func targetRings(at pin: CGPoint) -> some View {
        ZStack {
            Circle()
                .stroke(BrandPalette.white.opacity(0.24), lineWidth: 1.5)
                .frame(width: 132, height: 132)
            Circle()
                .stroke(BrandPalette.gold.opacity(0.5), lineWidth: 2)
                .frame(width: 84, height: 84)
            Circle()
                .stroke(BrandPalette.white, lineWidth: 3)
                .frame(width: 42, height: 42)
        }
        .position(pin)
    }

    private func stake(at point: CGPoint) -> some View {
        VStack(spacing: 0) {
            Capsule()
                .fill(BrandPalette.white)
                .frame(width: 8, height: 44)
            Circle()
                .fill(BrandPalette.gold)
                .frame(width: 12, height: 12)
                .offset(y: -4)
        }
        .position(point)
    }

    private func bolle(at point: CGPoint) -> some View {
        ZStack {
            Circle()
                .fill(BrandPalette.white)
                .frame(width: 26, height: 26)
            Circle()
                .stroke(BrandPalette.gold, lineWidth: 5)
                .frame(width: 42, height: 42)
        }
        .shadow(color: .black.opacity(0.18), radius: 10, y: 4)
        .position(point)
    }

    private func explanationRow(title: String, detail: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .foregroundStyle(BrandPalette.gold)
            Text(detail)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}
