import SwiftUI

struct SectionCard5: View {
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
            return SectionCardApplicationExample(number: "1", title: "Image Recognition", imageName: "vision-bg-5-1", description: "Image recognition refers to the capability of a system to identify and categorize objects, patterns, or features within an image. It is a fundamental task in computer vision, where machines are trained to understand and interpret visual data similar to the way humans perceive images.")
        case "Natural Language Processing":
            return SectionCardApplicationExample(number: "1", title: "Chatbots", imageName: "natural_language_processing-bg-5-2", description: "Chatbot is an artificial intelligence system designed to simulate conversation with human users, especially over the internet. In the context of natural language processing (NLP), chatbots leverage language understanding and generation capabilities to engage in text-based or voice-based conversations with users.")
            
        case "Sentiment Analysis":
            return SectionCardApplicationExample(number: "1", title: "Customer Feedback Analysis", imageName: "sentiment_analysis-bg-5-3", description: "Customer feedback analysis is the process of systematically evaluating and interpreting customer comments, opinions, and suggestions to gain valuable insights into customer satisfaction, preferences, and areas for improvement.")
            
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
                    SectionCard4(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                } else if showNextCard {
                    SectionCard6(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                }
            }
            
            
        }
    }
}
