//
//  ModalSupportView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-06-03.
//

import SwiftUI

struct ModalSupportView<Content: View>: View {
    
    @Binding var showModal: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            if showModal {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .transition(AnyTransition.opacity.animation(.smooth))
                    .onTapGesture {
                        showModal = false
                    }
                    .zIndex(1)
                    content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .zIndex(2)
            }
        }
        .zIndex(9999)
        .animation(.bouncy, value: showModal)
    }
}

extension View {
    func showModal(showModal: Binding<Bool>,@ViewBuilder content: () -> some View) -> some View {
        self
            .overlay(content: {
                ModalSupportView(showModal: showModal) {
                    content()
                }
            })
    }
}

private struct PrivewView: View {
    
    @State private var showModal: Bool = false
    
    var body: some View {
        ZStack {
            Button("Click Me"){
                showModal = true
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .showModal(showModal: $showModal) {
                RoundedRectangle(cornerRadius: 30)
                    .padding(40)
                    .padding(.vertical, 100)
                    .onTapGesture {
                        showModal = false
                    }
                    .transition(.slide)
            }        }
    }
}

#Preview {
    PrivewView()
}
