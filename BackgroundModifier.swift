//
// BackgroundModifier.swift
// Breakloop
//
// Created by Krishav Bepari on 10/11/2025.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    var alignment: Alignment
    
    func body(content: Content) -> some View {
        content
            .safeAreaPadding(16.0)
            .frame(maxWidth: .infinity, alignment: alignment)
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 36.0, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 36.0, style: .continuous)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1.0)
            }
    }
}
