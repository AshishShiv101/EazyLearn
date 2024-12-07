import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .shadow(radius: 5)
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .shadow(radius: 5)
            }
        }
        .padding(.horizontal) // Adds padding to the entire VStack
    }
}

#Preview {
    VStack(spacing: 16) {
        InputView(
            text: .constant(""),
            title: "Email Address",
            placeholder: "Enter your email address"
        )
        InputView(
            text: .constant(""),
            title: "Password",
            placeholder: "Enter your password",
            isSecureField: true
        )
    }
    .padding()
}
