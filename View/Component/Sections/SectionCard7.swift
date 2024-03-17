import SwiftUI

struct SectionCard7: View {
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
    
    func generateSection() -> SectionCardApplicationExample {
        switch selectedSection {
        case "Vision":
            return SectionCardApplicationExample(number: "3", title: "Facial Recognition", imageName: "vision-bg-7-1", description: "Facial recognition is a technology that involves identifying or verifying individuals by analyzing patterns based on their facial features. It's a form of biometric identification that relies on unique characteristics of a person's face, such as the arrangement of facial landmarks, the distances between features (like eyes, nose, and mouth), and other distinctive attributes.")
        case "Natural Language Processing":
            return SectionCardApplicationExample(number: "3", title: "Language Translation", imageName: "natural_language_processing-bg-7-2", description: "Language translation refers to the process of automatically converting text or speech from one language into another. The primary goals of language translation within NLP include facilitating cross-language communication, enabling access to information in multiple languages, and breaking down language barriers.")
            
        case "Sentiment Analysis":
            return SectionCardApplicationExample(number: "3", title: "Brand Management", imageName: "sentiment_analysis-bg-7-3", description: "Brand management refers to the strategic process of monitoring, analyzing, and influencing the sentiments and perceptions surrounding a brand. The goal is to understand and shape the overall sentiment to positively influence the brand's reputation, customer satisfaction, and market position.")
            
        default:
            return SectionCardApplicationExample.defaultDescription;
            
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                if !showPrevCard && !showNextCard {
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        SectionFeatures(cardDescription: generateSection(), color: selectedColor, lightColor: generateLightColor())
                        
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
                            
                            Text("\(selectedSection)'s Features")
                                .font(.custom("Poppins-Bold", size: 20))
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
                    .padding(.horizontal, 20)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .background(generateLightColor())
                }
                
                else if showPrevCard {
                    SectionCard6(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                } else if showNextCard {
                    SectionCard8(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                }
            }
            
            
        }
    }
}

