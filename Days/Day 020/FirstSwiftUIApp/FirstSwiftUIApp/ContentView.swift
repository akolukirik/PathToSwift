//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by ali on 3.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        VStack {
            Text("Test").padding()

            Text("UI First").font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundColor(Color.orange)
                .multilineTextAlignment(.center)
                .padding()
        }
      /*  HStack  {
            Text("HStack1")
            Text("HStack2")
        }*/

       /* ZStack {
            Text("ZStack1")
            Text("ZStack2")

        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
