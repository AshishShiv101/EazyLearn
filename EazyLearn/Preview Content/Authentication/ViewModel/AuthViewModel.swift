import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isAuthenticated: Bool = false

    init() {
        self.userSession = Auth.auth().currentUser
        self.isAuthenticated = userSession != nil
    }

    func signIn(withemail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            self.isAuthenticated = true
        } catch {
            print("Sign-in failed: \(error.localizedDescription)")
            throw error
        }
    }

    func createUser(withemail email: String, password: String, fullname: String) async throws {
        do {
            // Create the user in Firebase Auth
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            self.isAuthenticated = true

            // Manually structure user data for Firestore
            let userData: [String: Any] = [
                "id": result.user.uid,
                "fullname": fullname,
                "email": email
            ]

            // Save the user data to Firestore
            let db = Firestore.firestore()
            try await db.collection("users").document(result.user.uid).setData(userData)
        } catch {
            print("Failed to create user: \(error.localizedDescription)")
            throw error
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
            self.isAuthenticated = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }

    func fetchUser() async {
        guard let uid = userSession?.uid else { return }
        let db = Firestore.firestore()

        do {
            let snapshot = try await db.collection("users").document(uid).getDocument()
            guard let data = snapshot.data() else { return }
            self.currentUser = User(
                id: data["id"] as? String ?? "",
                fullname: data["fullname"] as? String ?? "",
                email: data["email"] as? String ?? ""
            )
        } catch {
            print("Failed to fetch user: \(error.localizedDescription)")
        }
    }
}
