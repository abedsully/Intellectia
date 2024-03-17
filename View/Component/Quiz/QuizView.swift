import SwiftUI

struct QuizView: View {
    let questions: [Question] = [
        Question(text: "In what part of Artificial Intelligence is Chatbot in?", answers: ["Vision", "Natural Language Processing", "Sentiment Analysis", "Linear Regression"], correctAnswer: "Natural Language Processing"),
        Question(text: "What is a task in AI to determine emotional tone expressed in a piece of text?", answers: ["Natural Language Processing", "Vision", "Sentiment Analysis", "Text Classification"], correctAnswer: "Sentiment Analysis"),
        Question(text: "What is the feature of Vision?", answers: ["Image Recognition", "Chatbot", "Customer Feedback Analysis", "Language Translation"], correctAnswer: "Image Recognition"),
        Question(text: "Autonomous cars is one of the implementation of?", answers: ["Sentiment Analysis", "Natural Language Processing", "Independent Learning", "Vision"], correctAnswer: "Vision"),
        Question(text: "What Vision Product does Apple have?", answers: ["Siri", "Safari", "Face ID", "iTunes"], correctAnswer: "Face ID")
    ]
    
    @State private var currentQuestion = 0
    @State private var selectedAnswer: String?
    @State private var score = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    
    func restartQuiz() {
        currentQuestion = 0
        selectedAnswer = nil
        score = 0
    }
    
    var body: some View {
        VStack {
            if currentQuestion < questions.count {
                QuestionView(question: questions[currentQuestion], selectedAnswer: $selectedAnswer)
            } else {
                Spacer()
                
                VStack(spacing: 20) {
                    if score == questions.count {
                        Text("Quiz completed! Your score is \(score) out of \(questions.count)")
                            .font(.custom("Poppins-Light", size: 20))
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Rectangle()
                                .fill(Color.fourthColor)
                                .cornerRadius(10)
                                .frame(width: 150, height: 50)
                                .overlay(
                                    Text("Finish")
                                        .foregroundColor(.white)
                                )
                        }
                    } else {
                        Text("Quiz completed! Your score is \(score) out of \(questions.count)")
                            .font(.custom("Poppins-Light", size: 20))
                        Button(action: {
                            restartQuiz()
                        }) {
                            Rectangle()
                                .fill(Color.fourthColor)
                                .cornerRadius(10)
                                .frame(width: 150, height: 50)
                                .overlay(
                                    Text("Try Again")
                                        .foregroundColor(.white)
                                )
                        }
                    }
                }
                Spacer()
            }
            
            if score < questions.count && currentQuestion < questions.count {
                Button(action: {
                    if let selectedAnswer = selectedAnswer {
                        if selectedAnswer == questions[currentQuestion].correctAnswer {
                            score += 1
                        }
                    }
                    selectedAnswer = nil
                    currentQuestion += 1
                }) {
                    Text("Next")
                }
                .padding()
                .disabled(selectedAnswer == nil)
                .foregroundColor(selectedAnswer == nil ? Color.gray : Color.fourthColor)
            }
        }
        .padding()
    }
}

