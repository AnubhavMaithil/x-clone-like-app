//
//  UserStatsView.swift
//  teetar
//
//  Created by Anubhav Maithil on 11/02/24.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            
            HStack{
                Text("2M")
                    .font(.headline)
                    .bold()
                
                Text("Followers")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack{
                Text("2")
                    .font(.headline)
                    .bold()
                
                Text("Following")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
        }
    }
}

#Preview {
    UserStatsView()
}
