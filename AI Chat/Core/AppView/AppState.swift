//
//  AppState.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-03-10.
//
import SwiftUI

@Observable
class AppState {
    
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.showTabBarView = showTabBar
        }
    }

    init(showTabBar: Bool = UserDefaults.showTabBarView) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBarView: Bool) {
        self.showTabBar = showTabBarView
    }
}

extension UserDefaults {
    
    private struct Keys {
        static let showTabBarView = "showTabBarView"
        static let appThemeColor = "appThemeColor"
    }
    
    static var showTabBarView: Bool {
        get {
            return standard.bool(forKey: Keys.showTabBarView)
        } set {
            standard.set(newValue, forKey: Keys.showTabBarView)
        }
    }
}
