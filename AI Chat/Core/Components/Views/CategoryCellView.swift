//
//  CategoryCellView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-05-05.
//

import SwiftUI

struct CategoryCellView: View {
    
    var title = "Aliens"
    var imageName = Constants.randomImage
    var font: Font = .title2
    var conrnerRadius: CGFloat = 16
    
    var body: some View {
        ImageLoaderView(url: imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading) {
                Text(title)
                    .font(font)
                    .fontWeight(.semibold)
                    .padding(16)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .addingRadientBackground()
            }
            .cornerRadius(conrnerRadius)
    }
}

#Preview {
    VStack {
        CategoryCellView()
            .frame(width: 150)
        
        CategoryCellView()
            .frame(width: 300)
    }
}
