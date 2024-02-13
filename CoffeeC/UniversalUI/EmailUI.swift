import SwiftUI

struct EmailUI: View {
    @Binding var email: String
    
    var body: some View {
        VStack {
            HStack {
                Text("e-mail")
                    .foregroundStyle(.accent)
                
                Spacer()
            }
            
            HStack() {
                TextField("example@example", text: $email)
                    .padding()
                    .foregroundStyle(.accent)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.accent, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    EmailUI(email: .constant(""))
}
