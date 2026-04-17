import SwiftUI

struct HomeView: View {
    @AppStorage("app.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 26) {
                    brandIntro
                    hero

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        StatPill(value: "6", label: language == .portugueseBrazil ? "regras" : "rule cards")
                        StatPill(value: "36", label: language == .portugueseBrazil ? "min treino" : "training min")
                        StatPill(value: "0", label: language == .portugueseBrazil ? "contas" : "accounts")
                        StatPill(value: "100%", label: "offline")
                    }

                    SectionTitle(
                        title: language == .portugueseBrazil ? "Começo Rápido" : "Quick Start",
                        detail: language == .portugueseBrazil ? "O essencial para montar uma primeira quadra sem improvisar." : "The essentials for setting up a first court without improvising."
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.topics(for: language)) { topic in
                            infoTopicRow(topic)
                        }
                    }

                    SectionTitle(
                        title: language == .portugueseBrazil ? "Regras Rápidas" : "Fast Rules",
                        detail: language == .portugueseBrazil ? "Um guia prático para jogar mantendo claro o espírito comunitário." : "A practical guide for playing while keeping the community spirit clear."
                    )

                    VStack(spacing: 12) {
                        ForEach(AppData.rules(for: language)) { rule in
                            ruleRow(rule)
                        }
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .scrollIndicators(.hidden)
            .background(BrandPalette.navy.ignoresSafeArea())
            .navigationTitle(Copy.homeTab(language))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var brandIntro: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("ULAMA NACIONAL")
                .font(.caption.weight(.black))
                .foregroundStyle(BrandPalette.yellow)
            Text(language == .portugueseBrazil ? "Placar, treino e guia para uma quadra pequena." : "Scoreboard, training, and guide for a small court.")
                .font(.largeTitle.weight(.black))
                .foregroundStyle(BrandPalette.white)
                .lineLimit(3)
                .minimumScaleFactor(0.75)
            Text(language == .portugueseBrazil ? "Feito para clubes, escolas e demonstrações que precisam explicar o jogo e começar rápido." : "Built for clubs, schools, and showcases that need to explain the game and start quickly.")
                .font(.body)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var hero: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomLeading) {
                Image("Field")
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipped()

                LinearGradient(colors: [BrandPalette.navy.opacity(0.55), .clear], startPoint: .bottom, endPoint: .top)

                HStack(spacing: 8) {
                    Image(systemName: "sportscourt")
                    Text(language == .portugueseBrazil ? "Quadra, bola e zona de jogo" : "Court, ball, and play zone")
                }
                .font(.caption.weight(.bold))
                .foregroundStyle(BrandPalette.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(BrandPalette.navy.opacity(0.78))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(12)
            }
        }
        .frame(height: 210)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .accessibilityLabel(language == .portugueseBrazil ? "Quadra de ulama" : "Ulama court")
    }

    private func infoTopicRow(_ topic: InfoTopic) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: topic.systemImage)
                    .font(.headline)
                    .foregroundStyle(BrandPalette.navy)
                    .frame(width: 34, height: 34)
                    .background(BrandPalette.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                VStack(alignment: .leading, spacing: 2) {
                    Text(topic.tag.uppercased())
                        .font(.caption2.weight(.black))
                        .foregroundStyle(BrandPalette.yellow)
                    Text(topic.title)
                        .font(.headline)
                        .foregroundStyle(BrandPalette.white)
                }
            }

            Text(topic.detail)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(BrandPalette.card)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }

    private func ruleRow(_ rule: RuleCard) -> some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: rule.systemImage)
                .font(.title3.weight(.semibold))
                .foregroundStyle(BrandPalette.navy)
                .frame(width: 42, height: 42)
                .background(BrandPalette.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

            VStack(alignment: .leading, spacing: 5) {
                Text(rule.title)
                    .font(.headline)
                    .foregroundStyle(BrandPalette.white)
                Text(rule.detail)
                    .font(.subheadline)
                    .foregroundStyle(BrandPalette.secondaryText)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 0)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(BrandPalette.card)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
