import SwiftUI

struct CultureView: View {
    @EnvironmentObject private var store: MatchStore
    @State private var quizIndex = 0
    @State private var selectedAnswer: Int?
    @State private var correctAnswers = 0
    @State private var showingClearAlert = false
    @AppStorage("bclic.krul.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    private var question: QuizQuestion {
        AppData.quiz(language)[quizIndex]
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    BrandHeader(
                        eyebrow: language.text("Heritage", "Hintergrund", "Patrimoine", "Patrimonio"),
                        title: language.text("Use clear context when you introduce the game to new players.", "Nutzlichen Kontext bereithalten, wenn das Spiel neuen Menschen vorgestellt wird.", "Donner un contexte clair quand vous presentez le jeu a de nouveaux joueurs.", "Usar contexto claro al presentar el juego a personas nuevas."),
                        subtitle: language.text("This section brings together background notes, a short historical overview, a glossary, regional markers, and a quiz that works well in live sessions.", "Dieser Bereich bundelt Hintergrundnotizen, einen kurzen Geschichtsabriss, ein Glossar, regionale Bezugspunkte und ein Quiz fur Live-Sessions.", "Cette section reunit notes de contexte, bref parcours historique, glossaire, reperes regionaux et quiz utile en animation.", "Esta seccion reune notas de contexto, una breve historia, glosario, referencias regionales y un quiz util en sesiones en vivo.")
                    )

                    SectionTitle(
                        title: language.text("Why this context matters", "Warum dieser Kontext wichtig ist", "Pourquoi ce contexte compte", "Por que importa este contexto"),
                        detail: language.text("Good background information helps players understand where the game comes from, how it is still practiced, and why clubs continue to keep it active.", "Gute Hintergrundinformationen zeigen, woher das Spiel kommt, wie es heute noch gespielt wird und warum Clubs es weitertragen.", "Un bon contexte aide a comprendre d'ou vient le jeu, comment il se pratique encore aujourd'hui et pourquoi les clubs le maintiennent vivant.", "La buena informacion de contexto ayuda a entender de donde viene el juego, como se sigue practicando y por que los clubes lo mantienen activo.")
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.cultureNotes(language)) { note in
                            noteCard(note)
                        }
                    }

                    SectionTitle(
                        title: language.text("Short history", "Kurze Geschichte", "Histoire breve", "Historia breve"),
                        detail: language.text("A compact timeline from older throwing traditions to the clubs and heritage organizations that keep the game visible today.", "Ein kompakter Zeitstrahl von fruheren Wurfspielen bis zu den Clubs und Kulturträgern, die das Spiel heute sichtbar halten.", "Une chronologie concise, des anciens jeux de lancer jusqu'aux clubs et acteurs du patrimoine qui maintiennent le jeu visible aujourd'hui.", "Una cronologia compacta desde antiguos juegos de lanzamiento hasta los clubes y entidades patrimoniales que hoy mantienen visible el juego.")
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.history(language)) { story in
                            historyCard(story)
                        }
                    }

                    quizCard

                    SectionTitle(
                        title: language.text("Glossary", "Glossar", "Glossaire", "Glosario"),
                        detail: language.text("Useful terms for explaining the equipment, the lane, and the most common actions in play.", "Nutzliche Begriffe, um Spielmaterial, Bahn und die haufigsten Spielsituationen zu erklaren.", "Termes utiles pour expliquer le materiel, la piste et les actions les plus courantes.", "Terminos utiles para explicar el material, la pista y las acciones mas comunes del juego.")
                    )

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(AppData.glossary(language)) { term in
                            glossaryCard(term)
                        }
                    }

                    SectionTitle(
                        title: language.text("Regional references", "Regionale Bezugspunkte", "Reperes regionaux", "Referencias regionales"),
                        detail: language.text("These notes help place the game within Belgian regional culture and public heritage presentation.", "Diese Hinweise ordnen das Spiel in die belgische Regional- und Kulturerbepraxis ein.", "Ces notes replacent le jeu dans la culture regionale belge et dans sa presentation patrimoniale publique.", "Estas notas sitúan el juego dentro de la cultura regional belga y de su presentacion patrimonial publica.")
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.regions(language)) { spot in
                            regionCard(spot)
                        }
                    }

                    SectionTitle(
                        title: language.text("Privacy", "Datenschutz", "Confidentialite", "Privacidad"),
                        detail: language.text("Scores and history stay only on this device.", "Scores und Historie bleiben auf diesem Gerat.", "Les scores et l'historique restent sur cet appareil.", "Las puntuaciones y el historial quedan solo en este dispositivo.")
                    )

                    Button(language.text("Delete local match history", "Lokale Historie loschen", "Supprimer l'historique local", "Borrar historial local"), role: .destructive) {
                        showingClearAlert = true
                    }
                    .buttonStyle(.bordered)
                    .tint(BrandPalette.gold)
                    .disabled(store.logs.isEmpty)
                }
                .padding(20)
            }
            .background(BrandPalette.background.ignoresSafeArea())
            .navigationTitle(Copy.heritageTab(language))
            .navigationBarTitleDisplayMode(.inline)
            .alert(language.text("Delete local history", "Lokale Historie loschen", "Supprimer l'historique local", "Borrar historial local"), isPresented: $showingClearAlert) {
                Button(language.text("Cancel", "Abbrechen", "Annuler", "Cancelar"), role: .cancel) {}
                Button(language.text("Delete", "Loschen", "Supprimer", "Borrar"), role: .destructive) {
                    store.clearHistory()
                }
            } message: {
                Text(language.text("This removes saved match logs from the device.", "Dies entfernt die gespeicherten Matchlogs vom Gerat.", "Cela supprime les matchs enregistres de l'appareil.", "Esto elimina los partidos guardados del dispositivo."))
            }
        }
    }

    private var quizCard: some View {
        let answered = selectedAnswer != nil

        return VStack(alignment: .leading, spacing: 14) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(language.text("Heritage quiz", "Heritage-Quiz", "Quiz patrimoine", "Quiz patrimonial"))
                        .font(.title3.weight(.black))
                        .foregroundStyle(BrandPalette.white)
                    Text("\(language.text("Question", "Frage", "Question", "Pregunta")) \(quizIndex + 1) \(language.text("of", "von", "sur", "de")) \(AppData.quiz(language).count) · \(correctAnswers) \(language.text("correct", "richtig", "bonnes", "correctas"))")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(BrandPalette.secondaryText)
                }
                Spacer()
                Image(systemName: "sparkles")
                    .font(.title2)
                    .foregroundStyle(BrandPalette.gold)
            }

            Text(question.prompt)
                .font(.headline)
                .foregroundStyle(BrandPalette.white)
                .fixedSize(horizontal: false, vertical: true)

            VStack(spacing: 10) {
                ForEach(question.options.indices, id: \.self) { index in
                    Button {
                        guard selectedAnswer == nil else { return }
                        selectedAnswer = index
                        if index == question.correctIndex {
                            correctAnswers += 1
                        }
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: answerIcon(for: index))
                                .font(.headline)
                            Text(question.options[index])
                                .font(.subheadline.weight(.semibold))
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer(minLength: 0)
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(answerBackground(for: index))
                        .foregroundStyle(answerForeground(for: index))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }
            }

            if answered {
                Text(question.explanation)
                    .font(.footnote)
                    .foregroundStyle(BrandPalette.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)

                Button(quizIndex == AppData.quiz(language).count - 1 ? language.text("Restart quiz", "Quiz neu starten", "Recommencer le quiz", "Reiniciar quiz") : language.text("Next question", "Naechste Frage", "Question suivante", "Siguiente pregunta")) {
                    if quizIndex == AppData.quiz(language).count - 1 {
                        quizIndex = 0
                        correctAnswers = 0
                    } else {
                        quizIndex += 1
                    }
                    selectedAnswer = nil
                }
                .buttonStyle(WhiteCTAButtonStyle())
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

    private func noteCard(_ note: CultureNote) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note.tag.uppercased())
                .font(.caption2.weight(.black))
                .foregroundStyle(BrandPalette.gold)
            Text(note.title)
                .font(.headline)
                .foregroundStyle(BrandPalette.white)
            Text(note.detail)
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

    private func historyCard(_ story: HeritageStory) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: story.systemImage)
                .font(.headline)
                .foregroundStyle(BrandPalette.background)
                .frame(width: 40, height: 40)
                .background(BrandPalette.gold)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 5) {
                Text(story.period.uppercased())
                    .font(.caption2.weight(.black))
                    .foregroundStyle(BrandPalette.gold)
                Text(story.title)
                    .font(.headline)
                    .foregroundStyle(BrandPalette.white)
                Text(story.detail)
                    .font(.subheadline)
                    .foregroundStyle(BrandPalette.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 0)
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func glossaryCard(_ term: GlossaryTerm) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(term.term)
                .font(.headline)
                .foregroundStyle(BrandPalette.gold)
            Text(term.meaning)
                .font(.caption)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(14)
        .frame(maxWidth: .infinity, minHeight: 118, alignment: .topLeading)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func regionCard(_ spot: RegionSpot) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(spot.area)
                    .font(.headline)
                    .foregroundStyle(BrandPalette.white)
                Spacer()
                TagChip(title: spot.tag)
            }
            Text(spot.vibe)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(BrandPalette.gold)
            Text(spot.detail)
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

    private func answerIcon(for index: Int) -> String {
        guard let selectedAnswer else { return "circle" }
        if index == question.correctIndex { return "checkmark.circle.fill" }
        if index == selectedAnswer { return "xmark.circle.fill" }
        return "circle"
    }

    private func answerBackground(for index: Int) -> Color {
        guard let selectedAnswer else { return BrandPalette.deepRed }
        if index == question.correctIndex { return BrandPalette.white }
        if index == selectedAnswer { return BrandPalette.cardSoft }
        return BrandPalette.deepRed
    }

    private func answerForeground(for index: Int) -> Color {
        guard let selectedAnswer else { return BrandPalette.white }
        if index == question.correctIndex { return BrandPalette.background }
        if index == selectedAnswer { return BrandPalette.white }
        return BrandPalette.secondaryText
    }
}
