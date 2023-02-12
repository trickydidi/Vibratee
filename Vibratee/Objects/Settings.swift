//
//  Settings.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 01.02.2022.
//

import Foundation
import CoreHaptics
import Combine

class Settings: NSObject, ObservableObject {
    public static var shared = Settings()
    
    var pattern: Pattern = .pattern1
    var speed: Speed = .slow
    var strength: Strength = .soft
    @Published var text: String = customPatterns1[0].text
    
    override init() {
        super.init()
    }
    
    func getEvents() -> [CHHapticEvent] {
        return pattern.getEvents(for: speed, strength: strength)
    }
    
}
