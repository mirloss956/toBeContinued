# 山中好長日 ｜ 生命未完待續 (toBeContinued)

> 「只活一次，不算數。拯救自己，就是拯救世界。」

這是一款以 **SwiftUI** 打造的沉浸式專題展示 App。本專案以遊戲《原神》中兼具哲學深度與文學意蘊的「空之神殿」任務「山中好長日」為主題，透過純代碼繪製的層疊視覺、精緻排版與互動式展開卡片，完整呈現一場跨越天堂、地獄與審判，最終重新擁抱生命意義的哲學救贖歷程。

---

## 📖 專案目錄

- [核心特色](#-核心特色)
- [畫面與內容結構](#-畫面與內容結構)
- [深度解析章節](#-深度解析章節)
- [專案架構](#-專案架構)
- [環境需求與建置](#-環境需求與建置)
- [設計亮點與技術實作](#-設計亮點與技術實作)
- [文學與典故致敬](#-文學與典故致敬)

---

## ✨ 核心特色

- **零外部資源依賴**：不需額外載入外部圖片資源或第三方套件，所有幾何裝飾、漸層光影與山巒輪廓皆透過 SwiftUI 原生程式碼繪製。
- **沉浸式深色美學**：以深海藍、暗夜色為基底，點綴暖金（Warm Gold）、霧藍（Mist Blue）與玫瑰粉（Rose），營造孤寂而溫暖的文學氛圍。
- **長篇閱讀體驗**：針對長篇文本進行排版優化，支援系統字型襯線體（Serif）、行距調整與文字選取複製（`.textSelection(.enabled)`）。
- **互動摺疊解析**：利用 `DisclosureGroup` 模組化收納六篇深度文學與哲學解析，保持畫面整潔的同時兼具資料厚度。

---

## 🎨 畫面與內容結構

| 區塊名稱 | 對應元件 / 視圖 | 功能與設計說明 |
| :--- | :--- | :--- |
| **首頁視覺區** | `hero` | 純 Shape 繪製山巒剪影、暖金色柔光月輪與核心金句標籤膠囊 |
| **專案陳述** | `overview` | 專題核心宗旨與理念闡述、名言引言卡片 |
| **故事全文** | `fullStory` | 完整記錄黛特琳德與勞姆希爾妲姐妹在蒙德神殿的告別與覺醒故事 |
| **希爾妲的詩** | `fullPoem` | 精緻漸層邊框卡片，收錄希爾妲對塵世浮生眷戀的散文詩 |
| **三大核心主題** | `themeSection` | 記憶與敘事身份、憂鬱與審美昇華、死亡邊界與創造未來 |
| **延伸閱讀筆記** | `analysisSection` | 六篇互動式可折疊卡片，深入探討文本背後跨領域的文化符號 |
| **未完待續結尾** | `closingSection` | 暖金色分隔線與哲思總結：「拯救自己，就是拯救世界」 |

---

## 📚 深度解析章節

App 內完整收納六篇深入研究筆記：

1. **以《神曲》為骨：死亡、記憶與活著的意義**
   - 但丁《神曲》地獄、天堂、審判（煉獄）結構原型
   - 埃舍爾（M.C. Escher）不可能空間與空間折疊象徵
   - 柏拉圖理念論與東西方美學的交匯
2. **「山中好長日」考據：一首詩和一場雅集**
   - 元末詩人陸仁《玉山佳處賦得山中好長日》考據
   - 顧瑛昆山「玉山雅集」與避難桃花源的興衰歷史
3. **遺忘、虛無與重新開始的人生**
   - 希爾妲以記憶為代價具現通天之路的抉擇
   - 童話寓言、神聖喜劇與「未完待續」的生命哲思
4. **憂鬱症與精神分析**
   - 弗洛伊德悲悼與憂鬱理論、古代體液說「黑膽汁」
   - 克里斯蒂娃《黑太陽》中的象徵化認同與審美昇華
5. **文學、歷史、數學與藝術致敬**
   - 托馬斯·曼《魔山》、莎士比亞《哈姆雷特》「掘墓人之歌」
   - 葉芝《航向拜占庭》、約瑟夫環（Josephus Problem）與羅伯特·科赫
6. **成就名稱中的東西方典故**
   - 蘇軾《前赤壁賦》滄海一粟、王安石《登飛來峰》
   - 佛教「垂手入塵」、卡夫卡《法律門前》、決定論與盆景宇宙

---

## 📂 專案架構

專案主要檔案位於專案根目錄下的 [`hw3261012`](file:///Users/user15/Documents/kumquat/hw3261012/hw3261012) 目錄：

```
hw3261012/
├── hw3261012/
│   ├── MyApp.swift          # 應用程式入口（@main App）
│   ├── ContentView.swift    # 根視圖，加載 AboutView
│   ├── AboutView.swift      # 核心專題頁面視圖與全文資料
│   ├── Assets.xcassets      # 專案資源目錄
│   └── NaikaiFont-Regular.ttf # 內海字型檔
├── hw3261012.xcodeproj     # Xcode 專案工程設定
└── README.md                # 專案說明文件
```

### 關鍵原始碼索引

- [MyApp.swift](file:///Users/user15/Documents/kumquat/hw3261012/hw3261012/MyApp.swift)：SwiftUI 生命週期進入點。
- [ContentView.swift](file:///Users/user15/Documents/kumquat/hw3261012/hw3261012/ContentView.swift)：應用主容器視圖。
- [AboutView.swift](file:///Users/user15/Documents/kumquat/hw3261012/hw3261012/AboutView.swift)：包含完整 UI 元件（`MountainSilhouette`, `SectionContainer`, `ThemeCard`, `AnalysisDisclosure`）與長篇文字資產。

---

## 🛠 環境需求與建置

### 開發環境

| 項目 | 最低需求 |
| :--- | :--- |
| **作業系統** | macOS Sonoma 14.0 或更高版本 |
| **Xcode** | Xcode 15.0 或更高版本 |
| **Swift** | Swift 5.9 或更高版本 |
| **部署目標** | iOS 17.0+ / iPadOS 17.0+ |

### 建置與執行步驟

1. 複製（Clone）此專案至本地環境：
   ```bash
   git clone https://github.com/mirloss956/toBeContinued.git
   ```
2. 使用 Xcode 打開專案檔：
   ```bash
   open hw3261012.xcodeproj
   ```
3. 在 Xcode 頂部方案欄中選取模擬器（如 iPhone 15 / iPhone 16）或實體裝置。
4. 按下快捷鍵 `Cmd + R` 編譯並執行專案。

---

## 💡 設計亮點與技術實作

### 1. 純 SwiftUI 幾何剪影 (`MountainSilhouette`)
透過自定義 `Shape` 實作貝茲曲線與路徑計算，動態描繪出層巒疊嶂的遠山剪影：
```swift
private struct MountainSilhouette: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height))
        // 依比例繪製山脊起伏節點
        ...
        return path
    }
}
```

### 2. 優雅的手風琴摺疊閱讀 (`DisclosureGroup`)
使用 SwiftUI `DisclosureGroup` 打造滑順展開效果，並加入自定義光暈與色系標籤，讓長篇閱讀層次分明：
```swift
DisclosureGroup(isExpanded: $isExpanded) {
    ...
} label: {
    ...
}
.tint(accent)
.animation(.easeInOut(duration: 0.22), value: isExpanded)
```

---

## 📜 文學與典故致敬

本 App 所展示的文案與解析，致敬並引據了多部經典作品：
- 托馬斯·曼《魔山》（*Der Zauberberg*）
- 但丁·阿利吉耶里《神曲》（*La Divina Commedia*）
- 保羅·利科（Paul Ricœur）《時間與敘事》敘事身份論
- 尤莉亞·克里斯蒂娃（Julia Kristeva）《黑太陽：抑鬱症與憂鬱》
- 馬丁·海德格爾（Martin Heidegger）「向死而生」哲學
- 陸仁《玉山佳處賦得山中好長日》與顧瑛「玉山雅集」

---

*生命未完待續 · 拯救自己就是拯救世界*
