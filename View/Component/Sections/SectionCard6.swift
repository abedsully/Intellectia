import SwiftUI

struct SectionCard6: View {
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
            return SectionCardApplicationExample(number: "2", title: "Object Detection", imageName: "vision-bg-6-1", description: "Object detection refers to the task of locating and classifying objects within an image or video frame. The goal is to identify and outline the presence of specific objects of interest and assign them to predefined categories or classes. ")
        case "Natural Language Processing":
            return SectionCardApplicationExample(number: "2", title: "Email Filtering", imageName: "natural_language_processing-bg-6-2", description: "Email filtering involves the automatic categorization and organization of emails based on their content and context. The goal is to efficiently manage and prioritize incoming emails by classifying them into predefined categories or taking specific actions such as marking as spam, archiving, or flagging for follow-up. ")
            
        case "Sentiment Analysis":
            return SectionCardApplicationExample(number: "2", title: "Social Media Monitoring", imageName: "sentiment_analysis-bg-6-3", description: "Social Media Monitoring involves the systematic analysis of content shared on social media platforms to gain insights into public opinion, trends, and brand perception.")
            
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
                    SectionCard5(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                } else if showNextCard {
                    SectionCard7(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                }
            }
            
            
        }
    }
}
