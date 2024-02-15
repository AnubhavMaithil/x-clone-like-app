//
//  ExploreViewModel.swift
//  teetar
//
//  Created by Anubhav Maithil on 14/02/24.
//

import Foundation

class ExploreViewModel: ObservableObject{
    
    @Published var users = [User]()
    
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercase = searchText.lowercased()
            
            return users.filter {
                
                $0.username.contains(lowercase) ||
                $0.fullName.lowercased().contains(lowercase)
                
            }
        }
    }
    
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchAllUsers{ users in
            self.users = users
//            print("DEBUG: users \(users)")
        }
    }
    
}
