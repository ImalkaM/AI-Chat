//
//  AppViewBuilder.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-05.
//
import SwiftUI

struct AppViewBuilder<TabBarContent: View, OnBoardContent: View>: View {
    
    var showTabBar: Bool = false
    
    @ViewBuilder var tabBarView: TabBarContent
    @ViewBuilder var onBoardingView: OnBoardContent
    
    var body: some View {
        if showTabBar {
            tabBarView
                .transition(.move(edge: .trailing))
        } else {
            onBoardingView
                .transition(.move(edge: .leading))
        }
    }
}

private struct PreviewView: View {
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
    PreviewView()
}
