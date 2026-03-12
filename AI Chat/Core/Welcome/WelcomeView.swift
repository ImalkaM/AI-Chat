//
//  WelcomeView.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-06.
//

import SwiftUI

struct WelcomeView: View {
    @State var imageUrl = Constants.randomImage
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(url: imageUrl)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 24)
                
                ctaButtons
                    .padding(16)
                
                policyLinks
            }
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 8){
            Text("AI Chat")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
    }
    
    @ViewBuilder private var ctaButtons : some View {
        VStack(spacing: 8){
            NavigationLink {
                OnBoardingCompletedView()
            } label: {
                Text("Get Started")
                    .callToActionButtonStyle()
            }
            Text("Already have an account? Sign in")
                .foregroundStyle(.black)
                .underline()
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    
                }
        }
    }
    
    private var policyLinks : some View {
        HStack {
            Link(destination: URL(string: Constants.privacyPolicy)!) {
                Text("Terms of Service")
            }
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            Link(destination: URL(string: Constants.privacyPolicy)!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
