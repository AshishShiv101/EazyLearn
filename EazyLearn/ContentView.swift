import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
            } else {
                if authViewModel.isAuthenticated {
                    HomeView()
                        .environmentObject(authViewModel) // Pass AuthViewModel to HomeView
                } else {
                    LoginView()
                        .environmentObject(authViewModel) // Pass AuthViewModel to LoginView
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
