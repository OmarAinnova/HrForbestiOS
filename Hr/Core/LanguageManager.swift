//
//  LanguageManager.swift
//  Hr
//
//  Created by Omar Yousef on 20/09/2024.
//

import Foundation
import SwiftUI

class LanguageManager: ObservableObject {
    @Published var locale: Locale
    @Published var layoutDirection: LayoutDirection

    init() {
        // Default to system language and layout
        let savedLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "en"
        self.locale = Locale(identifier: savedLanguage)
        self.layoutDirection = savedLanguage == "ar" ? .rightToLeft : .leftToRight
    }

    func toggleLanguage() {
        if locale.language.languageCode?.identifier == "ar" {
            // Switch to English
            changeLanguage(to: "en")
        } else {
            // Switch to Arabic
            changeLanguage(to: "ar")
        }
    }
    
    
    func changeLanguage(to languageCode: String) {
        self.locale = Locale(identifier: languageCode)
        self.layoutDirection = languageCode == "ar" ? .rightToLeft : .leftToRight
        UserDefaults.standard.set(languageCode, forKey: "appLanguage")
    }
}
