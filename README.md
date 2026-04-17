# Ulama Nacional

Ulama Nacional is a SwiftUI iOS app for small clubs, schools, and culture-focused sport groups that want a practical companion for ulama, a niche Mesoamerican ball game still played in community contexts.

## Product

- Offline scoreboard with editable team names, rally count, undo, reset, and saved match history.
- Match setup with target score, current server, match status, and referee notes.
- Quick rule guide for first-time players.
- First-play guide with format, equipment, onboarding, and glossary cards.
- Short training plan for beginner groups.
- Editorial "Nacional" section with history, cultural notes, glossary, quiz, venue ideas, and privacy controls.
- In-app language switch for English and Portuguese (Brazil).
- Dedicated custom Score tab icon.
- Custom AppIcon, accent color, and in-app raster artwork.
- Brand palette based on deep navy, sport yellow, and white.

## Technical Notes

- Platform: iOS 17+
- Framework: SwiftUI
- Persistence: UserDefaults via Codable models
- Network: none
- Account system: none
- External dependencies: none

## Release Checklist

1. Open `UlamaNacional.xcodeproj` in Xcode.
2. Set the Bundle Identifier to your App Store Connect identifier.
3. Select your Apple Developer Team under Signing & Capabilities.
4. Archive with a generic iOS device destination.
5. Upload through Xcode Organizer.

## Suggested App Store Metadata

Name: Ulama Nacional

Subtitle: Score, history, and ulama quiz

Keywords: ulama, sport, scoreboard, mexico, training, history, quiz, latin america, club

Category: Sports

Privacy: The app does not collect personal data. Match history is stored locally on device.
