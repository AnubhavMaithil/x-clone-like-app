//
//  ProfileFilterViewModel.swift
//  teetar
//
//  Created by Anubhav Maithil on 10/02/24.
//

import Foundation

enum ProfileFilterViewModel: Int, CaseIterable{
    case tweets
    case replies
    case likes
    
    var title: String{
        switch self{
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
