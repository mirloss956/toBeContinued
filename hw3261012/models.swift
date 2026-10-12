import SwiftUI

// MARK: - 文化原型
enum ArchetypeKind: String {
    case philosophy = "哲學"
    case literature = "文學"
    case art = "藝術"
    case history = "歷史"

    var color: Color {
        switch self {
        case .philosophy: return .indigo
        case .literature: return .teal
        case .art: return .orange
        case .history: return .brown
        }
    }
}

struct Archetype: Identifiable {
    let id = UUID()
    let name: String
    let source: String
    let summary: String
    let symbol: String
    let kind: ArchetypeKind
}

extension Archetype {
    static let all: [Archetype] = [
        Archetype(name: "魔山", source: "托馬斯·曼《魔山》",
                  summary: "青年上山探親，卻在療養院停留七年。重複的作息讓時間彷彿停滯，也成了逃避山下現實的避難所。",
                  symbol: "mountain.2.fill", kind: .literature),
        Archetype(name: "駛向世界的中心", source: "葉芝《駛向拜占庭》",
                  summary: "渴望靈魂脫離肉身朽敗，成為永恆的藝術品。空之神殿裡人人如展品，正是這個意象。",
                  symbol: "sailboat.fill", kind: .literature),
        Archetype(name: "深中好長日", source: "玉山雅集・陸仁",
                  summary: "元末文人在玉山草堂避世雅集，如同亂世中的精神烏托邦；1367 年草堂毀於戰火，雅集終結。",
                  symbol: "leaf.fill", kind: .history),
        Archetype(name: "理性世界", source: "柏拉圖",
                  summary: "「保存而非進化」的規則，呼應永恆不變的理型藍圖：被選上來的就是標準，不該隨意改動。",
                  symbol: "building.columns.fill", kind: .philosophy),
        Archetype(name: "生命萬歲", source: "芙烈達·卡蘿",
                  summary: "畫家在去世前不久，把這四個字寫在西瓜上。劇情借它對停滯的空間發出宣言。",
                  symbol: "heart.fill", kind: .art),
        Archetype(name: "反抗與荒誕", source: "加繆《薛西弗斯的神話》",
                  summary: "直面荒誕、清醒反抗，為自己創造意義。這是整段任務的哲學主軸。",
                  symbol: "figure.climbing", kind: .philosophy)
    ]
}

// MARK: - 人物與歷史原型
struct CharacterProfile: Identifiable {
    let id = UUID()
    let name: String
    let prototype: String
    let note: String
    let symbol: String

    static let all: [CharacterProfile] = [
        CharacterProfile(name: "伊斯托利亞", prototype: "亞里斯多德／「歷史」",
                         note: "名字源自希臘語「探究」，後來演變為「歷史」，陪伴旅行者走完全程。",
                         symbol: "book.closed.fill"),
        CharacterProfile(name: "餘黃衣", prototype: "漢代虞初",
                         note: "被視為中國小說鼻祖，曾任方士侍郎、身穿黃衣。",
                         symbol: "scroll.fill"),
        CharacterProfile(name: "道子", prototype: "畫聖吳道子",
                         note: "在洛陽書院一眼看穿采特林德過度在意他人眼光。",
                         symbol: "paintbrush.pointed.fill"),
        CharacterProfile(name: "博斯", prototype: "超現實先驅博斯",
                         note: "一句「一生追求孩童般的畫」，指向畢卡索。",
                         symbol: "eye.fill")
    ]
}
