import Foundation

enum AppLanguage: String, CaseIterable, Identifiable {
    case english = "en"
    case german = "de"
    case french = "fr"
    case spanish = "es"

    var id: String { rawValue }

    var shortCode: String {
        switch self {
        case .english: return "EN"
        case .german: return "DE"
        case .french: return "FR"
        case .spanish: return "ES"
        }
    }

    var displayName: String {
        switch self {
        case .english: return "English"
        case .german: return "Deutsch"
        case .french: return "Francais"
        case .spanish: return "Espanol"
        }
    }

    func text(_ en: String, _ de: String, _ fr: String, _ es: String) -> String {
        switch self {
        case .english: return en
        case .german: return de
        case .french: return fr
        case .spanish: return es
        }
    }

    static func from(_ rawValue: String) -> AppLanguage {
        AppLanguage(rawValue: rawValue) ?? .english
    }
}

enum Copy {
    static func appName(_ language: AppLanguage) -> String {
        language.text("B Clic Krul", "B Clic Krul", "B Clic Krul", "B Clic Krul")
    }

    static func homeTab(_ language: AppLanguage) -> String {
        language.text("Home", "Start", "Accueil", "Inicio")
    }

    static func playTab(_ language: AppLanguage) -> String {
        language.text("Play", "Spiel", "Jeu", "Juego")
    }

    static func scoreTab(_ language: AppLanguage) -> String {
        language.text("Match", "Match", "Match", "Partida")
    }

    static func clubsTab(_ language: AppLanguage) -> String {
        language.text("Clubs", "Clubs", "Clubs", "Clubes")
    }

    static func heritageTab(_ language: AppLanguage) -> String {
        language.text("Heritage", "Erbe", "Patrimoine", "Patrimonio")
    }

    static func tie(_ language: AppLanguage) -> String {
        language.text("Tie", "Gleichstand", "Egalite", "Empate")
    }

    static func analyticsConnecting(_ language: AppLanguage) -> String {
        language.text("Connecting", "Verbindung wird hergestellt", "Connexion en cours", "Conectando")
    }

    static func analyticsConnectionIssue(_ language: AppLanguage) -> String {
        language.text("Connection issue", "Verbindungsproblem", "Probleme de connexion", "Problema de conexion")
    }

    static func analyticsReload(_ language: AppLanguage) -> String {
        language.text("Reload", "Neu laden", "Recharger", "Recargar")
    }

    static func analyticsLauncherTitle(_ language: AppLanguage) -> String {
        language.text("Launch Check", "Startprufung", "Verification de lancement", "Verificacion de inicio")
    }

    static func analyticsLauncherDetail(_ language: AppLanguage) -> String {
        language.text(
            "Checks the remote destination and opens it when the server response is enabled.",
            "Pruft das entfernte Ziel und offnet es, wenn die Serverantwort aktiviert ist.",
            "Verifie la destination distante et l'ouvre lorsque la reponse du serveur est activee.",
            "Verifica el destino remoto y lo abre cuando la respuesta del servidor esta habilitada."
        )
    }

    static func analyticsLauncherChecking(_ language: AppLanguage) -> String {
        language.text("Checking...", "Prufung lauft...", "Verification...", "Comprobando...")
    }

    static func analyticsLauncherAction(_ language: AppLanguage) -> String {
        language.text("Check and open", "Prufen und offnen", "Verifier et ouvrir", "Comprobar y abrir")
    }

    static func analyticsLocalContinue(_ language: AppLanguage) -> String {
        language.text(
            "Server check returned disabled. Opening the app locally.",
            "Die Serverprufung war deaktiviert. Die App wird lokal geoffnet.",
            "La verification serveur est desactivee. Ouverture locale de l'application.",
            "La verificacion del servidor devolvio desactivado. Se abre la app localmente."
        )
    }

    static func analyticsMissingURL(_ language: AppLanguage) -> String {
        language.text(
            "Server check returned enabled without a destination URL.",
            "Die Serverprufung war aktiv, aber ohne Ziel-URL.",
            "La verification serveur a renvoye actif sans URL de destination.",
            "La verificacion del servidor devolvio activo sin URL de destino."
        )
    }
}
