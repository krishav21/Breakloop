//
// RoundedImageButton.swift
// Breakloop
//
// Created by Krishav Bepari on 10/11/2025.
//

import SwiftUI

struct RoundedImageButton: View, Actionable {
    var systemImage: String
    @Binding var disabled: Bool
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemImage)
                .foregroundStyle(.foreground)
                .font(.title2)
                .fontWeight(.medium)
                .frame(width: 35, height: 35)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 12.0, style: .continuous))
        }
        .disabled(disabled)
        .opacity(disabled ? 0.5 : 1.0)
        .buttonStyle(BouncyButtonStyle())
    }
}
