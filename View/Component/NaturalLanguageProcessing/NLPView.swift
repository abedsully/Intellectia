import SwiftUI
import NaturalLanguage

struct NLPView: View {
    @State private var language = ""
    
    var body: some View {
        VStack (alignment: .center, spacing: 20){
            Text("\(self.analyzeText(idioma: language)!)")
                .font(.custom("Poppins-Regular", size: 20))
            
            TextField("Enter some text here", text: self.$language).textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .padding(.horizontal, 50)
    }
    
    func analyzeText(idioma: String) -> String? {
        let locale = Locale(identifier: "en")
        let recognizer = NLLanguageRecognizer()
        
        recognizer.processString(idioma)
        
        guard let languages = recognizer.dominantLanguage else {return "Unable to recognize language!"}
        
        
        return locale.localizedString(forLanguageCode: languages.rawValue)
    }
}
