//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Ali Kolukirik on 5.02.2023.
//

import SwiftUI

struct SampleListView: View {

    private let items: Array<String> = ["gear", "person", "arrow"]

    var body: some View {
        List {
            Section {
                Text("Profile")
                    .font(.largeTitle)
                HStack {
                    Image(systemName: "person.crop.circle")
                    Text("Test")
                    Spacer()
                    Image(systemName: "gear")
                    Image(systemName: "chevron.right")
                }
                Text("Test2")
                Text("Test3")
            }

            Section (header: Text("Header").font(.footnote), content:  {
                HStack {
                    Image(systemName: "person.crop.circle")
                    Text("Test")
                    Spacer()
                    Image(systemName: "gear")
                    Image(systemName: "chevron.right")
                }
                Text("Test2")
                Text("Test3")
            })
        }
        .listStyle(GroupedListStyle.init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SampleListView()
    }
}
