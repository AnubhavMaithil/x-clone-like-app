//
//  User.swift
//  teetar
//
//  Created by Anubhav Maithil on 13/02/24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let username: String
    let fullName: String
    let email: String
    
}
