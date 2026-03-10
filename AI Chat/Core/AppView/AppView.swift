//
//  AppView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-04.
//

import SwiftUI

struct AppView: View {
    
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
    }
}

#Preview("AppView - Tab Bar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
