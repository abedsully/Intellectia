import SwiftUI

struct InfoView: View {
    
    @State private var dismiss: Bool = false
    @State private var fontDescription: Font?
    @State private var isCardPresented = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.white
                .onTapGesture {
                    isCardPresented = false
                }
            
            
            VStack(alignment: .center) {
                if !dismiss {
                    VStack(alignment: .center, spacing: 30) {
                        
                        Spacer()
                        
                        Text("Welcome to Intellectia")
                            .font(.custom("Poppins-Regular", size: 50))
                        
                        Text("Intellectia is a home to Artificial Intelligence. There are 4 sections which we will dig into:")
                            .font(.custom("Poppins-Light", size: 18))
                            .multilineTextAlignment(.leading)
                        
                        HStack(alignment: .center, spacing: 10) {
                            VStack(spacing: 0) {
                                Image("vision-img")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 125, height: 120)
                                
                                Text("Vision")
                                    .font(.custom("Poppins-Light", size: 15))
                                    .foregroundColor(Color.mainColor)
                                    .multilineTextAlignment(.center)
                                    .frame(minHeight: 50) // Adjust height to make them equal
                            }
                            
                            VStack(spacing: 0) {
                                Image("natural_language_processing-img")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 125, height: 120)
                                
                                Text("Natural Language Processing")
                                    .font(.custom("Poppins-Light", size: 15))
                                    .foregroundColor(Color.secondaryColor)
                                    .multilineTextAlignment(.center)
                                    .frame(minHeight: 50) // Adjust height to make them equal
                            }
                            
                            VStack(spacing: 0) {
                                Image("sentiment_analysis-img")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 125, height: 120)
                                
                                Text("Sentiment Analysis")
                                    .font(.custom("Poppins-Light", size: 15))
                                    .foregroundColor(Color.thirdColor)
                                    .multilineTextAlignment(.center)
                                    .frame(minHeight: 50) // Adjust height to make them equal
                            }
                            
                            VStack(spacing: 0) {
                                Image("quiz-img")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 125, height: 120)
                                
                                Text("Quiz")
                                    .font(.custom("Poppins-Light", size: 15))
                                    .foregroundColor(Color.fourthColor)
                                    .multilineTextAlignment(.center)
                                    .frame(minHeight: 50) // Adjust height to make them equal
                            }
                        }
                        
                        Text("There will be the definition, features, application, and implementation in the sections. Don't forget finish the quiz at the end of your journey! Good Luck!")
                            .font(.custom("Poppins-Light", size: 17))
                            .multilineTextAlignment(.leading)
                        
                        
                        
                        
                        HStack (alignment: .center){  
                            Text("Made by: Stefanus Albert Wilson")
                                .font(.custom("Poppins-Light", size: 15))
                            
                            
                            
                            Spacer()
                            
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Rectangle()
                                    .fill(Color.gray)
                                    .cornerRadius(10)
                                    .frame(width: 150, height: 50)
                                    .overlay(
                                        Text("Let's Go")
                                            .foregroundColor(.white)
                                    )
                            }
                            
                        }
                        .padding(.horizontal, 10)
                        
                        Spacer()
                        
                    }
                    .padding(25)
                    
                    
                } else {
                    MainView()
                }
            }
        }
    }
}
