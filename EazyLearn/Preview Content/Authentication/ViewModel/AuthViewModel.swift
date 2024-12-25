import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?

    init() {
        self.userSession = Auth.auth().currentUser
        self.isAuthenticated = userSession != nil
    }

    func signIn(withEmail email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            DispatchQueue.main.async {
                self.userSession = result.user
                self.isAuthenticated = true
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Sign-in failed: \(error.localizedDescription)"
            }
        }
    }

    func createUser(withEmail email: String, password: String, fullname: String) async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            DispatchQueue.main.async {
                self.userSession = result.user
                self.isAuthenticated = true
            }

            let userData: [String: Any] = [
                "id": result.user.uid,
                "fullname": fullname,
                "email": email
            ]

            let db = Firestore.firestore()
            try await db.collection("users").document(result.user.uid).setData(userData)
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to create user: \(error.localizedDescription)"
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.userSession = nil
                self.currentUser = nil
                self.isAuthenticated = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Error signing out: \(error.localizedDescription)"
            }
        }
    }

    func fetchUser() async {
        guard let uid = userSession?.uid else { return }
        let db = Firestore.firestore()

        do {
            let snapshot = try await db.collection("users").document(uid).getDocument()
            guard let data = snapshot.data() else { return }
            DispatchQueue.main.async {
                self.currentUser = User(
                    id: data["id"] as? String ?? "",
                    fullname: data["fullname"] as? String ?? "",
                    email: data["email"] as? String ?? ""
                )
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to fetch user: \(error.localizedDescription)"
            }
        }
    }
}
