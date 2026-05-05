//
//  CarouselView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-04-27.
//

import SwiftUI

struct CarouselView<Content: View, T: Hashable>: View {
    
    let items: [T]
    @ViewBuilder var content: (T) -> Content
    @State private var selection: T?
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        content(item)
                            .scrollTransition(.interactive.threshold(.visible(0.95)), transition: { content, phase in
                                content
                                    .scaleEffect(phase.isIdentity ? 1 : 0.9)
                            })                    .containerRelativeFrame(.horizontal, alignment: .center)
                    }
                }
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $selection)
            .onChange(of: items.count, { _, _ in
                updateSelectionIfNeeded()
            })
            .onAppear {
                updateSelectionIfNeeded()
            }
            HStack {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .fill(selection == item ? .accent : .secondary.opacity(0.5))
                        .frame(width: 8, height: 8, alignment: .center)
                }
            }
            .animation(.linear, value: selection)
        }
    }
    
    private func updateSelectionIfNeeded() {
        if selection == nil || selection == items.last {
            selection = items.first
        }
    }
}

#Preview {
    CarouselView(items: AvatarModel.mocks) { item in
        HeroCellView(
            title: item.name,
            subtitle: item.characterDescription,
            imageName: item.profileImageName
        )
    }
    .padding()
}
