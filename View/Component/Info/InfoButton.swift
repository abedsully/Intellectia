import SwiftUI

struct InfoButton: View {
    
    @State private var showAlert = false
    @State private var isCardPresented = false
    
    
    var body: some View {
        Button(action: {
            showAlert = true
        }) {
            Image(systemName: "info.circle.fill")
                .font(.custom("Poppins-Bold", size: 50))
                .foregroundColor(Color.white)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Information"),
                message: Text("Do you wish to continue?"),
                primaryButton: .default(Text("Yes")) {
                    isCardPresented = true
                },
                secondaryButton: .cancel(Text("No"))
            )
        }
        .sheet(isPresented: $isCardPresented, content: {
            InfoView()
        })
    }
    
}
