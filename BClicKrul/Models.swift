import Foundation
import SwiftUI

struct QuickFact: Identifiable {
    var id: String { title }
    let value: String
    let title: String
    let detail: String
}

struct GuideCard: Identifiable {
    var id: String { title }
    let title: String
    let detail: String
    let tag: String
    let systemImage: String
}

struct RuleCard: Identifiable {
    var id: String { title }
    let title: String
    let detail: String
    let systemImage: String
}

struct Drill: Identifiable {
    var id: String { title }
    let title: String
    let duration: String
    let focus: String
    let steps: [String]
    let color: Color
}

struct GearItem: Identifiable {
    var id: String { title }
    let title: String
    let detail: String
    let systemImage: String
}

struct EtiquetteTip: Identifiable {
    var id: String { title }
    let title: String
    let detail: String
}

struct HeritageStory: Identifiable {
    var id: String { "\(period)-\(title)" }
    let period: String
    let title: String
    let detail: String
    let systemImage: String
}

struct CultureNote: Identifiable {
    var id: String { title }
    let title: String
    let detail: String
    let tag: String
}

struct GlossaryTerm: Identifiable {
    var id: String { term }
    let term: String
    let meaning: String
}

struct RegionSpot: Identifiable {
    var id: String { area }
    let area: String
    let vibe: String
    let detail: String
    let tag: String
}

struct QuizQuestion: Identifiable {
    var id: String { prompt }
    let prompt: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}

struct ClubProfile: Identifiable {
    let id: String
    let name: String
    let founding: String
    let city: String
    let address: String
    let contact: String
    let accommodation: String
    let schedule: String
    let history: String
    let badgeTitle: String
    let sourceLabel: String
}

struct FederationSchedule: Identifiable {
    var id: String { title }
    let title: String
    let detail: String
    let emphasis: String
}

struct GameLevel: Identifiable, Codable, Equatable {
    let id: Int
    let title: String
    let subtitle: String
    let shots: Int
    let targetScore: Int
    let curveBias: Double
    let powerTightness: Double
    let obstacleMode: ObstacleMode
}

enum ObstacleMode: String, Codable, Equatable {
    case none
    case blocker
    case narrowGate
    case doublePressure
}

struct MatchLog: Identifiable, Codable, Equatable {
    let id: UUID
    let date: Date
    let homeName: String
    let awayName: String
    let homeScore: Int
    let awayScore: Int
    let targetScore: Int

    var summary: String {
        "\(homeScore)-\(awayScore)"
    }
}

struct ScoreState: Codable, Equatable {
    var homeName = "Red Side"
    var awayName = "White Side"
    var homeScore = 0
    var awayScore = 0
    var ends = 0
    var targetScore = 11
    var servingHome = true
    var pointHistory: [Bool] = []
}
