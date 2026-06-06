//
//  ChatsView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-06.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    @State private var recentAvatar: [AvatarModel] = AvatarModel.mocks
    
    @State private var path: [NavigationOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                if !recentAvatar.isEmpty {
                    recentChatSection
                }
                chatsSection
            }
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
        }
    }
    
    private var recentChatSection: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 8){
                    ForEach(recentAvatar,id: \.self) { avatar in
                        if let imageName = avatar.profileImageName {
                            VStack(spacing: 8) {
                                ImageLoaderView(url: imageName)
                                    .aspectRatio(1,contentMode:.fit)
                                    .clipShape(.circle)
                                
                                Text(avatar.name ?? "")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .anyButton {
                                onAvatarpressed(avatar: avatar)
                            }
                        }
                    }
                }
            }
            .frame(height: 120)
            .scrollIndicators(.hidden)
            .removeListRowFormatting()
        } header: {
            Text("Recents")
        }
    }
    
    private var chatsSection: some View {
        Section {
            if chats.isEmpty {
                Text("Your chats will appear here!")
                    .foregroundStyle(.secondary)
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(40)
                    .removeListRowFormatting()
            } else {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil,
                        chat: chat) {
                            try? await Task.sleep(for: .seconds(1))
                            return AvatarModel.mocks.randomElement()!
                        } getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return ChatMessageModel.mocks.randomElement()!
                        }
                        .anyButton(.highlight) {
                            onPressChatCell(avatarId: chat.avatarId)
                        }
                        .removeListRowFormatting()
                }
            }
        }
    }
    
    private func onPressChatCell(avatarId: String) {
        path.append(.chat(avatarId: avatarId))
    }
    
    private func onAvatarpressed(avatar: AvatarModel){
        path.append(.chat(avatarId: avatar.avatarId))
    }
}

#Preview {
    ChatsView()
}
