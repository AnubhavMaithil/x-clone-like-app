//
//  AuthViewModel.swift
//  teetar
//
//  Created by Anubhav Maithil on 12/02/24.
//


import SwiftUI
import FirebaseCore
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    
    @Published var currentUser: User?
    
    private let service = UserService()
    
    // MARK: initialize auth
    init() {
        self.userSession = Auth.auth().currentUser
        self.userFetchFunc()
    }
    
    
    // MARK: Login User
    func login(withEmail email: String, password: String){
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error{
                print("DEBUG: Failed to signin with error \(error.localizedDescription)")
                
                return
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user
            self.userFetchFunc()
            
//            print("DEBUG: Loggedin user successfully")
//            print("DEBUG: user is \(String(describing: self.userSession?.uid))")
        }
    }
    
    
    // MARK: Register User
    func register(withEmail email: String, password: String, username: String, fullName: String){
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.userFetchFunc()
            
            print("DEBUG: user is \(String(describing: self.userSession?.uid))")
            
            let data = [
                "email": email,
                "username": username.lowercased(),
                "fullName": fullName,
                "password": password
            ]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error{
                    print("DEBUG: Failed to register with error \(error.localizedDescription)")
                    
                    return
                }
                
//                print("DEBUG: User data uploaded")
            }
        }
    }
    
    
    // MARK: Logout User
    func signOut() {
        
        // set session to nill
        userSession = nil
        
        // sign user out on server
        try? Auth.auth().signOut()
    }
    
    
    // MARK: fetch User
    func userFetchFunc() {
        guard let uid = self.userSession?.uid else {return}
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
//            print("DEBUG: \(user)")
        }
    }
    
    
    // MARK: Reset Password
    func resetPassword(withEmail email: String) {
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error{
                print("DEBUG: Failed to signin with error \(error.localizedDescription)")
                return
            }
        }
    }
}
