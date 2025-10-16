//
// CapsuleStepper.swift
// Breakloop
//
// Created by Krishav Bepari on 10/13/2025.
//

import SwiftUI

struct CapsuleStepper: View {
    @Binding var value: Double
    var step: Double
    var range: ClosedRange<Double>
    let label: String
    
    var body: some View {
        HStack(spacing: 4.0) {
            Text(label)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .monospacedDigit()
                .contentTransition(.numericText(value: value))
                .padding(.leading, 8.0)
            
            Spacer()
            
            Button(action: addToValue) {
                Image(systemName: "plus")
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 30)
                    .background(.ultraThinMaterial, in: .capsule)
            }
            .buttonStyle(BouncyButtonStyle())
            
            Button(action: removeFromValue) {
                Image(systemName: "minus")
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 30)
                    .background(.ultraThinMaterial, in: .capsule)
            }
            .buttonStyle(BouncyButtonStyle())
        }
        .padding(8.0)
        .background(.ultraThinMaterial, in: .capsule)
        .shadow(radius: 4)
    }
    
    private func addToValue() {
        withAnimation(.spring) {
            if value < range.upperBound { value += step }
        }
    }
    
    private func removeFromValue() {
        withAnimation(.spring) {
            if value > range.lowerBound { value -= step }
        }
    }
}
