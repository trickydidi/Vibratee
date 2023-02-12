

import SwiftUI

// MARK: - ROUNDED CORNERS

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


struct TabBarView: View {
    
    @Binding var selection: Int
    @Namespace private var currentTab
    
    
    
    var body: some View {
        
        
        HStack(alignment: .bottom) {
            
            ForEach(tabs.indices, id: \.self) { index in
                
                VStack(spacing: 7) {
                    if selection == index {
                        Color("Primary")
                            .frame(width: UIScreen.main.bounds.width/6, height: 4)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0.7, trailing: 0))
                        
                            .matchedGeometryEffect(id: "currentTab", in: currentTab)
                    }
                    
                    if selection != index {
                        Image(systemName: tabs[index].image)
                            .frame(height: 20, alignment: .center)
                            .font(.system(size: 24))
                    } else {
                        Image(systemName: tabs[index].selectionImage)
                            .frame(height: 20, alignment: .center)
                            .font(.system(size: 24))
                    }
                    
                    Text(tabs[index].label)
                        .frame(alignment: .center)
                        .font(.caption2)
                        .fixedSize()
                }
                .frame(width: UIScreen.main.bounds.width/3, height: 52, alignment: .bottom)
                .foregroundColor(selection == index ? Color("Primary") : .secondary)
                .onTapGesture {
                    withAnimation {
                        selection = index
                    }
                }
            }.frame(height: 52, alignment: .bottom)
            
        }
        .padding(.bottom, 5)
        
        .background(Color.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
 
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: Binding.constant(0))
            .previewLayout(.sizeThatFits)
    }
}

struct Tab {
    let image: String
    let selectionImage: String
    let label: String
}

let tabs = [
    Tab(image: "gearshape", selectionImage: "gearshape.fill", label: "Settings"),
    Tab(image: "waveform.circle", selectionImage: "waveform.circle.fill", label: "Start"),
    Tab(image: "ellipsis.circle", selectionImage: "ellipsis.circle.fill", label: "More"),
]
