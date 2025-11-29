//
//  BlockListFontModifier.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import SwiftUI

struct BlockListFontModifier: ViewModifier {
    let font: Font
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundStyle(color)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}
