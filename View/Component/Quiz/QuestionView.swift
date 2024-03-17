import SwiftUI

struct QuestionView: View {
    let question: Question
    @Binding var selectedAnswer: String?
    
    var body: some View {
        VStack(alignment: .center) {
            Text(question.text)
                .font(.title)
                .padding(.bottom)
                .multilineTextAlignment(.center)
            
            ForEach(question.answers, id: \.self) { answer in
                Button(action: {
                    selectedAnswer = answer
                }) {
                    Text(answer)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedAnswer == answer ? Color.fourthColor : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 5)
                }
            }
        }
        .padding(.horizontal, 30)
    }
}
