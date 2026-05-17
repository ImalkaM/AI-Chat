//
//  AsyncCallToActionButton.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-05-17.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    
    var isLoading: Bool
    var title: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                Text(title)
            }
        }
        .callToActionButtonStyle()
        .anyButton(.press) {
            action()
        }
    }
}

#Preview {
    VStack {
        AsyncCallToActionButton(
            isLoading: true,
            title: "Test",
            action: {
                
            }
        )
        
        AsyncCallToActionButton(
            isLoading: false,
            title: "Test",
            action: {
                
            }
        )
    }
}
