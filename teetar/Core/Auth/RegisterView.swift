//
//  RegisterView.swift
//  teetar
//
//  Created by Anubhav Maithil on 12/02/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullName = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        NavigationView {
            
        // Parent Container
            VStack{
                
                // Header
                AuthHeaderComp(heading1: "Get started", heading2: "Create your account.")
                
                
                VStack(spacing:40){
                    
                    CustomInputView(imageName: "envelope", placeholder: "Email", text: $email)
                    
                    CustomInputView(imageName: "person", placeholder: "Username", text: $username)
                    
                    CustomInputView(imageName: "person", placeholder: "Full Name", text: $fullName)
                    
                    CustomInputView(imageName: "lock", placeholder: "Password", isSecured: true, text: $password)
                    
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                
                Button {
                    viewModel.register(withEmail: email, 
                                       password: password,
                                       username: username,
                                       fullName: fullName)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }
                .shadow(color: .gray.opacity(0.8), radius: 10, x: 0.0, y: 0.0)
                .padding(.top, 20)
                
                Spacer()
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                            .foregroundColor(.primary)
                            
                        Text("Login")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                    }
                    .opacity(0.7)
                }
                .padding(.bottom, 30)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
        
    }
}

#Preview {
    RegisterView()
}
