import SwiftUI

struct TestVision: View {
    var selectedSection: String
    var selectedColor: Color
    @State private var fontDescription: Font?
    @State private var showPrevCard: Bool = false
    @State private var showNextCard: Bool = false
    
    
    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                if !showPrevCard && !showNextCard {
                    VStack(alignment: .center) {
                        
                        Rectangle()
                            .foregroundColor(Color.clear)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                            .clipped()
                            .overlay(
                                VisionView()
                            )
                        
                        
                        
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
                            
                            VStack (alignment: .center, spacing: 10){
                                Text("Note: Model Accuracy is 47%")
                                    .font(.custom("Poppins-Regular", size: 20))
                                    .foregroundColor(selectedColor)
                                
                                Text("There might be a chance of inaccuracy")
                                    .font(.custom("Poppins-Regular", size: 20))
                                    .foregroundColor(selectedColor)
                            }
                            
                            
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
                }
                
                else if showPrevCard {
                    SectionCard10(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                } else if showNextCard {
                    SectionCard12(selectedSection: selectedSection, selectedColor: selectedColor)
                        .transition(.opacity)
                }
            }
        }
    }
}
