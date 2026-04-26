import SwiftUI

struct OnboardingView: View {
    let onFinish: () -> Void

    @State private var selection = 0
    @AppStorage("bclic.krul.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    private var pages: [(String, String, String)] {
        [
            ("sparkles",
             language.text("Start with the basics of the game.", "Mit den Grundlagen des Spiels beginnen.", "Commencer par les bases du jeu.", "Empezar por lo esencial del juego."),
             language.text("B Clic Krul introduces krulbollen through clear rules, practical terminology, and a visual explanation of the curved roll toward the stake.", "B Clic Krul fuhrt mit klaren Regeln, praktischer Begrifflichkeit und einer visuellen Erklarung der gekrummten Rollbewegung zum Pflock in das Spiel ein.", "B Clic Krul presente le krulbollen a travers des regles claires, un vocabulaire utile et une explication visuelle du roulement courbe vers le piquet.", "B Clic Krul presenta el krulbollen con reglas claras, vocabulario util y una explicacion visual del rodado curvo hacia la estaca.")),
            ("scope",
             language.text("Use the practice lanes to build control.", "Mit den Trainingsbahnen Kontrolle aufbauen.", "Utiliser les pistes d'entrainement pour gagner en controle.", "Usar las pistas de practica para ganar control."),
             language.text("The Play tab lets you work on release, pace, and finishing position across six lanes with different targets and obstacles.", "Im Spiel-Tab lassen sich Abgabe, Tempo und Endlage auf sechs Bahnen mit unterschiedlichen Zielen und Hindernissen trainieren.", "L'onglet Jeu permet de travailler la sortie, la vitesse et la position finale sur six pistes avec objectifs et obstacles differents.", "La pestana Juego permite trabajar salida, ritmo y posicion final en seis pistas con distintos objetivos y obstaculos.")),
            ("building.columns",
             language.text("Track matches and explore the wider scene.", "Matches verwalten und den weiteren Kontext entdecken.", "Suivre les matchs et explorer l'ensemble de la scene.", "Registrar partidos y explorar el contexto del juego."),
             language.text("The app also includes a simple match board, club profiles, seasonal context, and heritage notes for presentations, visits, and club evenings.", "Die App bietet zudem ein einfaches Matchboard, Clubprofile, Saisonkontext und Hintergrundnotizen fur Vorfuhrungen, Besuche und Clubabende.", "L'app comprend aussi un tableau de match simple, des profils de clubs, un contexte saisonnier et des notes patrimoniales pour presentations, visites et soirees de club.", "La app tambien incluye un marcador simple, perfiles de clubes, contexto estacional y notas patrimoniales para presentaciones, visitas y noches de club."))
        ]
    }

    var body: some View {
        VStack(spacing: 18) {
            header

            TabView(selection: $selection) {
                ForEach(pages.indices, id: \.self) { index in
                    pageView(pages[index], index: index)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))

            controls
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BrandPalette.background.ignoresSafeArea())
        .preferredColorScheme(.dark)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(Copy.appName(language).uppercased())
                    .font(.caption.weight(.black))
                    .foregroundStyle(BrandPalette.gold)
                Spacer()
                Picker("Language", selection: $languageRawValue) {
                    ForEach(AppLanguage.allCases) { item in
                        Text(item.shortCode).tag(item.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 180)
            }

            Text(language.text("First steps", "Erste Schritte", "Premiers pas", "Primeros pasos"))
                .font(.title.weight(.black))
                .foregroundStyle(BrandPalette.white)
            Text(language.text("Choose your language, then use the app as a guide, practice tool, and match companion.", "Sprache wahlen und die App dann als Leitfaden, Trainingshilfe und Match-Begleiter nutzen.", "Choisissez la langue, puis utilisez l'app comme guide, outil d'entrainement et compagnon de match.", "Elige tu idioma y usa la app como guia, herramienta de practica y apoyo para partidos."))
                .font(.body)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func pageView(_ page: (String, String, String), index: Int) -> some View {
        VStack(spacing: 20) {
            visual(index: index)

            VStack(alignment: .leading, spacing: 12) {
                Label {
                    Text(page.1)
                        .font(.title2.weight(.black))
                        .foregroundStyle(BrandPalette.white)
                        .fixedSize(horizontal: false, vertical: true)
                } icon: {
                    Image(systemName: page.0)
                        .font(.headline)
                        .foregroundStyle(BrandPalette.background)
                        .frame(width: 34, height: 34)
                        .background(BrandPalette.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }

                Text(page.2)
                    .font(.body)
                    .foregroundStyle(BrandPalette.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(BrandPalette.card)
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(BrandPalette.line, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

            Spacer(minLength: 0)
        }
        .padding(.top, 8)
        .padding(.bottom, 36)
    }

    @ViewBuilder
    private func visual(index: Int) -> some View {
        VStack(spacing: 14) {
            BrandLogoMark()
                .frame(width: 108, height: 108)

            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(BrandPalette.deepRed)
                .frame(height: 150)
                .overlay {
                    if index == 1 {
                        Text(language.text("Practice lanes and score targets", "Trainingsbahnen und Zielwerte", "Pistes d'entrainement et scores cibles", "Pistas de practica y objetivos"))
                            .font(.headline.weight(.bold))
                            .foregroundStyle(BrandPalette.white)
                    } else if index == 2 {
                        Text(language.text("Club profiles and heritage notes", "Clubprofile und Hintergrundnotizen", "Profils de clubs et notes patrimoniales", "Perfiles de clubes y notas patrimoniales"))
                            .font(.headline.weight(.bold))
                            .foregroundStyle(BrandPalette.white)
                    } else {
                        Text(language.text("Rules, terms, and first steps", "Regeln, Begriffe und erste Schritte", "Regles, vocabulaire et premiers pas", "Reglas, terminos y primeros pasos"))
                            .font(.headline.weight(.bold))
                            .foregroundStyle(BrandPalette.white)
                    }
                }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .frame(height: 240)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }

    private var controls: some View {
        VStack(spacing: 12) {
            Button {
                if selection < pages.count - 1 {
                    withAnimation(.easeInOut) {
                        selection += 1
                    }
                } else {
                    onFinish()
                }
            } label: {
                Text(selection == pages.count - 1 ? language.text("Start app", "App starten", "Lancer l'app", "Entrar a la app") : language.text("Continue", "Weiter", "Continuer", "Continuar"))
            }
            .buttonStyle(WhiteCTAButtonStyle())

            Button(language.text("Skip intro", "Intro uberspringen", "Passer l'intro", "Omitir intro")) {
                onFinish()
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(BrandPalette.secondaryText)
        }
    }
}
