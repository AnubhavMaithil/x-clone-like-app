//
//  SideMenuView.swift
//  teetar
//
//  Created by Anubhav Maithil on 11/02/24.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                
                
                //MARK: menu header
                VStack(alignment: .leading){
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.primary)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(user.fullName)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.leading)
                
                
                // MARK: List items
                ForEach(SideMenuViewModel.allCases, id: \.rawValue){ item in
                    
//                    if item == .profile{
//                        NavigationLink {
//                            ProfileView(user: user)
//                        } label: {
//                            ListItemView(item: item)
//                        }
//                    } else 
                    if item == .logout{
                        Button {
                            authViewModel.signOut()
                        } label: {
                            ListItemView(item: item)
                        }

                    } else{
                        ListItemView(item: item)
                    }
                    
                    
                }
                
                Spacer()
            }
            .padding()
        }
        
        
    }
}

#Preview {
    SideMenuView()
}

extension SideMenuView {
    
    
}
