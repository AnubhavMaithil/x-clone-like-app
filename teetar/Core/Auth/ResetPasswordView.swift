//
//  ResetPasswordView.swift
//  teetar
//
//  Created by Anubhav Maithil on 14/02/24.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State private var email = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            
            // Header
            AuthHeaderComp(heading1: "Forgot Password", heading2: "Send a link to email")
            
            
            VStack(spacing:40){
                
                CustomInputView(imageName: "envelope", placeholder: "Email", text: $email)
                
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 44)
            
            
            Button {
                viewModel.resetPassword(withEmail: email)
            } label: {
                Text("Send Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
            }
            .shadow(color: .gray.opacity(0.8), radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: MyBackButton())
    }
}

#Preview {
    ResetPasswordView()
}

struct MyBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss() // Handle back action
        }) {
            HStack {
                Image(systemName: "arrow.left") // Use a custom image for back button
                    .foregroundColor(.red) // Change the color of the back button
            }
        }
    }
}
