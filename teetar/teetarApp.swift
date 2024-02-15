//
//  teetarApp.swift
//  teetar
//
//  Created by Anubhav Maithil on 10/02/24.
//

import SwiftUI
import Firebase

@main
struct teetarApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
     }
    
    var body: some Scene {
        WindowGroup { 
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
