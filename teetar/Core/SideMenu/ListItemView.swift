//
//  ListItemView.swift
//  teetar
//
//  Created by Anubhav Maithil on 11/02/24.
//

import SwiftUI

struct ListItemView: View {
    
    let item: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: item.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

//#Preview {
//    ListItemView(item: )
//}
