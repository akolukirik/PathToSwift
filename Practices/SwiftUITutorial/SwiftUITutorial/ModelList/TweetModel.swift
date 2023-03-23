//
//  TweetModel.swift
//  SwiftUITutorial
//
//  Created by Ali Kolukirik on 16.03.2023.
//

import Foundation

struct TweetModel: Identifiable {
    let id: UUID = UUID()
    let userName: String
    var body: String
    var likeCount: Int?
}


extension TweetModel {
    /// Sample tweet arrays
    static let tweets = [
        TweetModel(userName: "ali", body: "hello", likeCount: 10),
        TweetModel(userName: "ali2", body: "hello2", likeCount: 15),
        TweetModel(userName: "ali3", body: "hello3")
    ]

    static let fakeTweet =  TweetModel(userName: "ali", body: "hello", likeCount: 10)
}
