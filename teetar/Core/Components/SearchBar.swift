//
//  SearchBar.swift
//  teetar
//
//  Created by Anubhav Maithil on 14/02/24.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack{
            TextField("Search...", text: $text)
                .padding(10)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                    }
                )
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
