//
//  EazyLearnApp.swift
//  EazyLearn
//
//  Created by Ashish Shiv on 20/10/24.
//

import SwiftUI
import Firebase
@main
struct EazyLearnApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
