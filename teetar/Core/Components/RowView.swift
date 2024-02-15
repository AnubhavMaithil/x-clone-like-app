//
//  RowView.swift
//  teetar
//
//  Created by Anubhav Maithil on 10/02/24.
//

import SwiftUI

struct RowView: View {
    
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading){
            
            if let user = tweet.user {
                //data user
                HStack(alignment: .top, spacing: 12){
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(.systemBlue))
                    
                    VStack(alignment: .leading){
                        
                        
                            HStack{
                                Text(user.fullName)
                                    .font(.subheadline).bold()
                                
                                Text("@\(user.username)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text("time")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        
                        //body
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            // like share subscribe
            HStack{
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }

                Spacer()

//                Button {
//                    
//                } label: {
//                    Image(systemName: "arrow.2.squarepath")
//                        .font(.subheadline)
//                }
//
//                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .accentColor(.gray)
            .padding()
            
            Divider()
        }
        .padding()
    }
}

//#Preview {
//    RowView()
//}
