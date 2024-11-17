//
//  SplashScreenView.swift
//  EazyLearn
//
//  Created by Ashish Shiv on 20/10/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea(.all)
            HStack{
                Text("Eazy")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                Image(systemName: "book.pages.fill")
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
                Text("Learn")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
            }
            .font(.largeTitle)
        }
    }
}

#Preview {
    SplashScreenView()
}
