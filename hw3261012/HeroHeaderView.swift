import SwiftUI

struct HeroHeaderView: View {
    let title: String
    let subtitle: String
    let symbol: String

    var body: some View {
        Color.clear
            .frame(maxWidth: .infinity)
            .frame(height: 320)
            .overlay {
                Image("hero")
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
            .overlay {
                // 遮罩：讓白色文字在任何圖上都讀得清楚
                LinearGradient(
                    colors: [.clear, .black.opacity(0.75)],
                    startPoint: .center,
                    endPoint: .bottom
                )
            }
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.naikai(13, relativeTo: .footnote))
                        .tracking(4)
                        .opacity(0.8)
                    Text(title)
                        .font(.naikai(40, relativeTo: .largeTitle))
                }
                .foregroundStyle(.white)
                .padding(24)
            }
    }
}

#Preview {
    HeroHeaderView(title: "深中好長日", subtitle: "原神 · 空之神殿", symbol: "mountain.2.fill")
}
