//
//  FontExtension.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import Foundation
import SwiftUI

extension Font {
    enum BlockListFont {
        case regular
        case medium
        case semibold
        case bold
        
        var weight: String {
            switch self {
            case .regular:
                return "Pretendard-Regular"
            case .medium:
                return "Pretendard-Medium"
            case .semibold:
                return "Pretendard-Semibold"
            case .bold:
                return "Pretendard-Bold"
            }
        }
    }
    
    static func pretendard(weight: BlockListFont, size: CGFloat) -> Font {
        return .custom(weight.weight, size: size)
    }
    
    static var BlockListRegular10: Font { Font.pretendard(weight: .regular, size: 10)}
    static var BlockListRegular12: Font { Font.pretendard(weight: .regular, size: 12)}
    static var BlockListRegular14: Font { Font.pretendard(weight: .regular, size: 14)}
    static var BlockListRegular16: Font { Font.pretendard(weight: .regular, size: 16)}
    static var BlockListRegular18: Font { Font.pretendard(weight: .regular, size: 18)}
    static var BlockListMedium10: Font { Font.pretendard(weight: .medium, size: 10)}
    static var BlockListMedium12: Font { Font.pretendard(weight: .medium, size: 12)}
    static var BlockListMedium14: Font { Font.pretendard(weight: .medium, size: 14)}
    static var BlockListMedium16: Font { Font.pretendard(weight: .medium, size: 16)}
    static var BlockListSemibold8: Font { Font.pretendard(weight: .semibold, size: 8)}
    static var BlockListSemibold10: Font { Font.pretendard(weight: .semibold, size: 10)}
    static var BlockListSemibold12: Font { Font.pretendard(weight: .semibold, size: 12)}
    static var BlockListSemibold14: Font { Font.pretendard(weight: .semibold, size: 14)}
    static var BlockListSemibold16: Font { Font.pretendard(weight: .semibold, size: 16)}
    static var BlockListSemibold18: Font { Font.pretendard(weight: .semibold, size: 18)}
    static var BlockListSemibold20: Font { Font.pretendard(weight: .semibold, size: 20)}
    static var BlockListBold12: Font { Font.pretendard(weight: .bold, size: 12)}
    static var BlockListBold14: Font { Font.pretendard(weight: .bold, size: 14)}
    static var BlockListBold16: Font { Font.pretendard(weight: .bold, size: 16)}
    static var BlockListBold18: Font { Font.pretendard(weight: .bold, size: 18)}
    static var BlockListBold20: Font { Font.pretendard(weight: .bold, size: 20)}
    static var BlockListBold22: Font { Font.pretendard(weight: .bold, size: 22)}
    static var BlockListBold40: Font { Font.pretendard(weight: .bold, size: 40)}
}

extension View {
    func blockListFont(font: Font, color: Color) -> some View {
        modifier(BlockListFontModifier(font: font, color: color))
    }
}
