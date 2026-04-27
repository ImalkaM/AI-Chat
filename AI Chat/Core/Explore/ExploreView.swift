//
//  ExploreView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-06.
//

import SwiftUI

struct ExploreView: View {
    
    let avatar = AvatarModel.mock
    
    var body: some View {
        NavigationStack {
            HeroCellView(title: avatar.name,subtitle: avatar.characterDescription,imageName: avatar.profileImageName)
                .frame(height: 200)
                .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
