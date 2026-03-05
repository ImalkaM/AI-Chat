//
//  AppView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-04.
//

import SwiftUI

struct AppView: View {
    @State private var showTabBar = false
    var body: some View {
        ZStack {
            AppViewBuilder(
                showTabBar: showTabBar,
                tabBarView: { ZStack {
                    Color.red.ignoresSafeArea()
                    Text("tabbar")
                }},
                onBoardingView: { ZStack {
                    Color.gray.ignoresSafeArea()
                    Text("onboarding")
                }}
            )
        }
        .animation(.smooth, value: showTabBar)
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    AppView()
}
