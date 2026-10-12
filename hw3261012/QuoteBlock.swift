import SwiftUI

struct QuoteBlock: View {
    let text: String
    let source: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "quote.opening")
                .font(.title)
                .foregroundStyle(.indigo)
            Text(text)
                .font(.naikai(20, relativeTo: .title3))
                .multilineTextAlignment(.center)
                .lineSpacing(6)
            Text("— \(source)")
                .font(.naikai(13, relativeTo: .footnote))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(Color.indigo.opacity(0.10), in: RoundedRectangle(cornerRadius: 24))
        .padding(.horizontal)
    }
}

#Preview {
    QuoteBlock(text: "精彩到讓人願意失憶了，也想再看一次的小說。", source: "采特林德")
}
