//
//  UserRowView.swift
//  teetar
//
//  Created by Anubhav Maithil on 11/02/24.
//

import SwiftUI

struct UserRowView: View {
    
    let user: User
    
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
                .foregroundColor(.primary)
            
            VStack(alignment: .leading){
                Text(user.fullName)
                    .font(.subheadline).bold()
                    .foregroundColor(.primary)
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//#Preview {
//    UserRowView()
//}
