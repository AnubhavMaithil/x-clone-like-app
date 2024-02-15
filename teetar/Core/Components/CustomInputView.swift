//
//  CustomInputView.swift
//  teetar
//
//  Created by Anubhav Maithil on 12/02/24.
//

import SwiftUI

struct CustomInputView: View {
    
    let imageName: String
    let placeholder: String
    var isSecured: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecured ?? false{
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

#Preview {
    CustomInputView(imageName: "envelope", placeholder: "Email", text: .constant(""))
}
