//
//  SwiftUIView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-06-04.
//

import SwiftUI

struct CategoryListView: View {
    
    var category: CharacterOption = .alien
    var imageName: String = Constants.randomImage
    @State private var avatars: [AvatarModel] = AvatarModel.mocks
    @Binding var path: [NavigationOption]
    
    var body: some View {
        ZStack {
            List {
                CategoryCellView(
                    title: category.plural.capitalized,
                    imageName: imageName,
                    font: .largeTitle,
                    conrnerRadius: 0
                    
                )
                .removeListRowFormatting()
                
                ForEach(avatars, id: \.self) { avatar in
                    CustomListCellView(
                        imageName: avatar.profileImageName,
                        title: avatar.name,
                        subtitle: avatar.characterDescription
                    )
                    .anyButton(.highlight) {
                        onPressCategoryListView(avatar: avatar)
                    }
                    .removeListRowFormatting()
                }
            }
            .ignoresSafeArea()
            .listStyle(PlainListStyle())
        }
    }
    
    private func onPressCategoryListView(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
    }
}

#Preview {
    CategoryListView(path: .constant([]))
}
