import SwiftUI

struct SectionCard1: View {
    let sectionName: String
    
    @State private var fontDescription: Font?
    @State private var showNextCard: Bool = false
    @State private var isCardPresented = true
    
    let sectionDescriptions: [SectionCard1Description] = [
        SectionCard1Description(imageName: "vision-img", title: "Vision", color: Color.mainColor),
        SectionCard1Description(imageName: "natural_language_processing-img", title: "Natural Language Processing", color: Color.secondaryColor),
        SectionCard1Description(imageName: "sentiment_analysis-img", title: "Sentiment Analysis", color: Color.thirdColor),
        SectionCard1Description(imageName: "quiz-img", title: "Quiz", color: Color.fourthColor)
    ]
    
    var selectedSectionDescription: SectionCard1Description {
        return sectionDescriptions.first { $0.title == sectionName } ?? SectionCard1Description.defaultDescription
    }
    
    var body: some View {
        ZStack {
            Color.white
                .onTapGesture {
                    isCardPresented = false
                }
            
            
            VStack(alignment: .trailing) {
                if !showNextCard {
                    GeometryReader { geometry in
                        VStack(alignment: .leading, spacing: 50) {
                            
                            Image(selectedSectionDescription.imageName)
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
                                if sectionName == "Natural Language Processing" {
                                    Text(selectedSectionDescription.title)
                                        .font(.custom("Poppins-Bold", size: 28))
                                        .foregroundColor(selectedSectionDescription.color)
                                }
                                
                                else {
                                    Text(selectedSectionDescription.title)
                                        .font(.custom("Poppins-Bold", size: 35))
                                        .foregroundColor(selectedSectionDescription.color)
                                }
                                
                                
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation {
                                        showNextCard.toggle()
                                    }
                                }) {
                                    Image(systemName: "arrowshape.right.circle.fill")
                                        .font(.custom("Poppins-Bold", size: 50))
                                        .foregroundColor(selectedSectionDescription.color)
                                }
                                
                            }
                            .padding(.horizontal, 30)
                            
                            Spacer()
                            
                        }
                        
                    }
                    
                } else {
                    if sectionName == "Quiz" {
                        TestQuiz()
                    }
                    
                    else {
                        SectionCard2(selectedSection: selectedSectionDescription.title, selectedColor: selectedSectionDescription.color)
                    }
                    
                }
            }
        }
    }
}
