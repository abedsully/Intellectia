import SwiftUI

struct SectionCard4: View {
    var selectedSection: String
    var selectedColor: Color
    @State private var fontDescription: Font?
    @State private var showPrevCard: Bool = false
    @State private var showNextCard: Bool = false
    
    let sectionDescription: [SectionCard4Description] = [
        SectionCard4Description(title: "Features")
    ]
    
    func generateImage() -> String {
        switch selectedSection {
        case "Vision":
            return "vision-bg-4"
        case "Natural Language Processing":
            return "natural_language_processing-bg-4"
        case "Sentiment Analysis":
            return "sentiment_analysis-bg-4"
        default:
            return ""
        }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .trailing) {
                if !showPrevCard && !showNextCard {
                    GeometryReader { geometry in
                        VStack(alignment: .leading, spacing: 50) {
                            
                            Image(generateImage())
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                                .clipped()
                                .overlay(
                                    Rectangle()
                                        .fill(Color.clear)
                                        .cornerRadius(20)
                                        .frame(height: geometry.size.height * 0.75)
                                )
                            
                            
                            HStack (alignment: .center){
                                Button(action: {
                                    withAnimation {
                                        showPrevCard.toggle()
                                    }
                                }) {
                                    Image(systemName: "arrowshape.left.circle.fill")
                                        .font(.custom("Poppins-Bold", size: 50))
                                        .foregroundColor(selectedColor)
                                }
                                
                                Spacer()
                                Text(sectionDescription.first?.title ?? "")
                                    .font(.custom("Poppins-Bold", size: 35))
                                    .foregroundColor(selectedColor)
                                
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation {
                                        showNextCard.toggle()
                                    }
                                }) {
                                    Image(systemName: "arrowshape.right.circle.fill")
                                        .font(.custom("Poppins-Bold", size: 50))
                                        .foregroundColor(selectedColor)
                                }
                                
                            }
                            .padding(.horizontal, 30)
                            
                        }
                        
                    }
                    
                } else if showPrevCard {
                    SectionCard3(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                } else if showNextCard {
                    SectionCard5(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                }
            }
        }
    }
}
