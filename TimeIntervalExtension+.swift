//
// TimeIntervalExtension+.swift 
// Breakloop
//
// Created by Krishav Bepari on 10/13/2025.
//

import Foundation

extension TimeInterval {
    func formattedTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
