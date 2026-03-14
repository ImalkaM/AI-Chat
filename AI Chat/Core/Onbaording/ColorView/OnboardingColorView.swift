//
//  OnboardingColorView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-12.
//

import SwiftUI

struct OnboardingColorView: View {
    
    @State private var selectedColor: Color?
    
    @Environment(AppState.self) private var root
    
    let profileColors: [Color] = [.black, .accent, .blue, .green, .yellow, .orange, .purple, .indigo, .pink ]
    
    var body: some View {
        ScrollView {
            colorGrid
                .padding(.horizontal, 24)
        }
        .safeAreaInset(
            edge: .bottom,
            alignment: .center,
            spacing: 16,
            content: {
                ZStack {
                    if let selectedColor {
                        ctaButtons(selectedColor: selectedColor)
                            .transition(AnyTransition.move(edge: .bottom))
                    }
                }
                .padding(24)
                .background(Color(UIColor.systemBackground))
            }
        )
        .animation(.smooth, value: selectedColor)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders],
            content: {
                Section(
                    content: {
                        ForEach(profileColors, id: \.self) { color in
                            Circle()
                                .fill(.accent)
                                .overlay(
                                    color
                                        .clipShape(Circle())
                                        .padding(selectedColor == color ? 10 : 0)
                                )
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    },
                    header: {
                        Text("Select a profile color")
                            .font(.headline)
                    }
                )
                
            }
        )
    }
    
    private func ctaButtons(selectedColor: Color) -> some View {
        NavigationLink {
            OnBoardingCompletedView(selectedColor: selectedColor)
        } label: {
            Text("Continue")
                .callToActionButtonStyle()
        }
    }
    
}

#Preview {
    OnboardingColorView()
        .environment(AppState())
}
