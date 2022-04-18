//
//  ContentView.swift
//  AnimalsWidged
//
//  Created by ali on 15.04.2022.
//

import SwiftUI
import WidgetKit

let animalsArray = [shark,rhino,squid]

struct ContentView: View {

    var body: some View {
        VStack {
            ForEach(animalsArray) { animals in
                AnimalView(animal: animals).onTapGesture {
                    saveToDefaults(animal: animals)
                }
            }
        }
    }
    func saveToDefaults(animal : Animals) {
       print("aaa")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
