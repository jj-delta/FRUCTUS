//
//  FRUCTUSApp.swift
//  FRUCTUS
//
//  Created by JJ Santos on 02/06/21.
//

import SwiftUI

@main
struct FRUCTUSApp: App {
    
    //MARK: - AppStorage of settings booleans
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
