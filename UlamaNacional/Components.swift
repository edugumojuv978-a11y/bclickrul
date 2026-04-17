import SwiftUI

struct NacionalHeader: View {
    let eyebrow: String
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(eyebrow.uppercased())
                .font(.caption.weight(.bold))
                .foregroundStyle(BrandPalette.yellow)
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

struct StatPill: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title2.weight(.black))
                .foregroundStyle(BrandPalette.white)
            Text(label)
                .font(.caption.weight(.semibold))
                .foregroundStyle(BrandPalette.secondaryText)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(BrandPalette.card)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct SectionTitle: View {
    let title: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title3.weight(.bold))
                .foregroundStyle(BrandPalette.white)
            Text(detail)
                .font(.subheadline)
                .foregroundStyle(BrandPalette.secondaryText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
