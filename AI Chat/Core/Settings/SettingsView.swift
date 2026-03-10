//
//  SettingsView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-10.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    signoutButtonPressed()
                } label: {
                    Text("Sign out")
                }

            }
            .navigationTitle("Settings")
        }
    }
    
    func signoutButtonPressed() {
        dismiss()
        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
