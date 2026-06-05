//
//  NavigationPathOption.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-06-05.
//
import SwiftUI

enum NavigationOption: Hashable {
    case chat(avatarId: String)
    case category(category: CharacterOption, imageName: String)
}

extension View {
    func navigationDestinationForCoreModule(path: Binding<[NavigationOption]>) -> some View {
        self
            .navigationDestination(for: NavigationOption.self) { newValue in
                switch newValue {
                case .chat(avatarId: let avatarId):
                    ChatView(avatarId: avatarId)
                case .category(category: let category, imageName: let imageName):
                    CategoryListView(category: category, imageName: imageName, path: path)
                }
            }
    }
}
