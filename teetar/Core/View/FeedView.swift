//
//  FeedView.swift
//  teetar
//
//  Created by Anubhav Maithil on 10/02/24.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets) { tweet in
                        RowView(tweet: tweet)
                    }
                }
            }
            
            Button(action: {
                showNewTweetView.toggle()
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            })
            .background(Color(.systemBlue))
            .clipShape(Circle())
            .foregroundColor(.white)
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView, content: {
                NewTweetView()
            })
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FeedView()
}
