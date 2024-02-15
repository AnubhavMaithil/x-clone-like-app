//
//  ContentView.swift
//  teetar
//
//  Created by Anubhav Maithil on 10/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView {
            Group{
                
                // MARK: if user is not logged in
                if viewModel.userSession == nil {
                    LoginView()
                } else {
                    
                    // MARK: if user is logged in
                    mainInterface
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
//        .colorScheme(.light)
}
 


extension ContentView {
    
    
    var mainInterface: some View{
        ZStack(alignment: .topLeading){
            
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.3 : 0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300)
                .background(showMenu ? (colorScheme == .dark ? Color.black : Color.white) : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button{
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                    
                } label: {
                    Circle()
                        .frame(width: 36, height: 36)
                            .foregroundColor(.primary)
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
    
}
