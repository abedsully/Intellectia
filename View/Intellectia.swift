import SwiftUI

struct Intellectia: View {
    
    @State private var showMainView = false
    @State private var showInfoView = false
    @State private var audioPlayerInitialized = false
    
    var body: some View {
        if showMainView {
            MainView()
                .onAppear {
                    self.showInfoView = true
                }
                .sheet(isPresented: $showInfoView) {
                    InfoView()
                }
        } else {
            SplashScreenView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            self.showMainView = true
                        }
                    }
                }
        }
    }
}

