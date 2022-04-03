//
//  ContentView.swift
//  FavoriteBook
//
//  Created by ali on 3.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            List {
                ForEach(myFavorites) { favorite in
                    Section(header: Text(favorite.title)) {
                        ForEach(favorite.elements) { element in
                            NavigationLink(destination: DetailsView(chosenFavoriteElement: element)) {
                                Text(element.name)
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text("FavoiteBook"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
