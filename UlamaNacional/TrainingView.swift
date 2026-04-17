import SwiftUI

struct TrainingView: View {
    @State private var completed: Set<String> = []
    @AppStorage("app.language") private var languageRawValue = AppLanguage.english.rawValue

    private var language: AppLanguage {
        AppLanguage.from(languageRawValue)
    }

    private var drills: [Drill] {
        AppData.drills(for: language)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    NacionalHeader(
                        eyebrow: language == .portugueseBrazil ? "Plano de clube" : "Club plan",
                        title: language == .portugueseBrazil ? "Uma sessão curta para aprender o ritmo." : "A short session for learning the rhythm.",
                        subtitle: language == .portugueseBrazil ? "Exercícios para pátios, ginásios pequenos e grupos que estão começando." : "Drills for patios, small gyms, and groups that are just getting started."
                    )

                    progress

                    VStack(spacing: 12) {
                        ForEach(drills) { drill in
                            drillCard(drill)
                        }
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(BrandPalette.navy.ignoresSafeArea())
            .navigationTitle(Copy.trainingTab(language))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var progress: some View {
        let ratio = Double(completed.count) / Double(drills.count)

        return VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(language == .portugueseBrazil ? "Progresso de Hoje" : "Today Progress")
                    .font(.headline)
                    .foregroundStyle(BrandPalette.white)
                Spacer()
                Text("\(completed.count)/\(drills.count)")
                    .font(.headline.monospacedDigit())
                    .foregroundStyle(BrandPalette.yellow)
            }

            ProgressView(value: ratio)
                .tint(BrandPalette.yellow)

            Text(ratio == 1 ? (language == .portugueseBrazil ? "Sessão completa." : "Session complete.") : (language == .portugueseBrazil ? "Marque cada bloco quando o grupo terminar." : "Mark each block when the group finishes."))
                .font(.footnote)
                .foregroundStyle(BrandPalette.secondaryText)
        }
        .padding(16)
        .background(BrandPalette.card)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }

    private func drillCard(_ drill: Drill) -> some View {
        let isDone = completed.contains(drill.id)

        return VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(drill.title)
                        .font(.title3.weight(.bold))
                        .foregroundStyle(BrandPalette.white)
                    Text("\(drill.duration) · \(drill.focus)")
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(BrandPalette.secondaryText)
                }

                Spacer()

                Button {
                    if isDone {
                        completed.remove(drill.id)
                    } else {
                        completed.insert(drill.id)
                    }
                } label: {
                    Image(systemName: isDone ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundStyle(isDone ? BrandPalette.yellow : BrandPalette.secondaryText)
                }
                .buttonStyle(.plain)
                .accessibilityLabel(isDone ? (language == .portugueseBrazil ? "Marcar incompleto" : "Mark incomplete") : (language == .portugueseBrazil ? "Marcar completo" : "Mark complete"))
            }

            VStack(alignment: .leading, spacing: 8) {
                ForEach(Array(drill.steps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top, spacing: 10) {
                        Text("\(index + 1)")
                            .font(.caption.weight(.black))
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                            .background(drill.color)
                            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                        Text(step)
                            .font(.subheadline)
                            .foregroundStyle(BrandPalette.white)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding(16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(drill.color.opacity(0.28), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
