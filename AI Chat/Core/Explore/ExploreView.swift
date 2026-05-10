//
//  ExploreView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-06.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    featuredSection
                    categorySection
                    popularSection
                }
                .removeListRowFormatting()
            }
        }
    }
    
    private var featuredSection: some View {
        Section {
            ZStack {
                CarouselView(items: featuredAvatars) { avatar in
                    HeroCellView(
                        title: avatar.name,
                        subtitle: avatar.characterDescription,
                        imageName: avatar.profileImageName
                    )
                    .anyButton {
                        //
                    }
                }
            }
            
        } header: {
            Text("Featured Avatars")
        }
    }
    
    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            CategoryCellView(title: category.rawValue.capitalized)
                                .anyButton {
                                    //
                                }
                        }
                    }
                }
                .frame(height: 140)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
            }
        } header: {
            Text("Categories")
        }
    }
    
    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(.highlight) {
                    //
                }
                .removeListRowFormatting()
            }
        } header: {
            Text("Popular")
        }
    }
}

#Preview {
    ExploreView()
}
