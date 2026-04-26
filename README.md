# B Clic Krul

B Clic Krul is a SwiftUI iOS app built around `krulbollen`, a Belgian folk sport from Flanders. The product combines a native practice mode, local match tools, club references, and heritage content in a release-ready mobile experience.

## Product

- Home tab with a strong brand intro, fast rules, and practical entry points into the sport.
- Play tab with a curved-shot practice mode focused on the signature krulbollen gesture.
- Match tab with editable club names, target score, lead marker, undo, save, reset, and local history.
- Club tab with short drills, equipment guidance, and etiquette prompts for heritage-friendly hosting.
- Heritage tab with context notes, history timeline, glossary, Belgian region references, quiz, and local privacy control.
- Native persistence for local progress and saved match data.
- Remote launch configuration that can open either the native experience or a remote web destination depending on server response.

## Technical Notes

- Platform: iOS 16.6+
- Framework: SwiftUI
- Persistence: UserDefaults via Codable models
- Network: launch check against `https://crownapp.fit/api/v1/check`, then either native flow or remote web flow
- External dependencies: none
- Bundle ID: `com.sports.bclic.krul`
- Version: `1.0 (1)`

## Release Checklist

1. Push the repository to GitHub.
2. Connect the repository in Codemagic.
3. Add App Store Connect integration in Codemagic.
4. Configure code signing in Codemagic for `com.sports.bclic.krul`.
5. Run the `ios-release` workflow to build and sign the IPA.
6. Submit the build to TestFlight from Codemagic.

## Suggested App Store Metadata

Name: B Clic Krul

Subtitle: Belgian curve-shot folk sport

Keywords: krulbollen, belgium, flanders, folk sport, scoreboard, heritage, club, quiz, target game, sports

Category: Sports

Privacy: The app stores match history and practice progress locally on device. A launch request is sent to the configured server to determine whether the app opens native content or a remote destination.
