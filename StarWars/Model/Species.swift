//
//  Species.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/29/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation

struct Species: Decodable {
    var name: String
    var classification: String
    var designation: String
    var average_height: String
    var skin_colors: String
    var hair_colors: String
    var eye_colors: String
    var average_lifespan: String
    var homeworld: URL
    var language: String
    var people: [URL]
    var films: [URL]
    var created: String
    var edited: String
    var url: URL
}
