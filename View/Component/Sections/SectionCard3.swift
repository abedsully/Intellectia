import SwiftUI

struct SectionCard3: View {
    var selectedSection: String
    var selectedColor: Color
    @State private var fontDescription: Font?
    @State private var showPrevCard: Bool = false
    @State private var showNextCard: Bool = false
    
    func generateLightColor() -> Color {
        switch selectedSection {
        case "Vision":
            return Color.lightMainColor
            
            
        case "Natural Language Processing":
            return Color.lightSecondaryColor
            
        case "Sentiment Analysis":
            return Color.lightThirdColor
            
        default:
            return Color.white
        }
    }
    
    
    func generateDescription() -> SectionCardDescription {
        switch selectedSection {
        case "Vision":
            return SectionCardDescription(description: "Vision AI is a branch of artificial intelligence that focuses on enabling machines to interpret and understand visual information similarly to human vision.")
        case "Natural Language Processing":
            return SectionCardDescription(description: "Natural Language Processing (NLP) is a subfield of artificial intelligence (AI) that focuses on the interaction between computers and human language. The goal of NLP is to enable machines to understand, interpret, and generate human language in a way that is both meaningful and contextually relevant.")
        case "Sentiment Analysis":
            return SectionCardDescription(description: "Sentiment analysis, also known as opinion mining, is a natural language processing (NLP) task in artificial intelligence that involves determining the sentiment or emotional tone expressed in a piece of text. It helps in understanding and analyzing people's opinions, attitudes, and emotions towards a particular subject, product, service, or event.")
        default:
            return SectionCardDescription.defaultDescription
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                if !showPrevCard && !showNextCard {
                    VStack(alignment: .center) {
                        
                        SectionDescription(cardDescription: generateDescription(), color: selectedColor, lightColor: generateLightColor())
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                withAnimation {
                                    showPrevCard.toggle()
                                }
                            }) {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Image(systemName: "arrowshape.left.circle.fill")
                                            .font(.custom("Poppins-Bold", size: 50))
                                            .foregroundColor(selectedColor)
                                    )
                            }
                            
                            Spacer()
                            
                            Text("Definition")
                                .font(.custom("Poppins-Bold", size: 30))
                                .foregroundColor(selectedColor)
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation {
                                    showNextCard.toggle()
                                }
                            }) {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Image(systemName: "arrowshape.right.circle.fill")
                                            .font(.custom("Poppins-Bold", size: 50))
                                            .foregroundColor(selectedColor)
                                    )
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .background(generateLightColor())
                }
                
                else if showPrevCard {
                    SectionCard2(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                } else if showNextCard {
                    SectionCard4(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                }
            }
            
            
        }
    }
}
