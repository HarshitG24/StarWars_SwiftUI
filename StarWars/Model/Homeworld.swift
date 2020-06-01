//
//  Homeworld.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation

struct Homeworld: Decodable, Hashable{
    var name: String
    var rotation_period: String
    var orbital_period: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surface_water: String
    var population: String
    var residents: [URL]
    var films: [URL]
    var created: String
    var edited: String
    var url: URL
}
