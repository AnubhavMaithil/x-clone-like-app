//
//  ShowNewTweetView.swift
//  teetar
//
//  Created by Anubhav Maithil on 12/02/24.
//

import SwiftUI

struct NewTweetView: View {
    
    @State private var caption: String = ""
    
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            
            HStack{
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button{
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Post")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top){
                Circle()
                    .frame(width: 64, height: 64)

                TextArea("What's happening?", text: $caption)
                
                
            }
            .padding() 
        }
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    NewTweetView()
}
