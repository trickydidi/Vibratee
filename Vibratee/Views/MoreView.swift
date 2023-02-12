//
//  MoreView.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 26.01.2022.
//

import SwiftUI

struct MoreView: View {

    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Wave1")) // Uses UIColor
    }

    @State private var showingAlert = false
    @State private var showScreen = false
    var body: some View {

ZStack {
    Color("Wave1")
        .ignoresSafeArea()
    VStack(spacing: 0) {
        
        List {
            
            
                Button {
                    showScreen.toggle()
                } label: {
                    
                    HStack (spacing: 0){
                        VStack {
                            Text("FULL ACCESS")
                                .fontWeight(.bold)
                                .frame(width: 250, alignment: .leading)
                                .padding(.bottom, 0.5)
                            Text("Try Vibratee on its full potential!")
                                .fontWeight(.light)
                                .frame(width: 250, alignment: .leading)
                            
                            
                        }
                        Spacer()
                        Image("crown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                           
                    }
                .foregroundColor(.white)
              
                }.fullScreenCover(isPresented: $showScreen, content: {
                    UnlockEverything()
                })
                .listRowBackground(LinearGradient(colors: [Color("Primary"), Color("Secondary")], startPoint: .leading, endPoint: .trailing))
                .frame(height: 70)
            
            
            
            Section {
                Button(action: { //Should I use button?
                    print("Button pressed")
                    self.showingAlert = true
                }) {
                    HStack{
                        IconAppearance(imageName: "questionmark.circle", text: "Help")
                    }
                }
                
            }.frame(height: 40)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Not vibrating?"), message: Text("""
                                                                               Please make sure that haptics are enabled in your device settings:
            
            1) [Settings -> Sounds & Haptics] and switch on \"Vibrate on ring,\" \"Vibrate on Silent,\" and \"System Haptics.\"
                                                                            2) [Settings -> Accessibility -> Touch] and switch on \"Vibration.\"
            """), dismissButton: .default(Text("Ok")))
                }
            
            Section {
                
                Link(destination: URL(string: "https://forms.gle/d9vN6F91wfGH53Wn9")!) {
                    HStack {
                        IconAppearance(imageName: "ellipsis.bubble", text: "Send feedback")
                    }
                }
                
                Button(action:  {
                }) {
                    HStack {
                        IconAppearance(imageName: "star", text: "Rate us")
                    }
                }
                
                Button(action: share)
                {
                    HStack {
                        IconAppearance(imageName: "square.and.arrow.up", text: "Share")
                    }
                }
            } .frame(height: 40)
            
        }.padding(.top, 20)
        .onAppear(perform: {
            UITableView.appearance().contentInset.top = -35
        })
        
    }
}
    }
}


struct IconAppearance: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack {
            ZStack{
                
                Rectangle()
                    .fill(Color("Primary"))
                    .frame(width: 24, height: 24)
                    .cornerRadius(5)
                Image(systemName: imageName)
                    .foregroundColor(.white)
                
                
            }
            Text(text)
                .foregroundColor(.secondary)
                .padding(.leading, 5)
        }
    }
    
}

func share() {
    let url = URL(string: "https://apple.com") //what url should I put
    let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
    UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true, completion: nil) //deprecated. Solve the issue later. Did not understand the code
    //Use text also
}

    
    struct MoreView_Previews: PreviewProvider {
        static var previews: some View {
            MoreView()
        }
    }
    
    
    
    
