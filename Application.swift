//
// Application.swift
// Breakloop
//
// Created by Krishav Bepari on 10/15/2025.
//

import Foundation

struct Application: Identifiable, Hashable {
    let id: UUID = .init()
    
    var badge: String
    var name: String
    var hasDowntime: Bool
}
