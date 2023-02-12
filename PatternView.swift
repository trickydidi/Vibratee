//
//  SelectedPatternOption.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 03.03.2022.
//

import Foundation
//import StoreKit

struct PatternView: Hashable {
    var text: String
    var image: String
    var pattern: Pattern
    var isLocked: Bool
    
}

let customPatterns1 = [
    PatternView(text: "Tornado", image: "tornado", pattern: .pattern1, isLocked: false),
    PatternView(text: "Bolt", image: "bolt", pattern: .pattern2, isLocked: false),
    PatternView(text: "Dotted", image: "aqi.medium", pattern: .pattern3, isLocked: false),
    PatternView(text: "Pulse", image: "waveform.path.ecg", pattern: .pattern4, isLocked: true),
    PatternView(text: "Fast Pulse", image: "waveform.path", pattern: .pattern5, isLocked: true),
    PatternView(text: "Heartbeat", image: "heart", pattern: .pulse, isLocked: true),
    PatternView(text: "Sparkle", image: "sparkles", pattern: .pattern7, isLocked: true),
    PatternView(text: "Flame", image: "flame", pattern: .pattern8, isLocked: true),
    PatternView(text: "Storm", image: "tropicalstorm", pattern: .pattern9, isLocked: true),
    PatternView(text: "Rain", image: "drop", pattern: .pattern10, isLocked: true),
    PatternView(text: "Heat", image: "sun.max", pattern: .pattern11, isLocked: true),
    PatternView(text: "Continuous", image: "repeat", pattern: .pattern12, isLocked: true)
]
