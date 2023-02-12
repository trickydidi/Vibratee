
import SwiftUI

struct PatternOptionView: View {
    var pat: PatternView
    var isSelected: Bool
    let action: () -> Void
    @State private var showScreen = false
    
    var body: some View {
        
        Button(action: {
            if (pat.isLocked && !UserDefaults.standard.bool(forKey: "purchaseMade")) {
                showScreen = true
            } else {
            Settings.shared.pattern = pat.pattern
            Settings.shared.text = pat.text
            action()
            }
                        
        }) {
            VStack(spacing: 0){
               
                ZStack(alignment: .topTrailing) {
                Rectangle()
                    .fill(isSelected ? Color("Primary") : .white)
                    .frame(width: UIScreen.main.bounds.width / 4.2, height: UIScreen.main.bounds.width / 4.2)
                    .cornerRadius(15)
                    .contentShape(Rectangle())
                    .overlay(
                    
                Image(systemName: pat.image)
                    .font(.system(size: 32))
                    .foregroundColor(isSelected ? .white : Color("Primary"))
                  )
                    
                    if pat.isLocked && !UserDefaults.standard.bool(forKey: "purchaseMade"){
                    Rectangle()
                        .trim(from: 0, to: 0.5)
                        .fill(Color("gold"))
                        .frame(width: UIScreen.main.bounds.width / 8.4, height: UIScreen.main.bounds.width / 8.4)
                        .cornerRadius(15, corners: .topRight)
                        
                    Image("crown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width / 16.8, height: UIScreen.main.bounds.width / 16.8)
                            .padding(3)
                    }
                }

                Text(pat.text)
                    .padding(.top, 5)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
        }
            
            .fullScreenCover(isPresented: $showScreen, content: {
                UnlockEverything()
            })
        
        
    }
}

struct PatternOptionView_Previews: PreviewProvider {
    static var previews: some View {
        PatternOptionView(pat: customPatterns1[0], isSelected: true, action: {})
    }
}
