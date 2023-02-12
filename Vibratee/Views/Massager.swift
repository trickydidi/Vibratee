
import CoreHaptics
import SwiftUI

struct Massager: View {
    
    // MARK: - private properties
    @Binding var lock: Bool
    //@Binding var text: String
    public var pattern: Pattern = .pattern1
    
    
    let universalSize = UIScreen.main.bounds //animation
    
    @State var isAnimated = false //animation
    @State private var hidden = false
    @State private var textON = false
    @State private var textLock = false
    @State private var useButton = false
    @State private var showingAlert = false
    @State private var engine: CHHapticEngine? //attach handlers to resume activity
    @State private var player: CHHapticAdvancedPatternPlayer?
    @StateObject private var settings = Settings.shared
    
    // MARK: - UI
    
    var body: some View {
        
        ZStack{
            Color("Secondary")
                .ignoresSafeArea()
            ZStack {
            getSinWave(interval: universalSize.width * 1.5, amplitude: 110, baseline: 65 + universalSize.height/1.8)
               .foregroundColor(Color("Wave1").opacity(0.6))
               .offset(x: isAnimated ? -1*(universalSize.width*1.5) : 0)
               .animation(isAnimated ?
                   Animation.linear(duration: 5)
                           .repeatForever(autoreverses: false) : .default
               )
               
           getSinWave(interval: universalSize.width, amplitude: 200, baseline: 70 + universalSize.height/1.8)
               .foregroundColor(Color("Wave2").opacity(0.4))
               .offset(x: isAnimated ? -1*universalSize.width : 0)
               .animation(isAnimated ?
                   Animation.linear(duration: 11)
                           .repeatForever(autoreverses: false) : .default
                          
               )
           
           getSinWave(interval: universalSize.width*3, amplitude: 200, baseline: 95 + universalSize.height/1.8)
               .foregroundColor(Color("Wave4").opacity(0.6))
               .offset(x: isAnimated ? -1*(universalSize.width*3) : 0)
               .animation(isAnimated ?
                   Animation.linear(duration: 4)
                           .repeatForever(autoreverses: false) : .default
               )
           getSinWave(interval: universalSize.width*1.2, amplitude: 50, baseline: 75 + universalSize.height/1.8)
               .foregroundColor(Color("Wave3").opacity(0.5))
               .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
               .animation(isAnimated ?
                   Animation.linear(duration: 5)
                       .repeatForever(autoreverses: false) : .default
)
            }
            GeometryReader { geo in
            VStack (spacing: 0){
                HStack {
                                    Button(action: { 
                                        self.showingAlert = true
                                    }) {
                
                                        Image(systemName: "questionmark.circle")
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 24))
                                            .opacity(hidden ? 0 : 1)
                                    }
                                    .alert(isPresented: $showingAlert) {
                                        Alert(title: Text("Not vibrating?"), message: Text("""
                                                                                           Please make sure that haptics are enabled in your device settings:
                        
                        1) [Settings -> Sounds & Haptics] and switch on \"Vibrate on ring,\" \"Vibrate on Silent,\" and \"System Haptics.\"
                                                                                        2) [Settings -> Accessibility -> Touch] and switch on \"Vibration.\"
                        """), dismissButton: .default(Text("Ok")))
                                    }.padding()
                                    Spacer()
                                }.padding()
                
                Text(settings.text)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(hidden ? 0 : 1)
                                Spacer()

                Text("Press the button")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(hidden ? 0 : 1)
                Text(textON ? "to stop a massage" : "to start a massage")
                    .font(.title3)
                    .foregroundColor(.white).cornerRadius(20)
                    .opacity(hidden ? 0 : 0.7)
                

                
                
                HStack(spacing: 0){
                    
                    Spacer()
                    
                    Button(action: {
                        if player == nil {
                            prepareHaptics()
                            playPattern(pattern)
                        } else {
                            try? player?.stop(atTime: 0)
                            player = nil
                        }
                        self.isAnimated.toggle()
                        self.textON.toggle()
                        self.useButton.toggle()
                    }){
                        Image(useButton ? "ButtonON" : "ButtonOFF")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
//                            .frame(width: geo.size.width / 2)

                    }.opacity(hidden ? 0 : 1)
                    
                    Spacer()
                        .overlay(
                            HStack{
                                VStack {
                                    Circle().fill(LinearGradient(colors: [Color("SecondaryDark"), Color("SecondaryLight")], startPoint: .top, endPoint: .bottom))
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(lock ? "Locked" : "Unlocked")
                                        ).onTapGesture {
                                            lock = true
                                            textLock = true
                                            hidden = true
                                        }
                                        .gesture(
                                            LongPressGesture(minimumDuration: 1)
                                                .onEnded {_ in
                                                    lock = false
                                                    textLock = false
                                                    hidden = false
                                                    
                                                }
                                        )
                                    Text(textLock ? "Hold the button to unlock" : "")
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.secondary)
                                    
                                }
                                Spacer()
                            })
                }.frame(height: geo.size.height / 4)
                Spacer()
                Spacer()
            }
            }

        }
        .onDisappear {
            try? player?.stop(atTime: 0)
            player = nil
            useButton = false
            textON = false
            isAnimated = false
        }
        
        
        
    }
    
    // MARK: - private functions
    
    private func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path {
            path in
            path.move(to: CGPoint(x: 0, y: baseline
                                 ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            
        }
    }
    
    
    
    private func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the error: \(error.localizedDescription)")
        }
    }
    
    private func playPattern(_ pattern: Pattern) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        let events = Settings.shared.getEvents()
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            player = try engine?.makeAdvancedPlayer(with: pattern)
            player?.loopEnabled = true
            try player?.start(atTime: .zero)
        } catch {
            print("Failed to play pattern \(error.localizedDescription)")
        }
    }
}


// MARK: - Preview

struct Vibrator_Previews: PreviewProvider {
    static var previews: some View {
        Massager(lock: .constant(false))
            .previewDevice("iPhone 8")
        
        Massager(lock: .constant(false))
            .previewDevice("iPhone 11")
        
        Massager(lock: .constant(false))
            .previewDevice("iPhone 12 Pro Max")
    }
}

