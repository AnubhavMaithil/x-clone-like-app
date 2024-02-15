//
//  TextArea.swift
//  teetar
//
//  Created by Anubhav Maithil on 12/02/24.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    var placeholder: String
    
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty == true {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
                        
        }
        .font(.body)
    }
    
}



