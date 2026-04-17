import Foundation

enum AppLanguage: String, CaseIterable, Identifiable {
    case english = "en"
    case portugueseBrazil = "pt-BR"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .english: return "English"
        case .portugueseBrazil: return "Português (Brasil)"
        }
    }

    static func from(_ rawValue: String) -> AppLanguage {
        AppLanguage(rawValue: rawValue) ?? .english
    }
}

enum Copy {
    static func homeTab(_ language: AppLanguage) -> String { language == .portugueseBrazil ? "Início" : "Home" }
    static func scoreTab(_ language: AppLanguage) -> String { language == .portugueseBrazil ? "Placar" : "Score" }
    static func trainingTab(_ language: AppLanguage) -> String { language == .portugueseBrazil ? "Treino" : "Training" }
    static func nationalTab(_ language: AppLanguage) -> String { language == .portugueseBrazil ? "Nacional" : "National" }

    static func winnerPrefix(_ language: AppLanguage) -> String { language == .portugueseBrazil ? "Vencedor" : "Winner" }
    static func tie(_ language: AppLanguage) -> String { language == .portugueseBrazil ? "Empate" : "Tie" }
}
