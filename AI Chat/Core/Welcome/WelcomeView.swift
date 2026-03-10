//
//  WelcomeView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-06.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to AI Chat!")
                    .frame(maxHeight: .infinity)
                NavigationLink {
                    OnBoardingCompletedView()
                } label: {
                    Text("Get Started")
                        .callToActionButtonStyle()
                }
                .padding(16)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
