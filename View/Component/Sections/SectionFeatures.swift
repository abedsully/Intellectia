import Foundation
import SwiftUI

struct SectionFeatures: View {
    let cardDescription: SectionCardApplicationExample
    let color: Color
    let lightColor: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.clear)
            .cornerRadius(20)
            .frame(width: 550, height: 570)
            .overlay(
                VStack (alignment: .center, spacing: 20){
                    HStack {
                        Circle()
                            .fill(color)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Text(cardDescription.number)
                                    .font(.custom("Poppins-Bold", size: 20))
                                    .foregroundColor(Color.white)
                            )
                        
                        Spacer()
                        Text(cardDescription.title)
                            .font(.custom("Poppins-Bold", size: 25))
                            .foregroundColor(color)
                        Spacer()
                    }
                    Image(cardDescription.imageName)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 420, height: 360)
                        .foregroundColor(Color.white)
                        .aspectRatio(contentMode: .fit)
                    
                    Text(cardDescription.description)
                        .font(.custom("Poppins-Regular", size: 15))
                        .foregroundColor(color)
                        .multilineTextAlignment(.center)
                }
                    .padding(20)
            )
            .background(.white)
            .cornerRadius(20)
            .shadow(color: color, radius: 5, x: 0, y: 5)
    }
}
