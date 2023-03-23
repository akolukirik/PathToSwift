//
//  ModelListView.swift
//  SwiftUITutorial
//
//  Created by Ali Kolukirik on 16.03.2023.
//

import SwiftUI

struct ModelListView: View {
    var body: some View {
        VStack {
            Text("Welcome list")
                .font(.largeTitle)
                .fontWeight(.light)

            List(TweetModel.tweets) { data in
                TweetCards(tweet: data)
            }.listStyle(.sidebar)
        }
    }
}

struct ModelListView_Previews: PreviewProvider {
    static var previews: some View {
        ModelListView()
    }
}
