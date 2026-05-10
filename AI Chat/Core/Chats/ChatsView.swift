//
//  ChatsView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-06.
//

import SwiftUI

struct ChatsView: View {
    @State private var chatData:[ChatModel] = ChatModel.mocks
    var body: some View {
        NavigationStack {
            List {
                ForEach(chatData) { data in
                    Text(data.id)
                }
            }
                .navigationTitle("Chats")
        }
    }
}

#Preview {
    ChatsView()
}
