//
//  HomeView.swift
//  EazyLearn
//
//  Created by Ashish Shiv on 20/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView{
            NavigationView{
                Text("Hello, World!")
                    .navigationBarTitle("Home")
                    
            }
        }
    

    }
 
}


#Preview {
    HomeView()
}
