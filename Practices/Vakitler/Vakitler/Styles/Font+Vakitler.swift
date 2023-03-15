//
//  Font+Vakitler.swift
//  Vakitler
//
//  Created by Ali Kolukirik on 13.03.2023.
//

import SwiftUI

extension Font {
    static var bigTitle: Font {
        return Font.system(size: 34, weight: .regular)
    }

    static var smallTitle: Font {
        return Font.system(size: 20, weight: .regular)
    }

    static var mainText: Font {
        return Font.system(size: 18, weight: .medium)
    }

    static var captionText: Font {
        return Font.system(size: 14, weight: .regular)
    }
}
