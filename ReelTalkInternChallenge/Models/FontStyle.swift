//
//  FontStyle.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 11/30/23.
//

import Foundation
import SwiftUI

struct FontStyle {
    
    private static let defaultFontFamily : String = "Avenir Next"
    
    let name: String
    let weight: Font.Weight
    let letterSpacing: CGFloat
    let font: Font
    
    static let titleH1 = FontStyle(name: "titleH1", weight: .semibold, letterSpacing: -0.005, font: .custom(defaultFontFamily, size: 34))
    static let titleH2 = FontStyle(name: "titleH2", weight: .bold, letterSpacing: -0.005, font: .custom(defaultFontFamily, size: 28))
    static let titleH3 = FontStyle(name: "titleH3", weight: .semibold, letterSpacing: -0.005, font: .custom(defaultFontFamily, size: 22))
    static let boldBody = FontStyle(name: "headline", weight: .semibold, letterSpacing: 0.02, font: .custom(defaultFontFamily, size: 17))
    static let subtitle = FontStyle(name: "bodytext", weight: .regular, letterSpacing: 0.02, font: .custom(defaultFontFamily,size: 17))
    static let bodyText = FontStyle(name: "subheadline", weight: .regular, letterSpacing: 0.02, font: .custom(defaultFontFamily, size: 15))
    static let smallText = FontStyle(name: "smallText", weight: .regular, letterSpacing: 0.02, font: .custom(defaultFontFamily, size: 13))
    static let caption = FontStyle(name: "caption", weight: .regular, letterSpacing: 0.02, font: .custom(defaultFontFamily, size: 11))

}


