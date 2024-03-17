import SwiftUI

struct TestQuiz: View {
    @State private var fontDescription: Font?
    
    
    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    Rectangle()
                        .foregroundColor(Color.clear)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                        .clipped()
                        .overlay(
                            QuizView()
                        )
                }
                .padding(.horizontal, 30)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
            
        }
    }
}
