//
//  TextValidationHelper.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-05-27.
//
import Foundation

struct TextValidationHelper {
    
    static func checkIftextIsValid(text: String) throws {
        let minimumCharacterCount = 3
        
        guard text.count >= minimumCharacterCount else {
            throw  TextValidationError.notEnoughCharacters(min: minimumCharacterCount)
        }
        
        let badWords: [String] = [
            "shit", "bitch", "ass"
        ]
        
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }
    
    enum TextValidationError: LocalizedError {
        case notEnoughCharacters(min: Int)
        case hasBadWords
        
        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters(min: let min):
                return "Please add at lease \(min) chracters"
            case .hasBadWords:
                return "Bad words detected. Please replhrase your message."
            }
        }
    }
}




