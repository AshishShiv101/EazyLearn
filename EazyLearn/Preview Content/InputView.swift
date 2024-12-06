import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
       
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .autocapitalization(.none)
                } else {
                    TextField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .autocapitalization(.none)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
        }
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
            isSecure: true
        )
    }
    .padding()
}
