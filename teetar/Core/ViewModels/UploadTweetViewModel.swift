//
//  UploadTweetViewModel.swift
//  teetar
//
//  Created by Anubhav Maithil on 14/02/24.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                // show error message
            }
        }
    }
    
    
    
}
