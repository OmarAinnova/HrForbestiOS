//
//  HrApp.swift
//  Hr
//
//  Created by Omar Yousef on 06/09/2024.
//

import SwiftUI

@main
struct HrApp: App {
    @StateObject private var languageManager = LanguageManager()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.locale, languageManager.locale)
                .environment(\.layoutDirection, languageManager.layoutDirection) // Inject layout direction
                .environmentObject(languageManager)
        }
    }
}
