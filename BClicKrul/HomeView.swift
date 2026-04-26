import SwiftUI

struct HomeView: View {
    @AppStorage("bclic.krul.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 26) {
                    topBar

                    BrandHeader(
                        eyebrow: language.text("Belgian traditional game", "Belgisches Traditionsspiel", "Jeu traditionnel belge", "Juego tradicional belga"),
                        title: language.text("Learn, play, and organize krulbollen in one place.", "Krulbollen lernen, spielen und organisieren an einem Ort.", "Apprendre, jouer et organiser le krulbollen dans une seule app.", "Aprender, jugar y organizar krulbollen en una sola app."),
                        subtitle: language.text("B Clic Krul combines a playable practice mode, a simple match board, verified club profiles, and practical background information for new and returning players.", "B Clic Krul vereint einen spielbaren Trainingsmodus, ein einfaches Matchboard, verifizierte Clubprofile und nutzliche Hintergrundinfos fur Einsteiger und erfahrene Spieler.", "B Clic Krul reunit un mode d'entrainement jouable, un tableau de match simple, des profils de clubs verifies et des informations utiles pour debutants et joueurs reguliers.", "B Clic Krul reúne un modo de practica jugable, un marcador simple, perfiles verificados de clubes e informacion util para quienes empiezan y para jugadores habituales.")
                    )
                    .padding(.bottom, 8)

                    hero

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        StatPill(value: "4", label: language.text("app languages", "App-Sprachen", "langues de l'app", "idiomas de la app"))
                        StatPill(value: "6", label: language.text("practice lanes", "Trainingsbahnen", "pistes d'entrainement", "pistas de practica"))
                        StatPill(value: "5", label: language.text("club profiles", "Clubprofile", "profils de clubs", "perfiles de clubes"))
                        StatPill(value: "100%", label: language.text("on-device", "lokal", "sur l'appareil", "en el dispositivo"))
                    }

                    SectionTitle(
                        title: language.text("What you can do here", "Was die App bietet", "Ce que propose l'app", "Que puedes hacer aqui"),
                        detail: language.text("Use the home screen as a quick guide to the sport, then move into practice, match tracking, clubs, or heritage depending on what you need.", "Der Startbildschirm dient als schneller Einstieg. Danach geht es je nach Bedarf zu Training, Matchverwaltung, Clubs oder Hintergrundwissen.", "L'ecran d'accueil sert de point d'entree rapide vers le sport, puis vers l'entrainement, le suivi de match, les clubs ou le patrimoine selon vos besoins.", "La pantalla principal funciona como introduccion rapida al deporte y luego te lleva a practica, seguimiento de partidos, clubes o patrimonio segun lo que necesites.")
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.guideCards(language)) { card in
                            guideCard(card)
                        }
                    }

                    SectionTitle(
                        title: language.text("Quick understanding", "Schneller Uberblick", "Comprendre rapidement", "Comprension rapida"),
                        detail: language.text("These short facts explain the playing surface, team rhythm, regional roots, and practical setup of the game.", "Diese Kurzinfos erklaren Spieloberflache, Teamrhythmus, regionale Wurzeln und den praktischen Aufbau des Spiels.", "Ces points cles expliquent la surface de jeu, le rythme des equipes, l'ancrage regional et la mise en place pratique du jeu.", "Estos datos explican la superficie de juego, el ritmo por equipos, las raices regionales y la preparacion practica del juego.")
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.quickFacts(language)) { fact in
                            factCard(fact)
                        }
                    }

                    SectionTitle(
                        title: language.text("Essential rules", "Grundregeln", "Regles essentielles", "Reglas esenciales"),
                        detail: language.text("A concise ruleset for first sessions, demonstrations, and casual club play.", "Ein kompaktes Regelset fur erste Runden, Demonstrationen und lockeres Clubspiel.", "Un resume des regles pour premieres sessions, demonstrations et jeu de club informel.", "Un resumen de reglas para primeras sesiones, demostraciones y juego informal de club.")
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.rules(language).prefix(4)) { rule in
                            ruleCard(rule)
                        }
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .scrollIndicators(.hidden)
            .background(BrandPalette.background.ignoresSafeArea())
            .navigationTitle(Copy.homeTab(language))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var topBar: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 14) {
                BrandLogoMark()
                    .frame(width: 68, height: 68)

                VStack(alignment: .leading, spacing: 6) {
                    Text(Copy.appName(language))
                        .font(.system(size: 30, weight: .black, design: .rounded))
                        .foregroundStyle(BrandPalette.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.82)

                    Text(language.text("Practice the curve, track local matches, and explore the clubs behind the game.", "Kurve trainieren, lokale Matches erfassen und die Clubs hinter dem Spiel entdecken.", "Travailler la courbe, suivre les matchs locaux et decouvrir les clubs qui font vivre le jeu.", "Practicar la curva, registrar partidos locales y descubrir los clubes que sostienen el juego."))
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(BrandPalette.secondaryText)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer(minLength: 0)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(language.text("Language", "Sprache", "Langue", "Idioma"))
                    .font(.caption.weight(.bold))
                    .foregroundStyle(BrandPalette.secondaryText)

                Picker("Language", selection: $languageRawValue) {
                    ForEach(AppLanguage.allCases) { item in
                        Text(item.shortCode).tag(item.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .padding(16)
        .background(BrandPalette.card.opacity(0.72))
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }

    private var hero: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [BrandPalette.cardSoft, BrandPalette.card, BrandPalette.deepRed],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            VStack(alignment: .leading, spacing: 18) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        TagChip(title: Copy.appName(language))
                        Text(language.text("A practical guide for understanding the lane, the stake, and the curved roll that defines krulbollen.", "Ein praxisnaher Einstieg in Bahn, Pflock und die gebogene Rollbewegung, die Krulbollen ausmacht.", "Un guide pratique pour comprendre la piste, le piquet et la trajectoire courbe propre au krulbollen.", "Una guia practica para entender la pista, la estaca y el rodado curvo que define al krulbollen."))
                            .font(.title3.weight(.bold))
                            .foregroundStyle(BrandPalette.white)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    BrandLogoMark()
                        .frame(width: 92, height: 92)
                }

                ZStack {
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(BrandPalette.sand.opacity(0.18))
                        .frame(height: 180)

                    laneOverlay
                }
            }
            .padding(20)
        }
        .frame(height: 340)
    }

    private var laneOverlay: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height

            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(BrandPalette.white.opacity(0.15), lineWidth: 1)

                Path { path in
                    path.move(to: CGPoint(x: width * 0.15, y: height * 0.8))
                    path.addQuadCurve(
                        to: CGPoint(x: width * 0.72, y: height * 0.22),
                        control: CGPoint(x: width * 0.52, y: height * 0.68)
                    )
                }
                .stroke(BrandPalette.gold, style: StrokeStyle(lineWidth: 6, lineCap: .round))

                Circle()
                    .fill(BrandPalette.white)
                    .frame(width: 22, height: 22)
                    .position(x: width * 0.18, y: height * 0.8)

                ForEach([62.0, 34.0, 12.0], id: \.self) { size in
                    Circle()
                        .stroke(BrandPalette.white.opacity(size == 12 ? 0.95 : 0.32), lineWidth: size == 12 ? 3 : 1.5)
                        .frame(width: size, height: size)
                        .position(x: width * 0.72, y: height * 0.22)
                }
            }
        }
        .padding(14)
    }

    private func guideCard(_ card: GuideCard) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: card.systemImage)
                    .font(.headline)
                    .foregroundStyle(BrandPalette.background)
                    .frame(width: 38, height: 38)
                    .background(BrandPalette.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

                VStack(alignment: .leading, spacing: 4) {
                    Text(card.tag.uppercased())
                        .font(.caption2.weight(.black))
                        .foregroundStyle(BrandPalette.gold)
                    Text(card.title)
                        .font(.headline)
                        .foregroundStyle(BrandPalette.white)
                }
            }

            Text(card.detail)
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

    private func factCard(_ fact: QuickFact) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(fact.value)
                .font(.system(size: 32, weight: .black, design: .rounded))
                .foregroundStyle(BrandPalette.white)
            Text(fact.title)
                .font(.headline)
                .foregroundStyle(BrandPalette.gold)
            Text(fact.detail)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func ruleCard(_ rule: RuleCard) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: rule.systemImage)
                .font(.headline)
                .foregroundStyle(BrandPalette.background)
                .frame(width: 40, height: 40)
                .background(BrandPalette.gold)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                Text(rule.title)
                    .font(.headline)
                    .foregroundStyle(BrandPalette.white)
                Text(rule.detail)
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
}
