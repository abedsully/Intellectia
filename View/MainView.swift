import SwiftUI

struct MainView: View {
    @State private var currentBackgroundIndex = 0
    
    
    
    @State private var currentBackground: BackgroundDescription = BackgroundDescription(imageName: "main-bg-1", quotes: "The only way to do great work is to love what you do" , author: "Steve Jobs")
    
    private let backgroundDescriptions: [BackgroundDescription] = [
        BackgroundDescription(imageName: "main-bg-1", quotes: "The only way to do great work is to love what you do", author: "Steve Jobs"),
        BackgroundDescription(imageName: "main-bg-2", quotes: "You want to be the pebble in the pond that creates the ripple for change", author: "Tim Cook"),
        BackgroundDescription(imageName: "main-bg-3", quotes: "Work hard, have fun, make history", author: "Jeff Bezos"),
        BackgroundDescription(imageName: "main-bg-4", quotes: "The biggest risk is not taking any risk", author: "Mark Zuckerberg"),
        BackgroundDescription(imageName: "main-bg-5", quotes: "If you're changing the world, you're working on important things. You're excited to get up in the morning", author: "Larry Page"),
    ]
    
    var body: some View {
        
        
        
        VStack {
            ZStack {
                Image(currentBackground.imageName)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black.opacity(0.4))
                
                VStack(alignment: .center, spacing: 80) {
                    VStack(alignment: .center, spacing: -3) {
                        Text(currentBackground.quotes)
                            .font(.custom("Poppins-Regular", size: 27))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        Text(currentBackground.author)
                            .font(.custom("Poppins-Light", size: 20))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }
                    .padding(.horizontal, 30)
                    
                    CircularProgressBar()
                    
                    InfoButton()
                    
                    
                }
                .padding(.vertical, 50)
                
                
            } 
            .onAppear {
                
                Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
                    withAnimation {
                        currentBackgroundIndex = (currentBackgroundIndex + 1) % backgroundDescriptions.count
                        currentBackground = backgroundDescriptions[currentBackgroundIndex]
                    }
                }
            }
        }
        
    }
}
