import Foundation
import SwiftUI

struct SectionProduct: View {
    let cardDescription: SectionCardApplicationExample
    let color: Color
    let lightColor: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.clear)
            .cornerRadius(20)
            .frame(width: 240, height: 240)
            .overlay(
                VStack (alignment: .center){
                    Spacer()
                    
                    HStack {
                        Circle()
                            .fill(color)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Text(cardDescription.number)
                                    .font(.custom("Poppins-Bold", size: 15))
                                    .foregroundColor(Color.white)
                            )
                        
                        Spacer()
                        Text(cardDescription.title)
                            .font(.custom("Poppins-Bold", size: 13))
                            .foregroundColor(color)
                        Spacer()
                    }
                    Image(cardDescription.imageName)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 200, height: 160)
                        .foregroundColor(Color.white)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    
                    Text(cardDescription.description)
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(color)
                    
                    Spacer()
                }
                    .padding(.horizontal, 20)
            )
            .background(.white)
            .cornerRadius(20)
            .shadow(color: color, radius: 5, x: 0, y: 5)
    }
}
