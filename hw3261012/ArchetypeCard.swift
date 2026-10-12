import SwiftUI

struct ArchetypeCard: View {
    let archetype: Archetype

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: archetype.symbol)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(archetype.kind.color.gradient, in: Circle())
                Spacer()
                Text(archetype.kind.rawValue)
                    .font(.naikai(12, relativeTo: .caption))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(archetype.kind.color.opacity(0.15), in: Capsule())
                    .foregroundStyle(archetype.kind.color)
            }

            Text(archetype.name)
                .font(.naikai(18, relativeTo: .headline))
            Text(archetype.source)
                .font(.naikai(12, relativeTo: .caption))
                .foregroundStyle(.secondary)
            Text(archetype.summary)
                .font(.naikai(15, relativeTo: .subheadline))
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 0)
        }
        .padding(16)
        .frame(width: 270, height: 260, alignment: .topLeading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
    }
}

#Preview {
    ArchetypeCard(archetype: Archetype.all[0])
}
