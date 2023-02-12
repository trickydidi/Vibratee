

import SwiftUI

struct ContentView: View {
    
    
    @State private var lock = false
    @State private var selection = 1
  
    var body: some View {
        GeometryReader { geometry in
            
               
                
                VStack(spacing: 0) {
                   
                    
                    ZStack {
                        TabView(selection: $selection) {
                            UserSettings()
                                .tag(0)

                            Massager(lock: $lock)
                        
                                .tag(1)

                            MoreView()
                                .tag(2)

                        }
                    
                        VStack (spacing: 0){
                            Spacer()
                            if lock != true {
                                TabBarView(selection: $selection)
                                
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: geometry.size.width,
                                           height: geometry.safeAreaInsets.bottom,
                                           alignment: .center)
                            }
                        }.ignoresSafeArea()
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
               
                }
           
        }.onAppear {
            UITabBar.appearance().isHidden = true
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
        
    }
}



