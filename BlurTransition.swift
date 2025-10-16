//
// BlurTransition.swift
// Breakloop
//
// Created by Krishav Bepari on 10/11/2025.
//

import SwiftUI

struct BlurTransition: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .scaleEffect(phase.isIdentity ? 1.0 : 0.75)
            .opacity(phase.isIdentity ? 1.0 : 0.0)
            .blur(radius: phase.isIdentity ? 0.0 : 10.0)
            .animation(.spring, value: phase.isIdentity)
    }
}
