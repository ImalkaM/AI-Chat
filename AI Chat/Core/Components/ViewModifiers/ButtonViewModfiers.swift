//
//  ButtonViewModfiers.swift
//  AI Chat
//
//  Created by Imalka Muthukumara on 2026-05-05.
//

import SwiftUI

struct HiglightButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .overlay {
                configuration.isPressed ? Color.accent.opacity(0.4) : Color.accent.opacity(0)
            }
            .animation(.smooth, value: configuration.isPressed)
    }
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

enum ButtonStyleOption {
    case press, highlight, plain
}

extension View {
    @ViewBuilder
    func anyButton(_ option: ButtonStyleOption = ButtonStyleOption.plain, action: @escaping () -> Void) -> some View {
        switch option {
        case .press:
            pressableButton(action: action)
        case .highlight:
            highlightButton(action: action)
        case .plain:
            plainbButton(action: action)
        }
    }
    
    private func plainbButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())

    }
    
    private func highlightButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(HiglightButtonStyle())

    }
    
    private func pressableButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
    }
}

#Preview {
    VStack {
       Text("Hello World")
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .anyButton(.highlight, action: {
                //
            })
        
        Text("Hello World")
            .callToActionButtonStyle()
            .anyButton(.press, action: {
                //
            })
             .padding()
        
        Text("Hello World")
            .callToActionButtonStyle()
            .anyButton(.plain, action: {
                //
            })
             .padding()
    }
}
