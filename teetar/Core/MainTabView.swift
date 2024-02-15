//
//  MainTabView.swift
//  teetar
//
//  Created by Anubhav Maithil on 10/02/24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            TabView(selection: $selectedTab) {
                
                FeedView()
                    .onTapGesture {
                        self.selectedTab = 0
                    }
                    .tabItem { Image(systemName: "house") }
                    .tag(0)
                
                ExploreView()
                    .onTapGesture {
                        self.selectedTab = 1
                    }
                    .tabItem { Image(systemName: "magnifyingglass") }
                    .tag(1)
                
                ProfileView(user: user)
                    .onTapGesture {
                        self.selectedTab = 4
                    }
                    .tabItem { Image(systemName: "person.fill") }
                    .tag(4)
                    .navigationTitle("Profile")
            }
        }
        
        
    }
}

#Preview {
    MainTabView()
}
