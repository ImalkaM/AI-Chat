//
//  ChatRowCellView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-05-11.
//

import SwiftUI

struct ChatRowCellView: View {
    
    var imageName: String? = Constants.randomImage
    var headline: String? = "Hello, World!"
    var subheadline: String? = "last message in the chat"
    var hasNewChat: Bool = true
    
    var body: some View {
        HStack(spacing: 8){
            ZStack {
                if let imageName {
                    ImageLoaderView(url: imageName)
                    
                }else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
                
            }
            .clipShape(Circle())
            .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 4){
                if let headline {
                    Text(headline)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                if let subheadline {
                    Text(subheadline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            if hasNewChat {
                Text("New")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .cornerRadius(6)
            }
        }
        .padding(.vertical,12)
        .padding(.horizontal,8)
        .background(Color(uiColor: UIColor.systemBackground))
    }
}

#Preview {
    ZStack {
        List {
            ChatRowCellView()
                .removeListRowFormatting()
            ChatRowCellView(hasNewChat: false)
                .removeListRowFormatting()
            ChatRowCellView(imageName: nil)
                .removeListRowFormatting()
            ChatRowCellView(headline: nil)
                .removeListRowFormatting()
            ChatRowCellView(subheadline: nil,hasNewChat: false)
                .removeListRowFormatting()
        }
    }}
