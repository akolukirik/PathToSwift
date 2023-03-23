//
//  CustomTabView.swift
//  SwiftUITutorial
//
//  Created by Ali Kolukirik on 23.03.2023.
//

import SwiftUI

struct CustomTabView: View {

    @State private var selectedIntex = CustomTabs.home

    var body: some View {
        VStack {
            Button("Reset") {
                selectedIntex = CustomTabs.home
            }
            TabView(selection: $selectedIntex) {
                HearthView().tabItem {
                    Image(systemName: "heart")
                    Text("Tab Label 1")
                }.tag(CustomTabs.home)

                StarView().tabItem {
                    Image(systemName: "star")
                    if selectedIntex == CustomTabs.heart {
                        Text("Tab Label 2")
                    }
                }.tag(CustomTabs.heart)
            }.accentColor(.orange)
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

struct HearthView: View {

    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]

    var body: some View {

        NavigationView {
            VStack {
                    NavigationLink(destination: Text("Sample")) {
                        Label("Lightning", systemImage: "bolt.fill")
                    }
                List {
                       ForEach(fruits, id: \.self) { fruit in
                           Text(fruit)
                       }
    //                   .onDelete { fruits.remove(atOffsets: $0) }
    //                   .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
                   }
                   .navigationTitle("Fruits")
                   .toolbar {
                       EditButton()
               }
            }
           }
    }
}

struct StarView: View {
    var body: some View {
        Text("Tab Content 2")
    }
}

