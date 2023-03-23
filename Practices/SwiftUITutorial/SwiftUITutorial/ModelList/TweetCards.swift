//
//  TweetCards.swift
//  SwiftUITutorial
//
//  Created by Ali Kolukirik on 21.03.2023.
//

import SwiftUI

struct TweetCards: View {

    let tweet: TweetModel

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(tweet.userName).font(.title)
            Text("\(tweet.body)").font(.title3)

            if tweet.likeCount != nil {
                HStack {
                    Text("\(tweet.likeCount!)").fontWeight(.light)
                    Image(systemName: "heart.circle.fill")
                    Spacer()
                }
            }
            Spacer()
        }.padding(2)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.red, lineWidth: 2)).padding(2)
            .frame(height: 100,
                   alignment: .top)
    }
}

struct TweetCards_Previews: PreviewProvider {
    static var previews: some View {
        TweetCards(tweet: TweetModel.fakeTweet).previewLayout(.sizeThatFits)
    }
}
