import SwiftUI
import WebKit

struct CircularProgressBar: View {
    
    @State var progressValue: Float = 0.0
    var body: some View {
        VStack {
            ProgressBar(progress: self.$progressValue)
                .frame(width: 500.0, height: 500.0)
                .padding(20.0)
                .onAppear() {
                    self.progressValue = 1.0
                }
        }
    }
}


struct ProgressBar: View {
    @Binding var progress: Float
    var color: Color = Color.red
    
    
    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .stroke(lineWidth: 15)
                .opacity(0.2)
                .foregroundColor(Color.lightMainColor)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.mainColor)
                .rotationEffect(Angle(degrees: 270))
                .contentShape(Rectangle())
            
            ZStack {
                
                // Vision, Top
                SectionButton(imageName: "vision-img", sectionName: "Vision" , xOffSet: 0, yOffSet: -200)
                
                // Natural Language, Right
                SectionButton(imageName: "natural_language_processing-img", sectionName: "Natural Language Processing", xOffSet: 200, yOffSet: 0)
                
                // Sentiment Analysis, Bottom 
                SectionButton(imageName: "sentiment_analysis-img", sectionName: "Sentiment Analysis", xOffSet: 0, yOffSet: 200)
                
                // Quiz, Left
                SectionButton(imageName: "quiz-img", sectionName: "Quiz", xOffSet: -200, yOffSet: 0)
            }
        }
        .padding(50)
    }
}
