//
//  EazyLearnApp.swift
//  EazyLearn
//
//  Created by Ashish Shiv on 20/10/24.
//

import SwiftUI

@main
struct EazyLearnApp: App {
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
