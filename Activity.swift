//
// Activity.swift
// Breakloop
//
// Created by Krishav Bepari on 10/11/2025.
//

import SwiftUI

struct Activity: Identifiable, Hashable {
    let id: UUID = .init()
    
    var systemImage: String
    var imageColor: Color
    
    var title: String
    var description: String   
}
