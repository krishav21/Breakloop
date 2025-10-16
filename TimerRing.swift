//
// TimerRing.swift
// Breakloop
//
// Created by Krishav Bepari on 10/10/2025.
//

import SwiftUI

struct TimerRing: View {
    @Binding var manager: TimerManager
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.white.opacity(0.08), lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: manager.timeProgress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.49, green: 0.36, blue: 1.0),
                            Color(red: 0.37, green: 0.78, blue: 1.0)
                        ]),
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .butt)
                )
                .rotationEffect(.degrees(-90))
                .shadow(color: .black.opacity(0.6), radius: 10)
            
            VStack(spacing: 4.0) {
                if !manager.hasTimerStarted {
                    RoundedImageButton(systemImage: "plus", disabled: .constant(false)) { 
                        withAnimation(.spring) {
                            if manager.screenTime < 3600 { manager.screenTime += 30 }
                        }
                    }
                    .transition(BlurTransition())
                } else {
                    Text(manager.timerText)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundStyle(.secondary)
                        .contentTransition(.numericText())
                        .transition(BlurTransition())
                }
                
                Text(manager.time.formattedTime())
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                    .monospacedDigit()
                    .contentTransition(.numericText(value: !manager.isOnActivity ? manager.screenTime : manager.activityTime))
                
                if !manager.hasTimerStarted {
                    RoundedImageButton(systemImage: "minus", disabled: .constant(false)) { 
                        withAnimation(.spring) {
                            if manager.screenTime > 0 { manager.screenTime -= 30 }
                        }
                    }
                    .transition(BlurTransition())
                } else {
                    Text(".")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .foregroundStyle(.clear)
                        .contentTransition(.numericText())
                        .transition(BlurTransition())
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16.0)
    }
}
