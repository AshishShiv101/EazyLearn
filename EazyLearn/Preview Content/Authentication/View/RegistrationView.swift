import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    @State private var showError = false

    var body: some View {
        VStack {

            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)

                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")

                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)

                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)

                if showError, let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding(.top, 8)
                }

                Button(action: {
                    if password != confirmPassword {
                        viewModel.errorMessage = "Passwords do not match"
                        showError = true
                        return
                    }
                    Task {
                        try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                        if viewModel.errorMessage == nil {
                            dismiss()
                        } else {
                            showError = true
                        }
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
        .onAppear {
            showError = false
            viewModel.errorMessage = nil
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
