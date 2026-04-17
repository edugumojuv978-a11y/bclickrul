import SwiftUI

struct ContentView: View {
    @StateObject private var matchStore = MatchStore()
    @AppStorage("app.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(Copy.homeTab(language), systemImage: "sportscourt")
                }

            MatchCenterView()
                .environmentObject(matchStore)
                .tabItem {
                    Label {
                        Text(Copy.scoreTab(language))
                    } icon: {
                        Image("ScoreTabIcon")
                    }
                }

            TrainingView()
                .tabItem {
                    Label(Copy.trainingTab(language), systemImage: "figure.strengthtraining.traditional")
                }

            CultureView()
                .environmentObject(matchStore)
                .tabItem {
                    Label(Copy.nationalTab(language), systemImage: "flag")
                }
        }
        .tint(BrandPalette.yellow)
        .preferredColorScheme(.dark)
    }
}
