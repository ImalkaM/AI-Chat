//
//  MockAuthService.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-06-15.
//

struct MockAuthService: AuthService {
    
    let currentUser: UserAuthInfo?
    
    init(currentUser: UserAuthInfo? = nil) {
        self.currentUser = currentUser
    }
    
    func getAuthenticatedUser() -> UserAuthInfo? {
        currentUser
    }
    
    func signInAnonymously() async throws -> (user: UserAuthInfo, isNewUser: Bool) {
        let user = UserAuthInfo.mock(isAnonymous: true)
        return (user, true)
    }
    
    func signInApple() async throws -> (user: UserAuthInfo, isNewUser: Bool) {
        let user = UserAuthInfo.mock(isAnonymous: false)
        return (user, false)
    }
    
    func signOut() throws {
        
    }
    
    func deleteAccount() async throws {
        
    }
}
