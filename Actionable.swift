//
// Actionable.swift
// Breakloop
//
// Created by Krishav Bepari on 10/15/2025.
//

import Foundation

protocol Actionable {
    var systemImage: String { get set }
    var disabled: Bool { get set }
    var action: () -> Void { get set }
}
