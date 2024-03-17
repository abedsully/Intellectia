import SwiftUI

struct SectionCard9: View {
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
    
    func generateSection() -> [SectionCardApplicationExample] {
        switch selectedSection {
        case "Vision":
            return [
                SectionCardApplicationExample(number: "1", title: "Apple", imageName: "vision-bg-9-1", description: "Face ID"),
                SectionCardApplicationExample(number: "2", title: "Tesla", imageName: "vision-bg-9-2", description: "Autonomous Cars"),
                SectionCardApplicationExample(number: "3", title: "Siemens Healthineers", imageName: "vision-bg-9-3", description: "X-Ray"),
                SectionCardApplicationExample(number: "4", title: "HIKVision", imageName: "vision-bg-9-4", description: "Heat-Sensing Imaging Device"),
            ]
        case "Natural Language Processing":
            return [
                SectionCardApplicationExample(number: "1", title: "Siri", imageName: "natural_language_processing-bg-9-1", description: "Virtual Assistant"),
                SectionCardApplicationExample(number: "2", title: "ChatGPT", imageName: "natural_language_processing-bg-9-2", description: "Chatbot"),
                SectionCardApplicationExample(number: "3", title: "Google Translate", imageName: "natural_language_processing-bg-9-3", description: "Language Translation Service"),
                SectionCardApplicationExample(number: "4", title: "Smart MailBoxes", imageName: "natural_language_processing-bg-9-4", description: "Intelligent Email Sorting"),
            ]
            //
        case "Sentiment Analysis":
            return [
                SectionCardApplicationExample(number: "1", title: "IBM watsonx AI", imageName: "sentiment_analysis-bg-9-1", description: "Cognitive Text Analysis"),
                SectionCardApplicationExample(number: "2", title: "Natural Language API", imageName: "sentiment_analysis-bg-9-2", description: "Semantic Text Analysis"),
                SectionCardApplicationExample(number: "3", title: "Microsoft Azure Text Analytics", imageName: "sentiment_analysis-bg-9-3", description: "Text Analyticse"),
                SectionCardApplicationExample(number: "4", title: "Amazon Comprehend", imageName: "sentiment_analysis-bg-9-4", description: "Language Comprehension"),
            ]
            
        default:
            return [
                SectionCardApplicationExample.defaultDescription,
            ]
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                if !showPrevCard && !showNextCard {
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        HStack (spacing: 20){
                            SectionProduct(cardDescription: generateSection()[0], color: selectedColor, lightColor: generateLightColor())
                            SectionProduct(cardDescription: generateSection()[1], color: selectedColor, lightColor: generateLightColor())
                        }
                        
                        Spacer()
                        
                        HStack (spacing: 20){
                            SectionProduct(cardDescription: generateSection()[2], color: selectedColor, lightColor: generateLightColor())
                            SectionProduct(cardDescription: generateSection()[3], color: selectedColor, lightColor: generateLightColor())
                        }
                        
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
                            
                            Text("\(selectedSection)'s Application")
                                .font(.custom("Poppins-Bold", size: 20))
                                .foregroundColor(selectedColor)
                                .multilineTextAlignment(.center)
                            
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
                    SectionCard8(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                } else if showNextCard {
                    SectionCard10(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                }
            }
            
            
        }
    }
}
