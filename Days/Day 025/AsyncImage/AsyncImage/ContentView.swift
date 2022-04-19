//
//  ContentView.swift
//  AsyncImage
//
//  Created by ali on 19.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            VStack {
                AsyncImage(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/516.jpeg")!) { image in
                    image.resizable().frame(width: 300, height: 300, alignment: .center)
                } placeholder: {
                    ProgressView()
                }
                List(superHeroArray) { superhero in
                    Text(superhero.name)
                        .font(.title3)
                        .foregroundColor(.blue)
                }.navigationTitle(Text("Superhero Book"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
