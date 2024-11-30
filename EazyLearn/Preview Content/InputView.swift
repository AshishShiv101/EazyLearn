//
//  InputView.swift
//  EazyLearn
//
//  Created by Ashish Shiv on 30/11/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text : String
    let title : String
    let placeholder : String
    var isSecure = false
    
    var body: some View {
        VStack(alignment: .leading,spacing:12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecure{
                SecureField(placeholder,text: $text)
                    .font(.system(size: 14)
    )
            }else{
                TextField(placeholder,text: $text)
                    .font(.system(size: 14))
            }
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""),title:"Email Address", placeholder: "Enter your email address")
}
