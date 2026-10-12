import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                HeroHeaderView(title: "山中好長日",
                               subtitle: "原神 · 空之神殿 · 文化原型",
                               symbol: "mountain.2.fill")

                intro

                SectionHeader(title: "六個文化原型", symbol: "books.vertical.fill")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(Archetype.all) { item in
                            ArchetypeCard(archetype: item)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }

                QuoteBlock(text: "精彩到讓人願意失憶了，也想再看一次的小說。",
                           source: "采特林德")

                SectionHeader(title: "他們是誰", symbol: "person.2.fill")
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(CharacterProfile.all) { person in
                        CharacterRow(profile: person)
                    }
                }

                footer
            }
            .padding(.bottom, 40)
        }
        .ignoresSafeArea(edges: .top)
    }

    private var intro: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("一場雙向的拯救")
                .font(.naikai(22, relativeTo: .title2))
            Text("空之神殿的規則是「保存」而非「進化」，人們像標本般停在被選中的瞬間。旅行者與采特林德一路遇見歷史上的大人物，發現他們首先是真實的人，也用各自的方式教她：意義不必由外界給定。")
                .font(.naikai(16))
                .lineSpacing(6)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
    }

    private var footer: some View {
        VStack(spacing: 8) {
            Text("了解更多：[原神官方網站](https://genshin.hoyoverse.com)")
                .font(.naikai(15, relativeTo: .subheadline))
            Text("本頁為個人學習作業，非官方作品")
                .font(.naikai(12, relativeTo: .caption))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview("Light") {
    ContentView()
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}
