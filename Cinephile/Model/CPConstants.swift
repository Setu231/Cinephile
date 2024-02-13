//
//  CPConstants.swift
//  Cinephile
//
//  Created by Setu Desai on 2/12/24.
//

import Foundation

enum CPServiceCallString: String {
    case allMovie = "https://api.themoviedb.org/3/trending/movie/day?language=en-US"
    case posterImage = "http://image.tmdb.org/t/p/w500"
    case searchAll = "https://api.themoviedb.org/3/search/movie?query=%@&include_adult=false&language=en-US&page=1"
    case movieDetail = "https://api.themoviedb.org/3/movie/%@?language=en-US"

}

struct CPMovieResponse: Codable {
    var page: Int?
    var results: [CPMovie]?
    var totalPages: Int?
    var totalResults: Int?
}

struct CPMovie: Hashable, Codable, Identifiable {
    var adult: Bool?
    var backdropPath: String?
    var id: Int?
    var title: String?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var mediaType: String?
    var genreIds: [Int]?
    var popularity: Double?
    var firstAirDate: Date?
    var voteAverage: Double?
    var voteCount: Int?
    var originCountry: [String]?
    var name: String?
}

struct CPMovieDetail: Codable, Identifiable {
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: String?
    var budget: Int?
    var genres: [CPMovieGenre]?
    var homepage: String?
    var id: Int?
    var imdbId: String?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [CPMovieProductionHouse]?
    var productionCountries: [CPMovieProductionCountries]?
    var releaseDate: String?
    var revenue: Int?
    var runtime: Int?
    var spokenLanguages: [CPMovieLanguage]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Double?
}
        
struct CPMovieGenre: Codable, Identifiable {
    var id: Int?
    var name: String?
}

struct CPMovieProductionHouse: Codable, Identifiable {
    var id: Int?
    var logoPath: String?
    var name: String?
    var originCountry: String?
}

struct CPMovieProductionCountries: Codable {
    var iso31661: String?
    var name: String?
}

struct CPMovieLanguage: Codable {
    var englishName: String?
    var iso6391: String?
    var name: String?
}
