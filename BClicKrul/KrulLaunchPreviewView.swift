import SwiftUI

public struct KrulLaunchPreviewView: View {
    public let config: KrulLaunchConfiguration
    public let languageCode: String
    @State private var isChecking = false
    @State private var statusMessage: String?
    @State private var activeExperience: KrulActiveSurface?

    private var language: AppLanguage {
        AppLanguage.from(languageCode)
    }

    public init(config: KrulLaunchConfiguration, languageCode: String = Locale.current.identifier) {
        self.config = config
        self.languageCode = languageCode
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(Copy.analyticsLauncherTitle(language), systemImage: "chart.line.uptrend.xyaxis")
                .font(.headline)
                .foregroundStyle(KrulLaunchStyle.accent)

            Text(Copy.analyticsLauncherDetail(language))
                .font(.subheadline)
                .foregroundStyle(KrulLaunchStyle.secondaryText)
                .fixedSize(horizontal: false, vertical: true)

            Button {
                Task { await checkAndOpen() }
            } label: {
                HStack {
                    if isChecking {
                        ProgressView()
                            .tint(KrulLaunchStyle.navy)
                    }
                    Text(isChecking ? Copy.analyticsLauncherChecking(language) : Copy.analyticsLauncherAction(language))
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(KrulLaunchStyle.accent)
            .foregroundStyle(KrulLaunchStyle.navy)
            .disabled(isChecking)

            if let statusMessage {
                Text(statusMessage)
                    .font(.footnote)
                    .foregroundStyle(KrulLaunchStyle.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(KrulLaunchStyle.card)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .fullScreenCover(item: $activeExperience) { item in
            NavigationStack {
                KrulWebSurfaceView(config: item.config)
            }
        }
    }

    @MainActor
    private func checkAndOpen() async {
        isChecking = true
        statusMessage = nil
        defer { isChecking = false }

        do {
            let client = KrulLaunchClient(config: config)
            let response = try await client.checkAccess(languageCode: languageCode)

            guard response.enabled else {
                statusMessage = Copy.analyticsLocalContinue(language)
                return
            }

            guard let url = response.url else {
                statusMessage = Copy.analyticsMissingURL(language)
                return
            }

            activeExperience = KrulActiveSurface(config: config.withResolvedURL(url))
        } catch {
            statusMessage = error.localizedDescription
        }
    }
}

public struct KrulActiveSurface: Identifiable {
    public let id = UUID()
    public let config: KrulLaunchConfiguration

    public init(config: KrulLaunchConfiguration) {
        self.config = config
    }
}
