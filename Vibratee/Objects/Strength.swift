//
//  Strength.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 01.02.2022.
//

import Foundation

enum Strength: String {
    case soft = "Soft"
    case medium = "Medium"
    case hard = "Hard"
    
    var value: Float {
        switch self {
        case .soft:
            return 0.75
        case .medium:
            return 0.85
        case .hard:
            return 1
        }
    }
}
