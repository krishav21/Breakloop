//
// CapsuleToggle.swift
// Breakloop
//
// Created by Krishav Bepari on 10/14/2025.
//

import SwiftUI

struct CapsuleToggle: View {
    @State var value: Bool
    
    private var alignment: Alignment {
        return value ? .trailing : .leading
    }
    
    var body: some View {
        ZStack(alignment: alignment) {
            Capsule(style: .continuous)
                .frame(width: 72, height: 31)
                .foregroundStyle(value ? .green : .gray.opacity(0.5))
                .shadow(radius: 4)
            
            Capsule(style: .continuous)
                .frame(width: 42, height: 26)
                .foregroundStyle(.white)
                .padding(.horizontal, 2.5)
        }
        .scaleEffect(0.95)
        .onTapGesture { 
            withAnimation(.bouncy(duration: 0.4, extraBounce: 0.15)) { 
                value.toggle() 
            }
        }
    }
}

#Preview {
    @Previewable @State var value: Bool = false
    
    CapsuleToggle(value: value)
}
