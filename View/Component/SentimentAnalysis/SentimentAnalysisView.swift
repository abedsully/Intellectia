import SwiftUI
import NaturalLanguage

struct SentimentAnalysisView : View {
    
    @State private var text: String = ""
    private var sentiment: String {
        return performSentimentAnalysis(for: text)
    }
    private let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    
    var body: some View {
        VStack (alignment: .center, spacing: 20){
            Text(emoticon(for: sentiment))
                .font(.system(size: 100))
            
            TextField("Write something...", text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            HStack{
                Text("Sentiment Value: ")
                Text(sentiment)
                    .foregroundColor(color(for: sentiment))
                    .multilineTextAlignment(.center)
            }
            
        }
        .padding(.horizontal, 50)
    }
    
    private func performSentimentAnalysis(for string: String) -> String {
        tagger.string = string
        let (sentiment, _) = tagger.tag(at: string.startIndex,
                                        unit: .paragraph,
                                        scheme: .sentimentScore)
        return sentiment?.rawValue ?? ""
    }
    
    private func emoticon(for sentiment: String) -> String {
        guard let value = Double(sentiment) else {
            return ""
        }
        
        return value > 0 ? "🙂" : "☹️"
    }
    
    private func color(for sentiment: String) -> Color {
        guard let value = Double(sentiment) else {
            return Color.black
        }
        
        return value > 0 ? Color.green : Color.red
    }
}
