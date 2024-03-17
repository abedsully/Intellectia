import SwiftUI

struct SectionCard12: View {
    var selectedSection: String
    var selectedColor: Color
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                HStack (alignment: .center){
                    Text("End of")
                        .font(.custom("Poppins-Regular", size: 20))
                    
                    Text(selectedSection)
                        .font(.custom("Poppins-Regular", size: 20))
                        .foregroundColor(selectedColor)
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Rectangle()
                        .fill(selectedColor)
                        .cornerRadius(10)
                        .frame(width: 150, height: 50)
                        .overlay(
                            Text("Finish")
                                .foregroundColor(.white)
                        )
                }
                Spacer()
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
    }
}
