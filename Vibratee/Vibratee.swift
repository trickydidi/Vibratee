//
//  VibratorSwiftUIApp.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 25.01.2022.
//

import SwiftUI

@main
struct Vibratee: App {
    @StateObject private var store = Store()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
