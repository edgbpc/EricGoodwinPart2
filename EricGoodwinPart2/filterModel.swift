//
//  filterModel.swift
//  EricGoodwinPart2
//
//  Created by Eric Goodwin on 12/6/18.
//  Copyright © 2018 umsl. All rights reserved.
//

import Foundation

class filterModel {
    var filteredMovies: [Movie] = []
    var results: [Movie] = []


    func filterMovies(index filter: Int){
        if filter < 5 {
            filteredMovies = movies.filter { $0.boxOffice == FilterOption.allCases[filter]}
        } else {
            filteredMovies = movies.filter {$0.genre == FilterOption.allCases[filter]}
        }
    }
    
    deinit {
        print(String(describing: type(of: self)) + " destroyed.")
    }

}
