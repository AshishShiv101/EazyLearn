//
//  AuthViewModel.swift
//  EazyLearn
//
//  Created by Ashish Shiv on 06/12/24.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        
    }
    func signIn(withemail email: String, password: String) async throws {
        
    }
    func createUser(withemail email: String,password:String, fullname: String) async throws {
        
    }
    func signOut()  {
        
    }
    func fetchUser() async{
        
    }
}
