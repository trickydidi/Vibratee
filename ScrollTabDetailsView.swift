//
//  ScrollTabDetailsView.swift
//  VibratorSwiftUI
//
//  Created by Daiana koishebayeva on 10.02.2022.
//

import SwiftUI

struct ScrollTabDetailsView: View {
    let index: Int
    
    var body: some View {
        VStack (spacing: 0){
            Circle().fill(.white)
                .frame(width: 70, height: 70)
                .shadow(color: Color("Primary"), radius: 5)
                .overlay(
                   
                        Image(systemName: scrollTabs[index].image)
                            .font(.system(size: 28))
                            .foregroundColor(colors[index].color)
                    
            )
            
            Text(scrollTabs[index].upperText)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .padding(.top, 15)
            Text(scrollTabs[index].lowerText)
                .padding(.top, 5)
        }
    }
}

let colors = [
    Colors(color: .red),
    Colors(color: .blue),
    Colors(color: .yellow),
    Colors(color: .black)
]

struct Colors {
    let color: Color
}

struct ScrollTabDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollTabDetailsView(index: 0)
    }
}
