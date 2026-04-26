import SwiftUI

@main
struct BClicKrulApp: App {
    @AppStorage("bclic.krul.language") private var languageRawValue = AppLanguage.english.rawValue

    var body: some Scene {
        WindowGroup {
            KrulLaunchGateView(
                config: .bClicKrul,
                languageCode: AppLanguage.from(languageRawValue).rawValue,
                requestReviewBeforeCheck: false
            ) {
                ContentView()
            }
        }
    }
}
