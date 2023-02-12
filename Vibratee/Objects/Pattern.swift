//
//  Pattern.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 01.02.2022.
//

import Foundation
import CoreHaptics

enum Pattern {
    case pattern1
    case pattern2
    case pattern3
    case pattern4
    case pattern5
    case pulse
    case pattern7
    case pattern8
    case pattern9
    case pattern10
    case pattern11
    case pattern12
    
    func getEvents(for speed: Speed, strength: Strength) -> [CHHapticEvent] { //what is for??
        switch self {
        case .pattern1:
            return createPattern1Events(for: speed, strength: strength)
        case .pattern2:
            return createPattern2Events(for: speed, strength: strength)
        case .pattern3:
            return createPattern3Events(for: speed, strength: strength)
        case .pattern4:
            return createPattern4Events(for: speed, strength: strength)
        case .pattern5:
            return createPattern5Events(for: speed, strength: strength)
        case .pulse:
            return createPulseEvents(for: speed, strength: strength)
        case .pattern7:
            return createPattern7Events(for: speed, strength: strength)
        case .pattern8:
            return createPattern8Events(for: speed, strength: strength)
        case .pattern9:
            return createPattern9Events(for: speed, strength: strength)
        case .pattern10:
            return createPattern10Events(for: speed, strength: strength)
        case .pattern11:
            return createPattern11Events(for: speed, strength: strength)
        case .pattern12:
            return createPattern12Events(for: speed, strength: strength)
        }
        
    }
    
    private func createPattern1Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let long = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: Double(0), duration: 1*coef2) //how to make duration until button pressed
        events.append(long)
        for j in stride(from: 1*coef2, to: 2*coef2, by: 0.1*coef2) {
            let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
            let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
            let short = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: Double(j))
                
            events.append(short)
        }
        
        return events
    }
    
    private func createPattern2Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6*coef)
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8*coef)
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let intensity3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness1], relativeTime: 0))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0.05*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness1], relativeTime: 0.1*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness1], relativeTime: 0.15*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity3, sharpness1], relativeTime: 0.7*coef2))
        
        return events
    }
    
    private func createPattern3Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let long = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: Double(0), duration: 1*coef2) //how to make duration until button pressed
        events.append(long)
        for j in stride(from: 1*coef2, to: 2*coef2, by: 0.1*coef2) {
            let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
            let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
            let short = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: Double(j))
                
            events.append(short)
        }
        
        return events
    }
    
    
    
    private func createPattern4Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        
        let event1 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 0.5*coef2)
        let event2 = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness1], relativeTime: 0.5*coef2, duration: 0.5*coef2)
        events.append(event1)
        events.append(event2)
        
        return events
    }
    
    private func createPattern5Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        
        
        events.append(CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness1], relativeTime: 0*coef2, duration: 1.5*coef2))
        events.append(CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness2], relativeTime: 1.5*coef2, duration: 1.5*coef2))
        for j in stride(from: 1.5*coef2, to: 3*coef2, by: 0.1*coef2) {
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness2], relativeTime: Double(j)))
        }
        
        
        return events
    }
    
    private func createPulseEvents(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]() //Heartbeat
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0)
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.3)
        let intensity3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8*coef)
        let sharpness3 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
        let intensity4 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7*coef)
        let sharpness4 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
        
        
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness2], relativeTime: 0.013*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity3, sharpness3], relativeTime: 0.220*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity4, sharpness4], relativeTime: 0.255*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity], relativeTime: 1*coef2))
        
        return events
    }
    
    private func createPattern7Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] { //*** How to include Parameter Curve
        var events = [CHHapticEvent]() //Rumble. Maybe use audio event for animation
        
        let coef = strength.value
        let coef2 = speed.value
        
//        let curve1 = CHHapticParameterCurve.ControlPoint(relativeTime: 0.0, value: 0.3*coef)
//        let curve2 = CHHapticParameterCurve.ControlPoint(relativeTime: 0.1*coef2, value: 1.0*coef)
//        let curve3 = CHHapticParameterCurve.ControlPoint(relativeTime: 1.0*coef2, value: 1.0*coef)  //Create getParameter function
//        let curve4 = CHHapticParameterCurve.ControlPoint(relativeTime: 1.6*coef2, value: 0.0*coef)
//
//        let parameter = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [curve1, curve2, curve3, curve4], relativeTime: 0) //Can we use the timing?
        
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
        
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0.04*coef2))
                
        return events
    }
    
    private func createPattern8Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]() //Inflate
        
        let coef = strength.value
        let coef2 = speed.value
        
//        let curve1 = CHHapticParameterCurve.ControlPoint(relativeTime: 0, value: 0.0*coef)
//        let curve2 = CHHapticParameterCurve.ControlPoint(relativeTime: 1.1*coef2, value: 0.5*coef)
//        let curve3 = CHHapticParameterCurve.ControlPoint(relativeTime: 1.7*coef2, value: 0.0*coef)
//
//        let parameter = CHHapticParameterCurve(parameterID: .hapticIntensityControl, controlPoints: [curve1, curve2, curve3], relativeTime: 0)
//
//        let curve5 = CHHapticParameterCurve.ControlPoint(relativeTime: 0*coef2, value: -0.8*coef)
//        let curve6 = CHHapticParameterCurve.ControlPoint(relativeTime: 1.7*coef2, value: 0.8*coef)
//
//        let parameter = CHHapticParameterCurve(parameterID: .hapticSharpnessControl, controlPoints: [curve5, curve6], relativeTime: 0)
        
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        
     
        events.append(CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness1], relativeTime: 0*coef2, duration: 1.7))
     
        
        return events
    }
    
    private func createPattern9Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6*coef)
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8*coef)
        let intensity3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5*coef)
        let intensity4 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let intensity5 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.7*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2)
        
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness2], relativeTime: 0.05*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness1], relativeTime: 0.1*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity3, sharpness2], relativeTime: 0.3*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity4, sharpness1], relativeTime: 0.35*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity5, sharpness2], relativeTime: 0.4*coef2))
        
        return events
    }
    
    private func createPattern10Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.5*coef)
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8*coef)
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let intensity3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let sharpness2 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
        
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness1], relativeTime: 0))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness2], relativeTime: 0.02))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0.05*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness2], relativeTime: 0.07*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness1], relativeTime: 0.1*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness2], relativeTime: 0.12*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity3, sharpness1], relativeTime: 0.3*coef2))
        
        return events
    }
    
    private func createPattern11Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        
        events.append(CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity1, sharpness1], relativeTime: 0*coef2, duration: 0.55))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0.1*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0.25*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0.4*coef2))
        
        
        
        return events
    }
    
    private func createPattern12Events(for speed: Speed, strength: Strength) -> [CHHapticEvent] {
        var events = [CHHapticEvent]()
        
        let coef = strength.value
        let coef2 = speed.value
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.6*coef)
        let intensity1 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8*coef)
        let intensity2 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1*coef)
        let intensity3 = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0*coef)
        let sharpness1 = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness1], relativeTime: 0))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity1, sharpness1], relativeTime: 0.05*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness1], relativeTime: 0.1*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity2, sharpness1], relativeTime: 0.15*coef2))
        events.append(CHHapticEvent(eventType: .hapticTransient, parameters: [intensity3, sharpness1], relativeTime: 0.7*coef2))
        
        return events
    }
    
    
    
}
