//
//  ImageLoaderView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-11.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var url: String = Constants.randomImage
    var resizeMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                WebImage(url: URL(string: url))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizeMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
}
