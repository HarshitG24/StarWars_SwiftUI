//
//  Planet.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/30/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation

struct Planet: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var description: String
    var suns: Int
    var Moons: Int
    var rotation_period: Int
    var orbital_period: Int
    var climate: String
    var atmosphere: String
    var imgURL: String
}
