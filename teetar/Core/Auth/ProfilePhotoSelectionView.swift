//
//  ProfilePhotoSelectionView.swift
//  teetar
//
//  Created by Anubhav Maithil on 13/02/24.
//

import SwiftUI

struct ProfilePhotoSelectionView: View {
    var body: some View {
        VStack{
            
            AuthHeaderComp(heading1: "Complete your account", heading2: "Add Profile photo")
            
            Button {
                print("Select image")
            } label: {
                Image(systemName: "photo.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(Color(uiColor: .systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .padding(.top, 50)

            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfilePhotoSelectionView()
}
