import SwiftUI

struct SplashScreenView: View {
    @State private var isAnimating = false
    @State private var font: Font?
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(Color.black.opacity(0.6))
            
            VStack (spacing: 50) {
                Spacer()
                
                Circle()
                    .frame(width: 350, height: 350)
                    .overlay(
                        Image("splash-bg")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400, height: 400)
                            .clipShape(Circle())
                    )
                    .opacity(isAnimating ? 1.0 : 0.5)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2.0)) {
                            self.isAnimating = true
                        }
                    }
                
                Text("Intellectia")
                    .font(font)
                    .foregroundColor(.white)
                    .opacity(isAnimating ? 1.0 : 0.0)
                    .onAppear {
                        font = splashFont()
                        withAnimation(.easeInOut(duration: 2.0)) {
                            self.isAnimating = true
                        }
                    }
                
                Spacer()
            }
            .padding()
            .alignmentGuide(.top) { dimension in
                dimension[.bottom]
            }
        }
    }
}

