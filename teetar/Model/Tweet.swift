//
//  Tweet.swift
//  teetar
//
//  Created by Anubhav Maithil on 14/02/24.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let uid: String
    let timeStamp: Timestamp
    var likes: Int
    let caption: String
    
    var user: User?
}
