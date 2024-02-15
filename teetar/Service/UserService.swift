//
//  UserService.swift
//  teetar
//
//  Created by Anubhav Maithil on 13/02/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                
                guard let user = try? snapshot?.data(as: User.self) else {return}
                completion(user)
                
        }
    }
    
    func fetchAllUsers(completion: @escaping([User]) -> Void){
        
//        var users = [User]()
        
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap( { try? $0.data(as: User.self) } )
                
//                documents.forEach{ document in
//                    guard let user = try? document.data(as: User.self) else {return}
//                    users.append(user)
//                    
//                }
                
                completion(users)
        }
    }
    
}
