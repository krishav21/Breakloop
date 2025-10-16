//
// ActivityCard.swift
// Breakloop
//
// Created by Krishav Bepari on 10/11/2025.
//

import SwiftUI

struct ActivityCard: View {
    @Binding var activity: Activity
    
    var body: some View {
        HStack(spacing: 8.0) {
            Image(systemName: activity.systemImage)
                .font(.title)
                .foregroundStyle(activity.imageColor)
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text(activity.title)
                    .font(.headline)
                
                Text(activity.description)
                    .font(.caption)
            }
        }
        .padding(16.0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 24.0, style: .continuous))
        .shadow(radius: 4)
    }
}
