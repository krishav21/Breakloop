//
// CircularIImageButton.swift
// Breakloop
//
// Created by Krishav Bepari on 10/13/2025.
//

import SwiftUI

struct CircularIImageButton: View, Actionable {
    var systemImage: String
    var isPrimary: Bool
    @Binding var disabled: Bool
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            if isPrimary {
                Image(systemName: systemImage)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(disabled ? .gray.opacity(0.5) : .white)
                    .frame(width: 45, height: 45)
                    .background(disabled ? .gray.opacity(0.2) : .orange, in: .circle)
            } else {
                Image(systemName: systemImage)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(.gray.opacity(0.2), in: .circle)
            }
        }
        .disabled(disabled)
        .buttonStyle(BouncyButtonStyle())
    }
}

#Preview {
    CircularIImageButton(systemImage: "xmark", isPrimary: true, disabled: .constant(false)) {}
}
