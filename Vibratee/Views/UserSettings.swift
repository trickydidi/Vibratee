//
//  UserSettings.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 26.01.2022.
//

import SwiftUI

struct UserSettings: View {
    
    var speed = ["Slow", "Medium", "Fast"]
    var strength = ["Soft", "Medium", "Hard"]
    var disabledImage = Image(systemName: "lock.circle")
    
    // public var text: String = "Tornado"
    
    @State private var disabledSpeed = [1, 2]
    @State private var disabledStrength = [1, 2]
    
    @State private var selectedSpeed = 0
    @State private var selectedStrength = 0
    @State private var selectedIndex: Int = 0
    @State private var showScreen = false
    
    func disableHaptic() {
        disabledSpeed.removeAll()
        disabledStrength.removeAll()
    }
    
    
    
    var body: some View {
        
        
        ZStack {
            
            Color("Wave1").ignoresSafeArea()
            
            ScrollView {
                VStack (spacing: 0){
                    
                    
                    Text("Haptic Speed")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.bottom, 7)
                    
                    
                    let bindingSpeed = Binding<Int>(get: {
                        self.selectedSpeed
                    }) { (i) in
                        if self.disabledSpeed.contains(i) && !UserDefaults.standard.bool(forKey: "purchaseMade"){ showScreen = true} else {
                            self.selectedSpeed = i
                        }
                    }
                    
                    Picker("Choose a speed", selection: bindingSpeed) {
                        if UserDefaults.standard.bool(forKey: "purchaseMade"){
                            ForEach(0..<speed.count, id: \.self) { index in
                                Text(self.speed[index])
                            }
                        } else {
                            Text(speed[0])
                                .tag(0)
                            disabledImage
                                .tag(1)
                            disabledImage
                                .tag(2)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .onChange(of: selectedSpeed) { newValue in
                            guard let speed = Speed(rawValue: speed[selectedSpeed]) else { return }
                            Settings.shared.speed = speed
                        }.padding(.bottom, 15)
                        .padding(.horizontal, 15)
                        .fullScreenCover(isPresented: $showScreen, content: {
                            UnlockEverything()
                        })
                    
                    Text("Haptic Strength")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.bottom, 7)
                    
                    let bindingStrength = Binding<Int>(get: {
                        self.selectedStrength
                    }) { (i) in
                        if self.disabledStrength.contains(i) && !UserDefaults.standard.bool(forKey: "purchaseMade") {showScreen = true} else {
                            self.selectedStrength = i
                        }
                    }
                    
                    Picker("Chose a speed", selection: /*$selectedStrength*/ bindingStrength) {
                        if UserDefaults.standard.bool(forKey: "purchaseMade"){
                            ForEach(0..<strength.count, id: \.self) { index in
                                Text(self.strength[index])
                            }
                        } else {
                            Text(strength[0])
                                .tag(0)
                            disabledImage
                                .tag(1)
                            disabledImage
                                .tag(2)
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                        .onChange(of: selectedStrength) { newValue in
                            guard let strength = Strength(rawValue: strength[selectedStrength]) else { return }
                            Settings.shared.strength = strength
                        }.padding(.horizontal, 15)
                        .fullScreenCover(isPresented: $showScreen, content: {
                            UnlockEverything()
                        })
                    
                    Spacer()
                    
                    Text("Vibration Patterns")
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                        .font(.headline)
                        .padding(.vertical, 20)
                    
                    VStack (spacing: 20) {
                        
                        HStack (spacing: 0){
                            
                            ForEach(0..<3) { subIndex in
                                let pat = customPatterns1[subIndex]
                                
                                if subIndex != 1 {
                                    Spacer()
                                }
                                
                                PatternOptionView(pat: pat, isSelected: subIndex == selectedIndex, action: {
                                    
                                    selectedIndex = subIndex
                                })
                                
                                
                                if subIndex != 1 {
                                    Spacer()
                                }
                                
                            }
                        }
                        
                        HStack (spacing: 0){
                            ForEach(3..<6) { subIndex in
                                let pat = customPatterns1[subIndex]
                                
                                if subIndex != 4 {
                                    Spacer()
                                }
                                
                                PatternOptionView(pat: pat, isSelected: subIndex == selectedIndex, action: {
                                    selectedIndex = subIndex
                                })
                                
                                if subIndex != 4 {
                                    Spacer()
                                }
                            }
                        }
                        
                     
                        HStack (spacing: 0){
                            ForEach(6..<9) { subIndex in
                                let pat = customPatterns1[subIndex]
                                
                                if subIndex != 7 {
                                    Spacer()
                                }
                                
                                PatternOptionView(pat: pat, isSelected: subIndex == selectedIndex, action: {
                                    selectedIndex = subIndex
                                })
                                
                                if subIndex != 7 {
                                    Spacer()
                                }
                                
                            }
                        }
                        
                        HStack (spacing: 0){
                            ForEach(9..<12) { subIndex in
                                let pat = customPatterns1[subIndex]
                                
                                if subIndex != 10 {
                                    Spacer()
                                }
                                
                                PatternOptionView(pat: pat, isSelected: subIndex == selectedIndex, action: {
                                    selectedIndex = subIndex
                                })
                                
                                if subIndex != 10 {
                                    Spacer()
                                }
                                
                            }
                        }
                    }
                    Spacer()
                    
                }
            }
        }
    }
}


struct UserSettings_Previews: PreviewProvider {
    static var previews: some View {
        UserSettings()
    }
}

