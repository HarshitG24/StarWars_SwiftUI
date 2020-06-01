//
//  StarWars.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation

struct StarWars: Decodable, Hashable {
    var name : String
    var height : String
    var mass : String
    var hair_color : String
    var skin_color : String
    var eye_color : String
    var birth_year : String
    var gender : String
    var homeworld : URL
    var films: [URL]
    var species : [URL]
    var vehicles : [URL]
    var starships : [URL]
    var created : String
    var edited : String
    var url : String
}
