//
//  ProfileModelView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-06-01.
//

import SwiftUI

struct ProfileModalView: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "An alien in the park"
    var onXMarkPressed: () -> Void
    
    var body: some View {
        VStack {
            if let imageName {
                ImageLoaderView(url: imageName, forceTranasitionAnimation: true)
                    .aspectRatio(1,contentMode: .fit)
                    .overlay(alignment: .topTrailing) {
                        
                    }
            }
            VStack(alignment: .leading,spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.leading, 24)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .background(.thinMaterial)
        .frame(width: 300,height: 400)
        .cornerRadius(16)
        .overlay(alignment: .topTrailing){
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundStyle(Color.black)
                .padding(4)
                .tappableBackground()
                .anyButton(action: {
                    onXMarkPressed()
                })
                .padding()
        }
        
    }
}

#Preview {
    ProfileModalView(onXMarkPressed: {})
}
