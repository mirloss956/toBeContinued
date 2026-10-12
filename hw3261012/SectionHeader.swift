import SwiftUI

struct SectionHeader: View {
    let title: String
    let symbol: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: symbol)
                .foregroundStyle(.indigo)
            Text(title)
                .font(.naikai(22, relativeTo: .title2))
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SectionHeader(title: "六個文化原型", symbol: "books.vertical.fill")
}
