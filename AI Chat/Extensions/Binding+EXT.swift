//
//  Binding+EXT.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-05-28.
//
import SwiftUI

extension Binding where Value == Bool {
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
