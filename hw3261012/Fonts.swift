import SwiftUI

extension Font {
    /// 全專案共用的客製字型。relativeTo 讓字級仍能跟著系統「文字大小」設定縮放。
    static func naikai(_ size: CGFloat, relativeTo style: Font.TextStyle = .body) -> Font {
        .custom("NaikaiFont-Regular", size: size, relativeTo: style)
    }
}
