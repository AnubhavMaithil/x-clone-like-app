//
//  AuthHeaderComp.swift
//  teetar
//
//  Created by Anubhav Maithil on 12/02/24.
//

import SwiftUI

struct AuthHeaderComp: View {
    
    let heading1: String
    let heading2: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: -5){
            
            HStack{
                Spacer()
            }
            
            Text(heading1)
                .font(.title)
                .fontWeight(.semibold)
            Text(heading2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .padding(.leading)
        .frame(height: 250)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
        .shadow(color: Color(.black).opacity(0.8), radius: 20, x: 0.0, y: 0.0)
    }
}

#Preview {
    AuthHeaderComp(heading1: "Get started", heading2: "Create your account!")
}
