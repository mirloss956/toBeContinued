import SwiftUI

struct CharacterRow: View {
    let profile: CharacterProfile

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: profile.symbol)
                .font(.title2)
                .foregroundStyle(.indigo)
                .frame(width: 52, height: 52)
                .background(Color.indigo.opacity(0.12), in: RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 4) {
                Text(profile.name)
                    .font(.naikai(18, relativeTo: .headline))
                Text("→ \(profile.prototype)")
                    .font(.naikai(15, relativeTo: .subheadline))
                    .foregroundStyle(.indigo)
                Text(profile.note)
                    .font(.naikai(15, relativeTo: .subheadline))
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(CharacterProfile.all) { person in
            CharacterRow(profile: person)
        }
    }
}
