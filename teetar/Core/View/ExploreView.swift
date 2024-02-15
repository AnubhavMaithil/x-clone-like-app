//
//  ExploreView.swift
//  teetar
//
//  Created by Anubhav Maithil on 10/02/24.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var viewModel = ExploreViewModel()
    
    
    var body: some View {
        
        VStack{
            SearchBar(text: $viewModel.searchText)
                .padding()
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink{
                                ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
//        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    ExploreView()
}
