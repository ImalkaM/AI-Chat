//
//  UserAuthInfo+Firebase.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-06-12.
//
import FirebaseAuth

extension UserAuthInfo {
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email
        self.isAnonymous = user.isAnonymous
        self.creationDate = user.metadata.creationDate
        self.lastSignInDate = user.metadata.lastSignInDate
    }
}
