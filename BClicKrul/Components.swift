import SwiftUI

struct BrandHeader: View {
    let eyebrow: String
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(eyebrow.uppercased())
                .font(.caption.weight(.black))
                .foregroundStyle(BrandPalette.gold)
            Text(title)
                .font(.largeTitle.weight(.black))
                .foregroundStyle(BrandPalette.white)
                .lineLimit(3)
                .minimumScaleFactor(0.76)
            Text(subtitle)
                .font(.body)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BrandLogoMark: View {
    var body: some View {
        Image("BrandMark")
            .resizable()
            .interpolation(.high)
            .antialiased(true)
            .scaledToFit()
    }
}

struct ClubBadge: View {
    let title: String
    let color: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(color)
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.white.opacity(0.18), lineWidth: 1)
            Text(title)
                .font(.headline.weight(.black))
                .foregroundStyle(BrandPalette.background)
        }
        .frame(width: 58, height: 58)
    }
}

struct SectionTitle: View {
    let title: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.title3.weight(.bold))
                .foregroundStyle(BrandPalette.white)
            Text(detail)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.secondaryText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct StatPill: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 6) {
            Text(value)
                .font(.title2.weight(.black))
                .foregroundStyle(BrandPalette.white)
            Text(label)
                .font(.caption.weight(.semibold))
                .foregroundStyle(BrandPalette.secondaryText)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct TagChip: View {
    let title: String

    var body: some View {
        Text(title.uppercased())
            .font(.caption2.weight(.black))
            .foregroundStyle(BrandPalette.background)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(BrandPalette.gold)
            .clipShape(Capsule())
    }
}

struct EmptyStateCard: View {
    let title: String
    let systemImage: String
    let detail: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: systemImage)
                .font(.title)
                .foregroundStyle(BrandPalette.gold)
            Text(title)
                .font(.headline)
                .foregroundStyle(BrandPalette.white)
                .multilineTextAlignment(.center)
            Text(detail)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.secondaryText)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(BrandPalette.card)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(BrandPalette.line, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

struct WhiteCTAButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(BrandPalette.white.opacity(configuration.isPressed ? 0.86 : 1))
            .foregroundStyle(BrandPalette.background)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.985 : 1)
            .animation(.easeOut(duration: 0.16), value: configuration.isPressed)
    }
}
