//
//  AppView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-04.
//

import SwiftUI

struct AppView: View {
    
    @Environment(\.authService) private var authService
    @State var appState: AppState = AppState()
    
    var body: some View {
            AppViewBuilder(
                showTabBar: appState.showTabBar,
                tabBarView: {
                    TabBarView()
                },
                onBoardingView: {
                    WelcomeView()
                }
            )
            .environment(appState)
            .task {
                await checkUserStatus()
            }
    }
    
    private func checkUserStatus() async {
        if let user = authService.getAutheticatedUser() {
            
            print("User already authenticated: \(user.uid)")
            
        } else {
            do {
                let result = try await authService.signInAnonymously()
                
                print("sucess \(result.user.uid)")
            } catch {
                print(error)
            }
        }
    }
    
}

#Preview("AppView - Tab Bar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
