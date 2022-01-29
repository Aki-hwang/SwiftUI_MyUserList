//
//  ContentView.swift
//  SwiftUI_MyUserList
//
//  Created by Chuljin Hwang on 2022/01/29.
//

import SwiftUI
//https://mockapi.io
//https://61f4a86210f0f7001768c996.mockapi.io/user
struct ContentView: View {
    @State var users = [User]()
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.flexible())], content:{
                ForEach(users){user in
                    HStack{
                      Image("")
                        Text("\(user.name)")
                    }
                }
                
            })
        }
            .onAppear {
                WevService().loadUsers { (users) in
                    self.users = users
                }
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
