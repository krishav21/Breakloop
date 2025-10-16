//
// CapsuleLabelButton.swift
// Breakloop
//
// Created by Krishav Bepari on 10/11/2025.
//

import SwiftUI

struct CapsuleLabelButton: View, Actionable {
    var titleKey: String
    var systemImage: String
    @Binding var disabled: Bool
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Label(titleKey, systemImage: systemImage)
                .foregroundStyle(.foreground)
                .fontWeight(.medium)
                .padding(12.0)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial, in: .capsule)
        }
        .disabled(disabled)
        .opacity(disabled ? 0.5 : 1.0)
        .buttonStyle(BouncyButtonStyle())
    }
}
