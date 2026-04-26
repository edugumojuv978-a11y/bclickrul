import SwiftUI

struct ContentView: View {
    @StateObject private var matchStore = MatchStore()
    @State private var selectedTab = AppTab.home
    @AppStorage("bclic.krul.onboarding.complete") private var onboardingCompleted = false
    @AppStorage("bclic.krul.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    var body: some View {
        Group {
            if onboardingCompleted {
                mainTabs
            } else {
                OnboardingView {
                    onboardingCompleted = true
                }
            }
        }
        .preferredColorScheme(.dark)
    }

    private var mainTabs: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(AppTab.home)
                .tabItem {
                    Label(Copy.homeTab(language), systemImage: "house")
                }

            GameView()
                .tag(AppTab.play)
                .tabItem {
                    Label(Copy.playTab(language), systemImage: "scope")
                }

            MatchCenterView()
                .environmentObject(matchStore)
                .tag(AppTab.match)
                .tabItem {
                    Label(Copy.scoreTab(language), systemImage: "list.number")
                }

            TrainingView()
                .tag(AppTab.club)
                .tabItem {
                    Label(Copy.clubsTab(language), systemImage: "person.3")
                }

            CultureView()
                .environmentObject(matchStore)
                .tag(AppTab.heritage)
                .tabItem {
                    Label(Copy.heritageTab(language), systemImage: "building.columns")
                }
        }
        .tint(BrandPalette.gold)
    }
}

enum AppTab: String {
    case home
    case play
    case match
    case club
    case heritage
}
