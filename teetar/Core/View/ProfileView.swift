//
//  ProfileView.swift
//  teetar
//
//  Created by Anubhav Maithil on 10/02/24.
//

import SwiftUI

// MARK: ProfileView
struct ProfileView: View {
    
    @State private var selectedFilter: ProfileFilterViewModel = .tweets
    @Namespace var animation
    
    @ObservedObject var viewModel = FeedViewModel()
    @ObservedObject var userModel = AuthViewModel()
    
    @Environment(\.presentationMode) var mode
    
    private let user: User
    
    init(user: User){
        self.user = user
    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetView
            
            Spacer()
        }
        .toolbar(.hidden)
        
    }
}

//#Preview {
//    ProfileView()
//}


// MARK: Extensions
extension ProfileView{
        
    
    // MARK: headerView
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                
//                Button(action: {
//                    mode.wrappedValue.dismiss()
//                }, label: {
//                    Image(systemName: "arrow.left")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.white)
//                })
                
                Circle()
                    .frame(width: 84, height: 84)
                .offset(x: 16, y: 36)
            }
            
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
    
    
    // MARK: actionButtons
    var actionButtons: some View {
        HStack{
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            Button(action: {
                
            }, label: {
                Text("Edit Profile")
                    .foregroundColor(.primary)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
            })
            
        }
        .padding(.trailing)
    }
    
    
    // MARK: userInfoDetails
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4){
            
            HStack {
                Text(user.fullName.capitalized)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Some stupid bio")
                .font(.subheadline)
                .padding(.vertical)
            
            UserStatsView()
            
        }.padding()
    }
    
    
    // MARK: tweetFilterBar
    var tweetFilterBar: some View{
        HStack{
            ForEach(ProfileFilterViewModel.allCases, id: \.rawValue){ item in
                
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .primary : .gray)
                    
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 2)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
                
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    // MARK: tweetView
    var tweetView: some View{
        ScrollView{
            LazyVStack{
                ForEach(viewModel.tweets) { tweet in
                    if tweet.uid == userModel.currentUser?.id {
                        RowView(tweet: tweet)
                            .padding()
                    }
                }
            }
        }
    }
}
