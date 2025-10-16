//
// SettingsView.swift
// Breakloop
//
// Created by Krishav Bepari on 10/13/2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var manager: TimerManager
    @Environment(\.dismiss) private var dismiss
    
    @State private var applications: [Application] = Application.all
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24.0) {
            HStack {
                CircularIImageButton(systemImage: "xmark", isPrimary: false, disabled: .constant(false)) { dismiss() }
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text("Activity Time")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .foregroundStyle(.secondary)
                    .padding(.leading, 16.0)
                
                CapsuleStepper(value: $manager.activityTime, step: 300.0, range: 600.0...3600.0, label: manager.activityTime.formattedTime())
            }
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text("Apps")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                    .foregroundStyle(.secondary)
                    .padding(.leading, 16.0)
                
                VStack(alignment: .leading, spacing: 4.0) {
                    ForEach(applications, id: \.id) { app in
                        HStack(spacing: 8.0) {
                            Image(app.badge)
                                .resizable()
                                .frame(width: 28, height: 28)
                                .clipShape(.rect(cornerRadius: 7.0))
                                .padding(.leading, 2.0)
                            
                            Text(app.name)
                            Spacer()
                            CapsuleToggle(value: app.hasDowntime)
                        }
                        .padding(4.0)
                    }
                }
                .padding(8.0)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 24.0))
            }
        }
        .padding(16.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
