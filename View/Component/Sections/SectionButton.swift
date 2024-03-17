import SwiftUI

struct SectionButton: View {
    let imageName: String
    let sectionName: String
    let xOffSet: CGFloat
    let yOffSet: CGFloat
    
    @State private var showAlert = false
    @State private var isCardPresented = false
    
    
    var body: some View {
        Button(action: {
            showAlert = true
        }) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(Color.red)
                .clipShape(Circle())
        }
        .offset(x: xOffSet, y: yOffSet)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Intellectia - \(sectionName)"),
                message: Text("Are you ready to explore \(sectionName)?"),
                primaryButton: .default(Text("Yes")) {
                    isCardPresented = true
                },
                secondaryButton: .cancel(Text("No"))
            )
        }
        .sheet(isPresented: $isCardPresented, content: {
            SectionCard1(sectionName: sectionName)
        })
    }
    
    
}
