import SwiftUI

/// 「山中好長日」專題 About 頁面
///
/// 使用方式：
/// 1. 將此檔案加入 Xcode 的 SwiftUI 專案。
/// 2. 在既有的 `ContentView` 中使用 `AboutView()`。
/// 3. 本頁不依賴圖片 Assets、第三方套件或網路資源。
struct AboutView: View {
    private let background = Color(hex: 0x0B1220)
    private let surface = Color(hex: 0x121D30)
    private let warmGold = Color(hex: 0xE7C88C)
    private let mistBlue = Color(hex: 0xA9C7D8)
    private let rose = Color(hex: 0xD7A7A3)

    var body: some View {
        ZStack {
            background.ignoresSafeArea()

            ScrollView {
                LazyVStack(spacing: 0) {
                    hero
                    overview
                    fullStory
                    fullPoem
                    themeSection
                    analysisSection
                    closingSection
                }
            }
            .scrollIndicators(.hidden)
        }
        .preferredColorScheme(.dark)
    }

    // MARK: - Hero

    private var hero: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [
                    Color(hex: 0x101D31),
                    Color(hex: 0x243C50),
                    Color(hex: 0x8B766C).opacity(0.72),
                    background
                ],
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )

            Circle()
                .fill(warmGold.opacity(0.18))
                .frame(width: 260, height: 260)
                .blur(radius: 2)
                .offset(x: 170, y: -120)

            MountainSilhouette()
                .fill(Color.black.opacity(0.22))
                .frame(height: 240)
                .offset(y: 58)

            VStack(alignment: .leading, spacing: 18) {
                Text("ABOUT · 山中好長日")
                    .font(.caption.weight(.semibold))
                    .tracking(3)
                    .foregroundStyle(warmGold)

                Text("只活一次\n不算數。")
                    .font(.system(size: 52, weight: .bold, design: .serif))
                    .minimumScaleFactor(0.72)
                    .foregroundStyle(.white)
                    .accessibilityAddTraits(.isHeader)

                Text("一場由告別開始，穿越天堂、地獄與審判，最後重新回到生命的哲學旅程。")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.82))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: 590, alignment: .leading)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 9) {
                        TagPill(text: "記憶")
                        TagPill(text: "憂鬱")
                        TagPill(text: "死亡與新生")
                        TagPill(text: "向死而生")
                        TagPill(text: "文學互文")
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 44)
        }
        .frame(minHeight: 610)
        .clipped()
    }

    // MARK: - Overview

    private var overview: some View {
        SectionContainer(kicker: "PROJECT STATEMENT", title: "關於這個頁面") {
            VStack(alignment: .leading, spacing: 18) {
                Text("這不僅僅是一個關於告別的故事，更是一篇探討「死亡、記憶與活著的意義」的哲學寓言。")
                    .font(.system(size: 27, weight: .semibold, design: .serif))
                    .foregroundStyle(.white)
                    .fixedSize(horizontal: false, vertical: true)

                Text("《山中好長日》把托馬斯・曼《魔山》的時間停滯、但丁《神曲》的彼世旅程、埃舍爾的不可能空間、精神分析中的憂鬱與失落，以及中國古典詩歌對山中長日的想像，編織成彩特琳德與勞姆希爾妲的生命敘事。")
                    .bodyStyle()

                HighlightQuote(
                    text: "虛無與憂鬱固然是靈魂的底色，但正因為我們有痛覺、有終點、有不可復現的記憶，我們才真正地活著。",
                    accent: warmGold
                )
            }
        }
    }

    // MARK: - Full Story

    private var fullStory: some View {
        SectionContainer(kicker: "THE STORY", title: "山中好長日｜生命未完待續") {
            VStack(alignment: .leading, spacing: 22) {

                LongformCard(accent: rose) {
                    Text(Content.fullStory)
                        .font(.system(size: 17, weight: .regular, design: .serif))
                        .foregroundStyle(.white.opacity(0.9))
                        .lineSpacing(10)
                        .textSelection(.enabled)
                        .fixedSize(horizontal: false, vertical: true)
                }

                HighlightQuote(
                    text: "治療了自己的憂鬱，還拯救了世界，這太酷了不是嗎？因為，拯救自己就是拯救世界。",
                    accent: rose
                )
            }
        }
    }

    // MARK: - Full Poem

    private var fullPoem: some View {
        SectionContainer(kicker: "HILDA'S POEM", title: "希爾妲的詩") {
            VStack(alignment: .leading, spacing: 20) {
                Text("記憶正在消散，她像溺水的人抓住細碎的浮萍，把城市、風車、麵包店、異國花塢、海底、群山與陣雨逐一排列成詩。這些未必完美的句子，卻因為帶著她的目光，而成為她存在過的證明。")
                    .bodyStyle()

                ZStack(alignment: .topLeading) {
                    LinearGradient(
                        colors: [
                            Color(hex: 0x183146),
                            Color(hex: 0x172438),
                            Color(hex: 0x2A2533)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )

                    VStack(alignment: .leading, spacing: 24) {
                        Image(systemName: "quote.opening")
                            .font(.system(size: 30))
                            .foregroundStyle(mistBlue)

                        Text(Content.hildaPoem)
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundStyle(.white.opacity(0.93))
                            .lineSpacing(13)
                            .textSelection(.enabled)
                            .fixedSize(horizontal: false, vertical: true)

                        HStack {
                            Rectangle()
                                .fill(mistBlue)
                                .frame(width: 44, height: 1)

                            Text("勞姆希爾妲")
                                .font(.caption)
                                .tracking(2)
                                .foregroundStyle(mistBlue)
                        }
                    }
                    .padding(28)
                }
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .overlay {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(mistBlue.opacity(0.22), lineWidth: 1)
                }

                Text("「我明白的，我明白的。這世界其實就是如此美麗啊。」不是對痛苦的否認，而是在痛苦仍然存在時，依然願意承認世界值得觀看、記憶與重新走入。")
                    .bodyStyle()
            }
        }
    }

    // MARK: - Themes

    private var themeSection: some View {
        SectionContainer(kicker: "CORE THEMES", title: "三條相互交會的路") {
            VStack(spacing: 16) {
                ThemeCard(
                    number: "01",
                    title: "記憶與敘事身份",
                    text: "手提箱不只是信物的容器，也是彩特琳德身份認同的錨點。名字、照片、詩句與一朵黃玫瑰的記憶，使一個人不只是被保存的歷史切片，而是仍能被述說、傳遞並重新理解的生命。",
                    accent: warmGold
                )

                ThemeCard(
                    number: "02",
                    title: "憂鬱與審美升華",
                    text: "梅蘭塔試圖以佔有、封存與吞噬抵抗失去；彩特琳德姐妹則透過命名、詩歌、繪畫與旅行，把無法辨認的碎片轉化成可觀看、可承受的符號。藝術不是裝飾，而是主體重新建立自己的方式。",
                    accent: rose
                )

                ThemeCard(
                    number: "03",
                    title: "死亡邊界與創造未來",
                    text: "空之神殿能保存過去，卻無法創造未來。永生若只是不斷重播已完成的記憶，就會成為停滯。正因生命有終點，選擇才有重量；正因不能重來，人才能真正走向尚未發生的明天。",
                    accent: mistBlue
                )
            }
        }
    }

    // MARK: - Analyses

    private var analysisSection: some View {
        SectionContainer(kicker: "READING NOTES", title: "六篇延伸解析") {
            VStack(alignment: .leading, spacing: 14) {
                Text("以下將素材中的六篇解析完整收錄於可展開卡片中。點擊標題即可閱讀；長按文字可選取與複製。")
                    .bodyStyle()

                AnalysisDisclosure(
                    index: "01",
                    title: "以《神曲》為骨：死亡、記憶與活著的意義",
                    subtitle: "神曲、埃舍爾、東西方美學、存在主義與敘事身份",
                    accent: warmGold,
                    content: Content.analysis1
                )

                AnalysisDisclosure(
                    index: "02",
                    title: "「山中好長日」考據：一首詩和一場雅集",
                    subtitle: "陸仁、玉山雅集、桃花源式避難所與文學的流傳",
                    accent: mistBlue,
                    content: Content.analysis2
                )

                AnalysisDisclosure(
                    index: "03",
                    title: "遺忘、虛無與重新開始的人生",
                    subtitle: "童話寓言、神聖喜劇與「未完待續」",
                    accent: rose,
                    content: Content.analysis3
                )

                AnalysisDisclosure(
                    index: "04",
                    title: "憂鬱症與精神分析",
                    subtitle: "弗洛伊德、克里斯蒂娃、吞噬隱喻與審美升華",
                    accent: Color(hex: 0xB6A6D8),
                    content: Content.analysis4
                )

                AnalysisDisclosure(
                    index: "05",
                    title: "文學、歷史、數學與藝術致敬",
                    subtitle: "《魔山》、《哈姆雷特》、葉芝、約瑟夫環與埃舍爾",
                    accent: Color(hex: 0x9DC9B8),
                    content: Content.analysis5
                )

                AnalysisDisclosure(
                    index: "06",
                    title: "成就名稱中的東西方典故",
                    subtitle: "蘇軾、王安石、佛教、卡夫卡、決定論與盆景宇宙",
                    accent: Color(hex: 0xD7B18E),
                    content: Content.analysis6
                )
            }
        }
    }

    // MARK: - Closing

    private var closingSection: some View {
        VStack(spacing: 24) {
            Text("未完待續")
                .font(.system(size: 46, weight: .bold, design: .serif))
                .foregroundStyle(.white)

            Text("一個叫彩特琳德的女孩決定不再去死。\n彩特琳德決定去拯救世界。")
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white.opacity(0.82))
                .lineSpacing(8)

            Rectangle()
                .fill(warmGold)
                .frame(width: 54, height: 1)

            Text("拯救自己，就是拯救世界。")
                .font(.headline)
                .foregroundStyle(warmGold)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .padding(.top, 90)
        .padding(.bottom, 120)
        .background(
            LinearGradient(
                colors: [background, Color(hex: 0x1B2938)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

// MARK: - Components

private struct SectionContainer<ContentView: View>: View {
    let kicker: String
    let title: String
    @ViewBuilder let content: ContentView

    init(
        kicker: String,
        title: String,
        @ViewBuilder content: () -> ContentView
    ) {
        self.kicker = kicker
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(kicker)
                    .font(.caption.weight(.bold))
                    .tracking(2.4)
                    .foregroundStyle(Color(hex: 0xE7C88C))

                Text(title)
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundStyle(.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)
            }

            content
        }
        .frame(maxWidth: 760, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.vertical, 62)
        .frame(maxWidth: .infinity)
    }
}

private struct TagPill: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption.weight(.medium))
            .foregroundStyle(.white.opacity(0.86))
            .padding(.horizontal, 13)
            .padding(.vertical, 8)
            .background(.white.opacity(0.08))
            .clipShape(Capsule())
            .overlay {
                Capsule()
                    .stroke(.white.opacity(0.14), lineWidth: 1)
            }
    }
}

private struct LongformCard<Content: View>: View {
    let accent: Color
    @ViewBuilder let content: Content

    init(accent: Color, @ViewBuilder content: () -> Content) {
        self.accent = accent
        self.content = content()
    }

    var body: some View {
        HStack(alignment: .top, spacing: 18) {
            Rectangle()
                .fill(accent)
                .frame(width: 2)

            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(24)
        .background(Color(hex: 0x121D30))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.white.opacity(0.07), lineWidth: 1)
        }
    }
}

private struct HighlightQuote: View {
    let text: String
    let accent: Color

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "quote.opening")
                .font(.title2)
                .foregroundStyle(accent)

            Text(text)
                .font(.system(size: 21, weight: .medium, design: .serif))
                .foregroundStyle(.white.opacity(0.94))
                .lineSpacing(7)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.vertical, 9)
    }
}

private struct ThemeCard: View {
    let number: String
    let title: String
    let text: String
    let accent: Color

    var body: some View {
        HStack(alignment: .top, spacing: 18) {
            Text(number)
                .font(.caption.monospaced().weight(.bold))
                .foregroundStyle(accent)
                .padding(.top, 4)

            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)

                Text(text)
                    .font(.body)
                    .foregroundStyle(.white.opacity(0.72))
                    .lineSpacing(6)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(22)
        .background(Color(hex: 0x121D30))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(alignment: .leading) {
            Rectangle()
                .fill(accent)
                .frame(width: 3)
                .clipShape(Capsule())
                .padding(.vertical, 19)
        }
    }
}

private struct AnalysisDisclosure: View {
    let index: String
    let title: String
    let subtitle: String
    let accent: Color
    let content: String

    @State private var isExpanded = false

    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            Divider()
                .overlay(.white.opacity(0.1))
                .padding(.vertical, 18)

            Text(content)
                .font(.system(size: 16.5, weight: .regular, design: .serif))
                .foregroundStyle(.white.opacity(0.82))
                .lineSpacing(8)
                .textSelection(.enabled)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 6)
        } label: {
            HStack(alignment: .top, spacing: 15) {
                Text(index)
                    .font(.caption.monospaced().weight(.bold))
                    .foregroundStyle(accent)
                    .padding(.top, 4)

                VStack(alignment: .leading, spacing: 7) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.56))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .tint(accent)
        .padding(20)
        .background(Color(hex: 0x121D30))
        .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 17, style: .continuous)
                .stroke(isExpanded ? accent.opacity(0.34) : .white.opacity(0.06), lineWidth: 1)
        }
        .animation(.easeInOut(duration: 0.22), value: isExpanded)
    }
}

private struct MountainSilhouette: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height))

        path.addLine(to: CGPoint(x: 0, y: rect.height * 0.72))
        path.addLine(to: CGPoint(x: rect.width * 0.13, y: rect.height * 0.48))
        path.addLine(to: CGPoint(x: rect.width * 0.22, y: rect.height * 0.64))
        path.addLine(to: CGPoint(x: rect.width * 0.39, y: rect.height * 0.22))
        path.addLine(to: CGPoint(x: rect.width * 0.55, y: rect.height * 0.59))
        path.addLine(to: CGPoint(x: rect.width * 0.72, y: rect.height * 0.31))
        path.addLine(to: CGPoint(x: rect.width * 0.84, y: rect.height * 0.55))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.36))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.closeSubpath()

        return path
    }
}

private extension Text {
    func bodyStyle() -> some View {
        self
            .font(.body)
            .foregroundStyle(.white.opacity(0.74))
            .lineSpacing(7)
            .fixedSize(horizontal: false, vertical: true)
    }
}

private extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

// MARK: - Text Content

private enum Content {
    static let fullStory = """
一個叫彩特琳德的女孩決定去死。

一個叫彩特琳德的女孩收到了姐姐的告別信。她收拾好姐姐的信物，提起行李箱來到蒙德，在療養院里找到了姐姐的墓碑。

彩特琳德有抑郁癥，彩特琳德失去了唯一的親人。彩特琳德決定去死。

幸運抑或是不幸的是，彩特琳德被突然出現的守望者帶上了天堂。天堂的引路人伊斯托利亞告訴彩特琳德，她的姐姐勞姆希爾妲也來過天堂。

希爾妲和伊斯托利亞討論哲學。比如，人活在世界上最根本的哲學問題，就是明天要不要自殺。如果有一天，我們發現了遙遠未來一切必定歸於虛無，我們現在的生活還有意義嗎？或者我們的生活本來就是一灘無涯的苦海，那世界其實也就是痛苦的集合。這兩種情況下，活與不活沒有差別。後者甚至可以說是解脫。

伊斯托利亞說人生就算沒意義也要活下去。希爾妲不這麼認為。

希爾妲和彩特琳德有幸福的童年。可是大人的世界很艱難。希爾妲和彩特琳德失去了父母，希爾妲又失去了短壽的未婚夫，最後住進了山里的療養院。

希爾妲有抑郁癥。希爾妲決定去死。

幸運抑或是不幸的是，希爾妲也被帶上了天堂。她在天堂看起來很開朗很健談，給大家帶來了許久未見的活力。

希爾妲在書院向畫師學畫。畫師說她的畫既沒有大師風範也沒有兒童意趣，但是卻有一絲哀傷。要不要忘了他們教的東西，重新再畫一幅。希爾妲說不畫了不畫了，體驗過畫畫就夠了，經歷過的事情沒法忘掉重來。即使是平庸之作，也署上了自己的名字。希爾妲給這幅畫取名《生命萬歲》。

希爾妲留下了很多旅遊時候的風景照。彩特琳德評價這些相片光影構圖都很爛，毫無距離層次感。書院的畫師道子說，如果不是希爾妲堅持要露一個腦袋，這些相片就只是最爛的風景照。但是因為有她在，這些相片就是她存在的回憶與證明。

希爾妲給自己寫好了墓志銘：「只活一次不算數。」

為了天堂所有人，希爾妲去面見了守望者，要以所有記憶為代價，具現出通天之路。

於是，一個叫勞姆希爾妲的女孩決定忘記一切。

彩特琳德現在明白了為什麼敢肯定姐姐一定還活著。如果希爾妲不忘記一切，她一定會自殺。而一段重新開始的人生，想必充滿了希望。

治療了自己的憂郁，還拯救了世界，這太酷了不是嗎？因為，拯救自己就是拯救世界。

於是，一個叫彩特琳德的女孩決定不再去死。

彩特琳德決定去拯救世界。
"""

    static let hildaPoem = """
踩上城市的屋頂，
童年時嬉笑跑過的街道和我不再熟悉。
步入藍天，
…風車揮手作別，
我和最喜歡的麵包店漸漸遠離。

異國的花塢，
被水浸沒的夏色。
歸入水中，
孩提時幻想的沉船沒有寶藏，
只有藍色的憂鬱。

奇裝異服的楓丹老紳士，
急匆匆走下了巡軌船…
走入了熙攘的人群裡。

玉色群山裡，吞吐霧氣的獸…
遠離了港集，馱獸鈴鐺的漸稀。

記不住名字的天空之都
風…
離群索居的人們啊。

陣雨落下，水色的柳枝會落下葉子嗎？
還有…鎮守之森的妖狸…

我明白的，我明白的。
這世界其實就是如此美麗啊。
"""

    static let analysis1 = """
一個關於告別的故事，一篇探討「死亡、記憶與活著的意義」的哲學寓言。

一、以《神曲》為骨：一場無意為之的「天路歷程」

整個任務最核心的結構原型，毫無疑問是但丁的《神曲》。

任務章節的命名毫不掩飾地對應了《神曲》的三部曲——序章的「魔山」如同迷失之林，其後則是第一章「天堂」、第二章「地獄」與第三章「審判」（煉獄）。在這座名為「空之神殿」的彼世場所中，神明守望者化身為了類似維吉爾（古羅馬詩人）的引路人，帶領主角穿行於亡者的靈魂之間。那些被懲罰的靈魂化為沙礫或被永遠封入畫中，完美契合了但丁式的「罪對應刑」結構。

正如喬瑟夫斯引用的那句詩：「走吧。讓我們駛向世界的中心，那未給老者與死者、富人與乞丐預留的國度。」這種「世界的中心」與「未預留的國度」，正是中世紀詩歌中對彼世最經典的隱喻。

除了《神曲》，視覺與空間上的壓迫感則來自荷蘭版畫大師 M.C. 埃舍爾（Escher）。整個神殿中扭曲的房間、打不開的門扉、畫中嵌套的畫，正是埃舍爾「不可能空間」的具現。這種空間上的錯亂感，隱喻了「梅蘭塔」那試圖困住所有靈魂、讓存在被層層嵌套的瘋狂。

而對於彩特琳德而言，她被捲入神殿尋找死去的姐姐，正如尼西里塔所言：「她也有自己的天路歷程。」這呼應了約翰・班揚在 1678 年創作的基督教寓言《天路歷程》，讓這段旅途帶上了濃厚的朝聖與救贖色彩。

二、東西方美學的匯流：心勝於物與「外師造化」

在劇情中，璃月畫師「道子」的出現，為這趟西方古典氛圍濃厚的旅途注入了東方哲學的靈魂。

道子的語言充滿了中國古典審美的寫意：「畫蛇添足也是畫龍，畫龍點睛也是畫龍。意思卻天差地別呢。」「且試伸手摘那天心。」這些台詞不僅是文學修辭，更是對中國畫論中「重筆意而不重形似」的深刻表達。道子發現，在這個世界裡，「看起來很真的畫，是可以憑藉心的力量變現為真的」。這本質上是中國畫論「外師造化、中得心源」的異世界變體。

巧合的是，這種東方心學（如王陽明的「心外無物」）在神殿中與西方古典觀念論完成了奇妙的匯流。劇情借道子之口轉述了伊斯托利亞老師「亞里斯多克勒斯」的話：「心勝於物」。

熟悉哲學史的玩家會心一笑——「亞里斯多克勒斯」正是柏拉圖（Plato）的本名。柏拉圖的理念論認為，現實世界不過是理念（Idea）的投影，精神凌駕於物質之上。東西方的哲人在這座虛構的神殿中隔空對話，賦予了玩家用「心力」重構世界的合理性。

此外，任務中隨處可見的希臘羅馬古典符號——從真實的古希臘綜合武術「潘克拉辛」，到影射雅典衛城的「帕特拉衛城」，再到直接化用古羅馬建築師《建築十書》作者之名的「維特魯威」——共同構建了一個極為扎實的古典主義語境。

三、永生的空洞與向死而生：存在主義的終極拷問

如果說文學與美學是這篇故事的血肉，那麼存在主義哲學則是它的靈魂。

神殿宣稱：「被擢升後，受選之人將作為活記憶被保存於此，直至永遠。」但這引出了一個極其尖銳的哲學命題：永生，真的是祝福嗎？

伊斯托利亞給出了海德格爾式的回答：「這裡只不過是過去的總集，無法創造未來。而你還有未來。」

在海德格爾的存在主義中，人是「向死而生」（Being-toward-death）的。正因為生命有著名為「死亡」的絕對邊界，我們的時間才具有真實性，我們才能去創造「未來」。神殿中的永生者被剝奪了這種邊界，時間在他們身上凝固了，永生變成了一種令人窒息的空洞與停滯。

劇情中對「憂鬱」（Melancholia，即梅蘭塔的名字來源）的討論，精準概括了憂鬱概念在醫學與哲學史上的三個階段：

• 古希臘體液論：詞源「黑之膽」，被認為是生理（黑膽汁）不平衡；
• 近代心理學：被純化為心因性的心理疾病；
• 當代神經科學：重新發現其作為生理病變（神經遞質等）的真實。

守望者「梅蘭塔」（憂鬱）與「尼西里塔」（虛無，Nihilitas），成為了全能神明最無法對付的宿敵。這是一種極具薩特式荒誕感的設定：全能者的軟肋，從來不是外在的強敵，而是人心內在的空洞與憂鬱。

四、結語：記憶的名字，與活著的敘事

彩特琳德最初是帶著那個裝著「離開前必須告別的東西」的手提箱上山的，那是她身份認同的錨點。當神殿試圖收走手提箱，本質上是在剝奪她的記憶與身份。

法國哲學家保羅・利科認為，人的身份是由我們被講述的故事構成的（敘事身份論）。正如伊斯托利亞所說：「哪怕只是一個名字，也是無窮的思念，以及傳遞下去的敘事和力量。」

《山中好長日》用一場《神曲》式的宏大夢境，讓彩特琳德——一個可能本已對生無可戀的人——親眼目睹了那個「永遠活著卻無法創造未來」的悲哀彼岸。當她最終拿回那個象徵記憶的手提箱，她完成的不僅僅是與姐姐的告別，更是對自我生命價值的反向確認。

虛無與憂鬱固然是靈魂的底色，但正因為我們有痛覺，有終點，有不可復現的記憶，我們才是真正地「活著」。
"""

    static let analysis2 = """
原神「山中好長日」考據｜一首詩和一場雅集

我們都知道，原神空之神殿劇情有兩個任務名稱，序章名為「魔山」，而整個任務總標題名為「山中好長日」。

「魔山」來源於德國小說家托馬斯・曼的同名小說《魔山》。小說裡，主人公前往阿爾卑斯山的療養院探病，卻意外滯留七年，山中時間彷彿停滯，人們在此處思考生命、時間、疾病、死亡和文明，全書充滿了哲學思辨。原神借用「魔山」，作為任務的序章名稱。

那總標題「山中好長日」從何而來呢？這個標題來源於元末明初詩人陸仁所作的五言古詩《玉山佳處賦得山中好長日》。全詩如下：

山中好長日，流景麗蓬瀛。
池台帶蘭薄，水色上帝旌。
興言春再交，嘉鳥相和鳴。
木桃源上芳，洵美粲條英。
延念顧長康，散息志慮清。
豈不懷爵服，馳逐正營營。
馳逐非所慕，高情諒難並。

作者清高自守，厭惡世俗功名，借山中美景，表達對隱逸生活的喜愛。

陸仁雖不甚出名，但他所在的「玉山雅集」卻是文壇盛事。這首《玉山佳處賦得山中好長日》也是為了「玉山雅集」所創作的。

這場集會的發起者是昆山富商顧瑛，他在自己的「玉山草堂」廣邀天下名士。玉山雅集號稱元代規模最大、歷時最久、留存作品最多的文人聚會，參與才子眾多，其中包括開創「鐵崖體」的詩人楊維楨、大畫家倪瓚和黃公望。

顧瑛創造這個集會的目的之一，就是想為文人們打造一處「桃花源」式的避難所。元末社會動盪、戰亂頻發，文人無處施展才華，又怕被政局波及，大多渴求一方淨土，可以隨心所欲地創作。玉山雅集便在這樣的期盼中出現了。乍看之下，它就像一座烏托邦式的文學樂園。

但是現實中並沒有烏托邦，縱使是能庇護一時的玉山草堂，也逃不過時代的碾壓。元末的戰亂焚毀了玉山草堂，明朝建立後，顧瑛被強制遷徙到臨濠，最終客死途中。自此，玉山草堂就消失在了歷史的長河中。

玉山草堂雖然消失了，但是作品卻流傳了下來。這場集會彙聚了上百位文人，留存了詩歌超過五千首。集會期間，眾多戲曲家討論南北腔調，為昆山腔的形成打下了基礎。明清兩代文學藝術，或多或少都受到了「玉山雅集」的影響。

再說回原神。原神在選取「山中好長日」這個標題時，我是有些意外的：他們是如何從浩如煙海的史料中，挑出這麼一首小眾而不起眼的詩歌？但換個角度看，這恰恰說明原神確實在挖掘小眾詩人與文學，並借助遊戲的影響力，把這些生僻的知識點帶到了大眾面前。

這讓我想起讀書時的一個夏天。導師讓我和師姐去圖書館抄寫一部極為冷門的古籍，連續抄了兩周多。師姐邊抄邊嘆氣：「不知道研究這些有什麼意義。最終哪怕寫成論文，都只是在網站或者雜誌上封存，不是研究這個方向的人，永遠不會打開它。」我也無言以對。

可是在原神中，我似乎找到了另一種可能。這些文人在文學史中也許只是一筆帶過，但正因如此，他們反而更值得被記住、被研究。未來的某一天，他們仍有可能因為某個契機，走進大眾的視野裡。

托馬斯・曼筆下與世隔絕的療養院，最終因為戰爭爆發，人員離散；顧瑛的玉山草堂，也隨著朝代更迭而消散，曾經在此聚會的文人們早已四散天涯。幻夢的破碎並不意味著價值也跟隨消失，托馬斯・曼獲諾貝爾文學獎，而玉山草堂的這場集會，影響了後世的文學藝術。說到底，文學的發展，不就是靠無數個或知名或無名的文人，一點一點積累下來的嗎？

最後，讓我表達一下我對「山中好長日」這個任務的喜愛。好一場盛大又浪漫的死亡與新生！
"""

    static let analysis3 = """
《山中好日長》又給虛無主義邦邦兩拳

記憶，太過沉重。它是人存在的證明，是存留於世的痕跡，失去了記憶，就失去了與世界的聯繫，失去了自我的認知，如同在水上寫字，順流而下，無法留下字句。

可希爾姐選擇忘記所有。

她的選擇源於她的憂鬱／抑鬱（Melancholia），這種抑鬱是病變，是沉重的，無法輕盈。

在妹妹面前，她是開朗的，愛笑的，如陽光般的，可陽光般的笑容無法掩飾內心的脆弱空洞。

她要把一切全部忘掉，重新活一次。如她留下的墓碑——

只活一次不算數。

父母雙亡，姐姐去世。妹妹彩特琳德懷著死志前往療養院與姐姐道別，偶然來到了空之神殿。在這裡她知曉了希爾姐的一切，她的憂鬱、她的選擇、她的詩歌。

她的詩歌滿是情緒而毫無文學技巧，她寫道——

「我和我最喜歡的麵包店漸漸遠離」；

她寫「被水浸沒的夏色」；

她寫——

「孩提時幻想的沉船沒有寶藏，
只有藍色的憂鬱」；

她在詩歌的結尾寫——

「我明白的，我明白的」
「這世界就是如此美麗啊。」

記憶在消散，她如溺水之人抓住記憶細碎的浮萍，羅列成詩行。

這是憂鬱的人眼中的世界，這是一個選擇遺忘的人根植的執念。

彩特琳德說她終於相信姐姐還活著了，如果她沒有忘記，她一定會選擇自殺。

我給你早在你出生前多年，黃昏裡一朵黃玫瑰的記憶。

我給你關於你生命的詮釋，關於你自己的理論，你真實而驚人的存在。

她理解了她的憂鬱、她的執念、她的選擇，最終走上了相同的道路。獻祭自己的全部記憶，為眾人開闢出路。

拯救自己就是拯救世界，這太酷了，不是麼。

從天堂、地獄到審判，《山中好日長》按照但丁《神曲》的格式，寫就了真正意義上的「神曲」（神聖喜劇），喜劇的本義即為從黑暗的開頭走向光明完滿的戲劇。

希爾姐與彩特琳德重啟人生，本就是烏托邦式的完滿結局，現實中沒有空之神殿，沒有人能夠主觀選擇拋擲自己的記憶。而就算意外失去了記憶，一具空白的軀殼又是否是原來的自己。

所以《山中好日長》是童話的寓言，是溫和而堅定的發聲。而這種發聲值得被傾聽。

彩特琳德為自己選擇墓誌銘「未完待續」，她或許會在廣袤的人生裡找尋屬於那個手提箱的秘密，在同一片天空下與那個和自己相貌相似的女孩重逢。而眼前的夕陽、曠野與飢餓，正如此鮮活地存在著。
"""

    static let analysis4 = """
原神・山中好長日——憂鬱症與精神分析

這次原神開圖主線的地圖解謎與劇情主題似乎與弗洛伊德關於憂鬱症的理論緊密相關。劇情文本中反覆出現「憂鬱」這樣的字眼，擊敗「梅蘭塔」的成就名是「憂鬱的治療，又名黑膽切除」，這也指示過去人們認為憂鬱症與黑膽汁分泌的聯繫。

劇情中對「梅蘭塔」的躁狂與憂鬱有著較為清楚的交代。按弗洛伊德的說法，哀傷可以被轉移到其他物件，而憂鬱即便轉移到其他物件，物件卻也是自我意識的一部分，相當於憂鬱回到了自身。憂鬱的症狀是自我意識擴張為整個空間，所以任何物件的流逝都損害了自身。因此，憂鬱症表現為一種特別具有破壞性的自戀形式，憂鬱症患者在對自我的愛與恨之間徘徊。

十八世紀憂鬱症的一個常見症狀是妄想型自大，醫學文獻中有很多自認為是國王的憂鬱症患者的例子；另一個典型的文學案例是《少年維特之煩惱》。在劇情中，正如「梅蘭塔」從墮天的尼西里塔手中接管魔山，認為聖殿的一切都是他自我的一部分，因此他將造物的任何一種變化都視為叛逆，他「嫉妒變化，嫉妒自由，嫉妒生命」「翅膀先被自己束縛，然後又被折斷」。

「梅蘭塔」對空間內造物的破壞欲也與憂鬱式的「食人」傾向有關。克里斯蒂娃在《黑太陽》中分析弗洛伊德的觀點指出，憂鬱體現了一種極為迫切的、將他者吞入口中的欲望，即個體希望將他者毀滅，才能讓他者存活並進行佔有。與其失去，不如將其分解、撕碎、割裂、吞噬、消化，一如「梅蘭塔」將人鎖在古畫中、封禁在沙地裡。

「梅蘭塔」最後在感到無法從吞噬中得到應有的滋養，被其內在「被摧毀的焦慮」引導，走向崩解與碎塊化，一如劇情所說，走向「規則內的自滅」。這些地方的劇情演出，如方塊崩解、空間吞噬，也可以看作與這些隱喻和象徵的空間延伸。

最後他終於承認「神不在其座，造物皆是自由的」，看清了自我意識與客體的分別，但因其並未完成這一分離過程，最後空餘悲嘆「尼西里塔，我好憂愁……」，可以說完成了其劇情邏輯的自治。

彩特琳德與她姐姐的故事則從另一個角度實現了憂鬱的升華美學。克里斯蒂娃指出，抑鬱有著另一種形態，即憂傷並非對他者的隱蔽攻擊，而是一個受傷的、不完整而空洞的原始自我的信號。這樣的個體不把自己當作受害者，而是認為自己身上存有某種根本的缺點、某種先天的不足。一如彩特琳德在劇情開始，反覆否定自己、在眾人面前多次提及自己的缺陷和負面情緒。彩特琳德的姐姐也因丈夫短壽去世，患上憂鬱住進了療養院。

但她們最終都通過製造符號來宣告自我與客體的分離，製造菲勒斯認同（象徵性認同），使主體能夠順利進入符號和創造的世界。如劇情中尋找彩特琳德姐姐手提箱中的物件、以玩家視角漂流過彩特琳德姐姐記憶中的風景，這些都是將弗洛伊德的理論體系中難以分辨主客體的「物」、零散的碎片符號，賦予藝術與智性活動，從而變成能夠被感知距離的「母體之物」。

克里斯蒂娃認為升華是「給……前客體命名」的過程。一如劇情裡彩特琳德說：「向你獻上遠在你出生前多年的一個傍晚看到的一朵黃玫瑰的記憶。」

借助這些藝術化的升華與審美經驗的再創作，彩特琳德姐妹完成了憂鬱的審美升華，不僅重塑了本該崩解的自我與虛無，更走向深刻的自我洞察與新生。一如她在劇情裡，站在地獄的門扉前說：「從此以後，被選拔的人來往空無邊殿與這裡的通天之塔——將永遠只是兩個女孩子對世界美好的憧憬。」

這一審美升華的過程，既有對憂鬱體驗的個體經驗描寫，也有通過詩文、繪畫、建築等藝術形式實現自我的想像。如劇情裡旅行者以彩特琳德姐姐詩作的視角漂流過璃月、稻妻、楓丹海底等地，給回憶碎片命名、賦予新的意義。

彩特琳德雖然調侃「姐姐的詩，全是情感，沒有一點文學素養」，利希滕貝格卻也說過：to write with sensibility requires more than tears and moonlight.

「山中好長日」的劇情涉及憂鬱與憂鬱症，整體基調類似王楠在《新教倫理與資本主義精神》中指出的那樣：人依然需要更高的精神寄託和價值理想，需要宗教、世界觀和超越凡俗的信念來引人向上，促成行動。但在這個過程中，真正驅散焦慮、令人體會到行動與生活中的豐沛生命的不是神，而是人自己。

換作劇情裡彩特琳德的話，就是那句：拯救自己就是拯救世界。
"""

    static let analysis5 = """
一、文學名著與詩歌致敬

1. 《魔山》（托馬斯・曼）

文本中曼恩大爺提及的「有進無出的魔性之山」，以及整個故事發生的背景「建在山上的廢棄療養院」，高度致敬了諾貝爾文學獎得主托馬斯・曼的巨著《魔山》（Der Zauberberg）。

2. 《哈姆雷特》（莎士比亞）

留言紙條中擅長雕刻墓碑的「托騰格拉博」（德語 Totengräber，意為掘墓人）以及他提到的《掘墓人歌》，直接致敬莎士比亞《哈姆雷特》第五幕中掘墓人一邊挖坑一邊唱歌的經典橋段。

3. 《航向拜占庭》（葉芝）

伊斯托利亞與喬瑟夫斯反覆吟誦的台詞「讓我們駛向世界的中心，那未給老者與年輕人、國王與愚人預留的國度」，改編自愛爾蘭詩人葉芝的著名詩篇《航向拜占庭》（Sailing to Byzantium）開篇首句「那不是老人的國度」。

二、歷史與數學典故致敬

1. 反自殺大師「喬瑟夫斯」

該角色的名字與頭銜致敬了著名的數學與歷史典故「約瑟夫環」（Josephus Problem）。公元 1 世紀的猶太歷史學家弗拉維奧・約瑟夫斯在絕境中，利用數學排列規律成功避免了與同伴的集體自殺。

2. 科赫（Koch）

留言紙條中提到一位即將治好肺病下山的病友「科赫」，致敬了現實中發現結核桿菌（肺結核致病原）的德國醫學家、諾貝爾獎得主羅伯特・科赫。

3. 小右（德克斯特）

伊斯托利亞指出「小右」的正式名稱為「德克斯特」（Dexter），該詞在拉丁語中的本意即為「右邊」。

三、藝術流派與視覺錯覺致敬

1. 埃舍爾（M.C. Escher）

文本直接提及了「第一次看到埃舍爾的畫」。這是致敬荷蘭著名的版畫大師摩里茨・科內利斯・埃舍爾，他以創作「不可能的幾何結構」與「空間折疊」聞名。這完美對應了空之神殿區域利用「類空矢量」進行空間折疊的玩法機制。

四、宗教神話與哲學詞彙借用

1. 被提（Rapture）

伊斯托利亞使用的詞彙「被提」，是基督教末世論中的核心概念，指末日時信徒將被提升到半空中與神相聚。在遊戲中被轉用為「歷史人物被強行升入天空島保存」。

2. 伊斯托利亞（Historia）

這位自稱來自太古時代的 NPC，其名字直接來源於希臘語／拉丁語中的「歷史」（Historia），暗示其本身就是一段活生生的歷史切片。

3. 大方廣之間

提到的神殿區域名稱「大方廣」，借用自大乘佛教核心經典《大方廣佛華嚴經》。「大方廣」意指無邊無際、包容萬象的世界，符合該區域收藏無數古書與歷史記憶的設定。
"""

    static let analysis6 = """
原一、東方古典

1. 《天地一粟》

致敬來源：北宋蘇軾的《前赤壁賦》：「寄蜉蝣於天地，渺滄海之一粟。」

內涵：成就描述說「或許從低看高處，也不過滄海一粟」。在空之神殿（高天之上）俯瞰提瓦特，人類的文明微小如塵埃；但反過來想，在浩瀚的宇宙和真實的星空面前，這座妄圖把歷史「切片」定格的神殿，又何嘗不是虛假星空下的一粒可悲的粟米？這是一種視角的降維打擊。

2. 《不畏浮雲遮望眼》

致敬來源：北宋王安石的《登飛來峰》：「不畏浮雲遮望眼，自緣身在最高層。」

3. 《Shed a Light》（入塵垂手）

致敬來源：佛教大乘境界「垂手入塵」（菩薩本已修成正果，卻主動降維回到污濁的人世救度眾生）＋英文短語 Shed a light（照亮／揭示真相，但其實是原神啟動梗）。

內涵：諾斯底主義的最高追求是「逃離物質肉體，飛升神界」；但這個成就卻說「入塵垂手與遺世絕俗，本就是一條路的兩個方向」。這是對那位因為憐憫凡人而主動「墮天」的神明眷屬尼西里塔的讚美。

二、西方經典

1. 《正因如此你有資格》

致敬來源：極度貼合卡夫卡的小說《法律門前》（Before the Law）的荒誕內核。門衛不讓鄉下人進門，鄉下人等了一輩子最後死在門外，門衛卻說：「這扇門本來就是為你開的。」

2. 《聖杯和奇跡都是存在的》

致敬來源：西方亞瑟王傳說的核心《尋找聖杯》（象徵救贖與奇跡）＋經典動漫《魔法少女小圓》名台詞「奇跡和魔法都是存在的」（伴隨著巨大的悲劇代價）。

內涵：這個成就對應的是《埃黎尼》（楓丹古名）的切片冒險。結合楓丹純水精靈和原初胎海的背景，當年楓丹的先民為了尋找拯救族群的「聖杯」一定付出了極其慘痛的代價。把這句話放在時間靜止的神殿裡，帶著一種深深的物是人非的嘆息。

三、宇宙與哲學

1. 《掌中觀微》與《抽屜裡的生態箱》

致敬來源：威廉・布萊克的名詩「一沙一世界，一花一天堂」（To see a World in a Grain of Sand），以及科幻作品中經典的「盆景宇宙／缸中之腦」概念（比如《黑衣人》結尾外星人把玩的銀河系玻璃球）。

內涵：神殿不僅切片了人類，還利用空間折疊技術，把一整個沙漠綠洲（沙上樓閣）強行塞進了一個微觀的抽屜裡。這種以上帝視角隨意揉捏、打包生態圈的行為，將「天理」或空之執政那種視萬物為玩物的傲慢展現得淋漓盡致。

2. 《空間與非自由意志》

致敬來源：哲學概念「決定論」（Determinism）。

內涵：這是整個摹憶中樞（供奉系統）滿級的成就，也是最讓人後背發涼的一個名字。在哲學上，如果時間和空間可以像硬碟數據一樣被任意調取、折疊和展示，那就意味著過去、現在和未來都是注定好的。在神殿的切片裡，沒有變數，自然也就沒有自由意志。

另：《十有八九是右撇子》有可能致敬了福爾摩斯系列的演繹推理法。在《血字的研究》等作品中，福爾摩斯經常通過細節判斷目標的常用手。

還有一個更貼近文本的想法是，這個成就的核心在於那個小玩意叫「小右」，其正式名稱是「德克斯特」（Dexter）。在拉丁語中，Dexter 本身就是「右邊」的意思，同時也引申為「正統、順從」。這其實是文案組在玩詞源學冷笑話，吐槽神殿裡的東西都是按照「正統（右）」的邏輯設計的，而你作為一個「不正統」的旅行者，卻在用這個工具拆家。
"""
}

// MARK: - Preview

#Preview("AboutView") {
    AboutView()
}
