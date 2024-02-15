//
//  LoginView.swift
//  teetar
//
//  Created by Anubhav Maithil on 12/02/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        
        NavigationView {
            
        // Parent Container
            VStack{
                
                // Header
                AuthHeaderComp(heading1: "Hello", heading2: "Welcome back!")
                
                
                VStack(spacing:40){
                    
                    CustomInputView(imageName: "envelope", placeholder: "Email", text: $email)
                    
                    CustomInputView(imageName: "lock", placeholder: "Password", isSecured: true, text: $password)
                    
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                HStack{
                    Spacer()
                    
                    NavigationLink{
                        ResetPasswordView()
                    } label: {
                        Text("Forgot password?")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemBlue))
                            .padding(.top)
                            .padding(.trailing, 30)
                    }
                }
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }
                .shadow(color: .gray.opacity(0.8), radius: 10, x: 0.0, y: 0.0)
                
                Spacer()
                
                NavigationLink{
                    RegisterView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                            .foregroundColor(.primary)
                            
                        Text("Register")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                        
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
    LoginView()
}
