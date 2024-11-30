//
//  LoginView.swift
//  EazyLearn
//
//  Created by Ashish Shiv on 30/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing:24){
                    InputView(text: $email,title:"Emai Address",placeholder:"example@gmail.com")
                        .autocapitalization(.none)
                    InputView(text:  $password, title: "Password",placeholder:"Password")
                }
                .padding(.horizontal)
                .padding(.top,12)
                
                Button(){
                    print("Login")
                } label:{
                    HStack{
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.2.circlepath.circlepath.circle")
                    }  .foregroundStyle(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.yellow))
                .cornerRadius(10)
                .padding(.top,24)
                
                Spacer()
                NavigationLink{
                    
                }label:{
                    HStack(spacing: 2){
                        Text("Don't have an account")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
          
        }
    }
}

#Preview {
    LoginView()
}
