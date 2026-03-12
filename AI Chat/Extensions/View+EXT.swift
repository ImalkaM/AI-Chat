//
//  View+Ext.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-07.
//
import SwiftUI

extension View {
    func callToActionButtonStyle() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .cornerRadius(16)
    }
    func callToSubButtonStyle() -> some View {
        self
            .font(.subheadline)
            .foregroundStyle(.accent)
            .frame(maxWidth: .infinity)
    }
    
    func tappableBackground() -> some View {
        self
        .background(Color.black.opacity(0.001))
    }
}
