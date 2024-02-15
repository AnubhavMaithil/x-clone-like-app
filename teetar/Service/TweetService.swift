//
//  TweetService.swift
//  teetar
//
//  Created by Anubhav Maithil on 14/02/24.
//

import Foundation
import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = [
            "uid": uid,
            "caption": caption,
            "likes": 0,
            "timeStamp": Timestamp(date: Date())
        ] as [String : Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                
                if let error = error {
                    print("DEBUG: failed to upload.. \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                print("DEBUG: tweet uploaded \(data)")
                completion(true)
            }
    }
    
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timeStamp", descending: true)
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                
                let tweets = documents.compactMap( { try? $0.data(as: Tweet.self) } )
                completion(tweets)
        }
    }
    
}
