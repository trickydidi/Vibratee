

import SwiftUI

struct UnlockEverything: View {
    
    @State private var buttonSelected: Int? = 1
    @State private var selection = 0
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject public var store: Store
   
    let universalSize = UIScreen.main.bounds
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        
        
        ZStack {
            
            Color("Wave1")
                .ignoresSafeArea()
            
            getSinWave(interval: universalSize.width * 1.5, amplitude: 110, baseline: 65 + universalSize.height/1.8)
                .foregroundColor(Color("Wave2").opacity(0.9))

            getSinWave(interval: universalSize.width, amplitude: 100, baseline: 70 + universalSize.height/1.8)
                .foregroundColor(Color("Primary").opacity(0.3))

            getSinWave(interval: universalSize.width*3, amplitude: 200, baseline: 95 + universalSize.height/1.8)
                .foregroundColor(Color("Wave4").opacity(0.8))
            
            getSinWave(interval: universalSize.width*1.2, amplitude: 150, baseline: 75 + universalSize.height/1.8)
                .foregroundColor(Color("Wave3").opacity(0.5))
            
        GeometryReader { geo in
            VStack (spacing: 0){
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("Primary"))
                        .font(.system(size: 16))
                        .padding(20)
                        //.padding(.top, 15)
                        .opacity(0.5)
                }.frame(maxWidth: .infinity, alignment: .leading)

                
                //MARK: App Icon
                
                Spacer()
                
                VStack (spacing: 0){
                Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .gray, radius: 3)
                    .padding(.bottom, 10)
                
                Text("Vibratee Premium")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundColor(Color("Primary"))
                
                Text("Use Vibratee at its full potential")
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                }.frame(height: geo.size.height / 5)
                    
                
                //MARK: TabView
                
                TabView(selection: $selection) {
                    
                    ForEach(scrollTabs.indices, id: \.self) { index in
                        ScrollTabDetailsView(index: index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: geo.size.height / 3)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                Spacer()
                
                //MARK: Purchase button
                Group {
                Text("Unlock \(Text("Stronger").fontWeight(.bold)), \(Text("Faster").fontWeight(.bold)) and \(Text("more complex").fontWeight(.bold)) vibrations.")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    
                Text("One-time payment of $5.99")
                        //.padding(.top, 5)
                        .foregroundColor(.secondary)
                        .opacity(0.7)
                        .font(.system(size: 16))
                    
                
                Button(action: {
                    
                    if let unlockEverything = store.fetchedProducts.first {
                        store.purchaseProduct(unlockEverything)
                    }
                    
                }){
                    ZStack {
                        RoundedRectangle(cornerRadius: 45)
                            .fill(Color("Primary"))
                            .shadow(color: Color("Primary"), radius: 3, x: 0, y: 2)
                        Text("CONTINUE")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .heavy))
                           
                    }
                }.frame(height: 55)
                    .padding(.horizontal, 36)
                    .padding(.top, 10)
                
                    Button(action: {
                        store.restorePurchases()
                    }) {
                        Text("Restore")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                    }
                }
                
                Spacer()
            }
                
                
                
            
        }
        }
            .onReceive(timer) { time in
                if selection < scrollTabs.count - 1 {
                    selection += 1
                } else {
                    selection = 0
                }
                
        }
        
    }
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

    
}


let scrollTabs = [
    Page(image: "waveform.path", upperText: "All Vibration Patterns", lowerText: "12 vibration modes for all tastes"),
    Page(image: "wind", upperText: "All Speed Levels", lowerText: "Use Vibratee at your own pace"),
    Page(image: "slider.horizontal.3", upperText: "All Strength Levels", lowerText: "Feel full power of Vibratee"),
    Page(image: "hand.raised.slash.fill", upperText: "100% Ad Free", lowerText: "Enjoy Vibratee without ads")
]

struct Page {
    let image: String
    let upperText: String
    let lowerText: String
}

struct UnlockEverything_Previews: PreviewProvider {
    static var previews: some View {
        UnlockEverything()
            .previewDevice("iPhone 8")
        
        UnlockEverything()
            .previewDevice("iPhone 11")
        
        UnlockEverything()
            .previewDevice("iPhone 12 Pro Max")
    }
}
