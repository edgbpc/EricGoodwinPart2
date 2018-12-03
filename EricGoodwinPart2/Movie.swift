//
//  MovieObject.swift
//  EricGoodwinPart2
//
//  Created by Eric Goodwin on 12/2/18.
//  Copyright © 2018 umsl. All rights reserved.
//

import Foundation

enum FilterOption: CaseIterable, CustomStringConvertible {
    case twoBillionOrMore
    case oneBilliontoTwoBillion
    case fiveHundredMillionToOneBillion
    case oneHundredMillionToFiveHundredMillion
    case underOneHundredMillion
    case fantasy
    case scienceFiction
    case childrens
    case action
    case drama
    
    
    var description: String {
        switch self {
            case .twoBillionOrMore: return " >$2 Billion"
            case .oneBilliontoTwoBillion: return "$1 Billion to $2 Billion"
            case .fiveHundredMillionToOneBillion: return "$500 Million to  $1 Billion"
            case .oneHundredMillionToFiveHundredMillion: return "$100 Million to $500 Million"
            case .underOneHundredMillion: return " <$100 Million"
            case .fantasy: return "Fantasy"
            case .childrens: return "Children's"
            case .scienceFiction: return "Science Fiction"
            case .action: return "Action"
            case .drama: return "Drama"
            
        }
    }
}



struct Movie {
    let name: String
    let yearReleased: Int
    let genre: FilterOption
    let boxOffice: FilterOption
    let director: String
    let studio: String
    
    init(name: String, yearReleased: Int, genre: FilterOption, boxOffice: FilterOption, director: String, studio: String){
        self.name = name
        self.yearReleased = yearReleased
        self.genre = genre
        self.boxOffice = boxOffice
        self.director = director
        self.studio = studio

    }
    
    
}

var movies: [Movie] = [
    Movie(name: "Star Wars: The Force Awakens", yearReleased: 2015, genre: FilterOption.scienceFiction, boxOffice: FilterOption.twoBillionOrMore, director: "JJ Abrams", studio: "Walk Disney Studios"),
    Movie(name: "Inside Out", yearReleased: 2015, genre: FilterOption.childrens, boxOffice: FilterOption.fiveHundredMillionToOneBillion, director: "Peter Docter", studio: "Walt Disney Studios"),
    Movie(name: "Jurassic World", yearReleased: 2015, genre: FilterOption.action, boxOffice: FilterOption.oneBilliontoTwoBillion,
          director: "Colin Trevorrow", studio: "Universal"),
    Movie(name: "LOTR: The Return of the King", yearReleased: 2003, genre: FilterOption.fantasy, boxOffice: FilterOption.oneBilliontoTwoBillion, director: "Peter Jackson", studio: "New Line Cinema"),
    Movie(name: "Finding Nemo", yearReleased: 2003, genre: FilterOption.childrens, boxOffice: FilterOption.fiveHundredMillionToOneBillion, director: "Andrew Stanton", studio: "Walt Disney Studios"),
    Movie(name: "LOTR: The Fellowship of the Ring", yearReleased: 2001, genre: FilterOption.fantasy, boxOffice: FilterOption.fiveHundredMillionToOneBillion,director: "Peter Jackson", studio: "New Line Cinema"),
    Movie(name: "Ocean's Eleven", yearReleased: 2001, genre: FilterOption.drama, boxOffice:
        FilterOption.fiveHundredMillionToOneBillion, director: "Steven Soderbergh", studio: "Warner Bros."),
    Movie(name: "The Mummy Returns", yearReleased: 2001, genre: FilterOption.action, boxOffice: FilterOption.fiveHundredMillionToOneBillion, director: "Stephen Sommers", studio: "Universal")
]

