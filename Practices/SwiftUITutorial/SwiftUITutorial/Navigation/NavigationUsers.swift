//
//  NavigationUsers.swift
//  SwiftUITutorial
//
//  Created by Ali Kolukirik on 21.03.2023.
//

import SwiftUI

struct NavigationUsers: View {

    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView {
            List(NavigationUserModel.samples, id: \.id) { data in
                NavigationLink {
                    UserViewDetail(user: data)
                } label: {
                    Text(data.name ?? "")
                }
            }.sheet(isPresented: $isPresented, onDismiss: {
                print("onDismiss")
            }, content: {
                Button("Helloo!!") {
                    isPresented.toggle()
                }
            })
            .listStyle(GroupedListStyle())
                .navigationTitle(Text("Users"))
                .toolbar {
                    ToolbarItem {
                        Button("Open Sheet") {
                            isPresented.toggle()
                        }
//                        NavigationLink("Welcome") {
//                            Text("Products").background(Color.red)
//                        }
                    }
                }
        }
    }
}

struct NavigationUsers_Previews: PreviewProvider {
    static var previews: some View {
        NavigationUsers()
    }
}
