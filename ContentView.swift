//
// ContentView.swift
// Breakloop
//
// Created by Krishav Bepari on 10/10/2025.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var manager: TimerManager = .init()
    @State private var showSettingsSheet: Bool = false
    
    var activityText: String {
        if !manager.isOnActivity {
            return "Upcoming Activity"
        } else {
            return "Current Activity"
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            HStack(alignment: .top, spacing: 4.0) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 30, weight: .bold))
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Hello, Esteemed User!").font(.headline)
                    Text("Ready to get interrupted?").font(.caption)
                }
                
                Spacer()
                
                Button {
                    showSettingsSheet.toggle()
                } label: {
                    Image(systemName: "square.grid.3x3.fill")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(.foreground)
                }
            }
            
            VStack(alignment: .center, spacing: 24.0) {
                TimerRing(manager: $manager)
                    .padding(.top, 12.0)
                
                VStack(spacing: 8.0) {
                    CapsuleLabelButton(titleKey: "Start", systemImage: "play.fill", disabled: $manager.hasTimerStarted, action: manager.startTimer)
                    
                    CapsuleLabelButton(titleKey: "Restart", systemImage: "arrow.clockwise", disabled: .constant(false), action: manager.restartTimer)
                }
            }
            .modifier(BackgroundModifier(alignment: .top))
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(activityText)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .foregroundStyle(.secondary)
                    .padding(.leading, 12.0)
                    .contentTransition(.numericText())
                
                ActivityCard(activity: $manager.activities.first!)
            }
            .modifier(BackgroundModifier(alignment: .topLeading))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(16.0)
        .background(.linearGradient(colors: [.topColor, .bottomColor], startPoint: .top, endPoint: .bottom))
        .onAppear { manager.requestForNotifications() }
        .sheet(isPresented: $showSettingsSheet) { SettingsView(manager: $manager) }
    }
}
