import Foundation
import SwiftUI

struct SectionDescription: View {
    let cardDescription: SectionCardDescription
    let color: Color
    let lightColor: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.clear)
            .cornerRadius(20)
            .frame(width: 550, height: 550)
            .overlay(
                VStack (alignment: .center, spacing: 20){
                    Text(cardDescription.description)
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundColor(color)
                        .multilineTextAlignment(.center)
                }
                    .padding(20)
            )
            .background(lightColor)
    }
}
