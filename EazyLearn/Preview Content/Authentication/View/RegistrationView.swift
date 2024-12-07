import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("Firebase-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 128)
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                
                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                
                Button(action: {
                    guard password == confirmPassword else {
                        print("Passwords do not match")
                        return
                    }
                    Task{
                        try await viewModel.createUser(withemail: email, password: password,fullname: fullname)
                    }
                    
                }) {
                    HStack {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding(.top, 20)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Already have an account? Log In")
                        .foregroundColor(.blue)
                }
                .padding(.top, 16)
            }
            .padding()
        }
    }
}

    
    struct RegistrationView_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationView()
        }
    }

