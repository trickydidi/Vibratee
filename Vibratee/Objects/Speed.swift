//
//  Speed.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 01.02.2022.
//

import Foundation

enum Speed: String {
    case slow = "Slow"
    case medium = "Medium"
    case fast = "Fast"
    
    var value: Double {
        switch self {
        case .slow:
            return 1.5
        case .medium:
            return 1
        case .fast:
            return 0.66
        }
    }
}
