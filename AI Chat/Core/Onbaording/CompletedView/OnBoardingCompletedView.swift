//
//  OnBoardingCompletedView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-07.
//

import SwiftUI

struct OnBoardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack {
            Text("Onboarding completed")
                .frame(maxHeight: .infinity)
            Button {
                onFinishButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButtonStyle()
                    
            }
            .padding(16)
        }
    }
    
    func onFinishButtonPressed() {
        root.updateViewState(showTabBarView: true)
    }
    
}

#Preview {
    OnBoardingCompletedView()
        .environment(AppState())
}
