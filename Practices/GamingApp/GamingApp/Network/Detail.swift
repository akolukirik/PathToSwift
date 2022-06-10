//
//  Detail.swift
//  GamingApp
//
//  Created by ali on 2.06.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome {
    var id: Int?
    var slug, name, nameOriginal, welcomeDescription: String?
    var metacritic: Int?
    var metacriticPlatforms: [MetacriticPlatform]?
    var released: String?
    var tba: Bool?
    var updated: String?
    var backgroundImage, backgroundImageAdditional: String?
    var website: String?
    var rating: Double?
    var ratingTop: Int?
    var ratings: [Rating]?
    var reactions: [String: Int]?
    var added: Int?
    var addedByStatus: AddedByStatus?
    var playtime, screenshotsCount, moviesCount, creatorsCount: Int?
    var achievementsCount, parentAchievementsCount: Int?
    var redditURL: String?
    var redditName, redditDescription, redditLogo: String?
    var redditCount, twitchCount, youtubeCount, reviewsTextCount: Int?
    var ratingsCount, suggestionsCount: Int?
    var alternativeNames: [String]?
    var metacriticURL: String?
    var parentsCount, additionsCount, gameSeriesCount: Int?
    var userGame: NSNull?
    var reviewsCount: Int?
    var saturatedColor, dominantColor: String?
    var parentPlatforms: [ParentPlatform]?
    var platforms: [PlatformElement]?
    var stores: [Store]?
    var developers, genres, tags, publishers: [Developer]?
    var esrbRating: EsrbRating?
    var clip: NSNull?
    var descriptionRaw: String?
}

// MARK: - AddedByStatus
struct AddedByStatus {
    var yet, owned, beaten, toplay: Int?
    var dropped, playing: Int?
}

// MARK: - Developer
struct Developer {
    var id: Int?
    var name, slug: String?
    var gamesCount: Int?
    var imageBackground: String?
    var domain: String?
    var language: Language?
}

enum Language {
    case eng
}

// MARK: - EsrbRating
struct EsrbRating {
    var id: Int?
    var name, slug: String?
}

// MARK: - MetacriticPlatform
struct MetacriticPlatform {
    var metascore: Int?
    var url: String?
    var platform: MetacriticPlatformPlatform?
}

// MARK: - MetacriticPlatformPlatform
struct MetacriticPlatformPlatform {
    var platform: Int?
    var name, slug: String?
}

// MARK: - ParentPlatform
struct ParentPlatform {
    var platform: EsrbRating?
}

// MARK: - PlatformElement
struct PlatformElement {
    var platform: PlatformPlatform?
    var releasedAt: String?
    var requirements: Requirements?
}

// MARK: - PlatformPlatform
struct PlatformPlatform {
    var id: Int?
    var name, slug: String?
    var image, yearEnd: NSNull?
    var yearStart: Int?
    var gamesCount: Int?
    var imageBackground: String?
}

// MARK: - Requirements
struct Requirements {
    var minimum, recommended: String?
}

// MARK: - Rating
struct Rating {
    var id: Int?
    var title: String?
    var count: Int?
    var percent: Double?
}

// MARK: - Store
struct Store {
    var id: Int?
    var url: String?
    var store: Developer?
}
