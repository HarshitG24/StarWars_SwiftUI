//
//  Vehicles.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/29/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation

struct Vehicles: Decodable, Hashable {
    var name: String
    var model: String
    var manufacturer: String
    var cost_in_credits: String
    var length: String
    var max_atmosphering_speed: String
    var crew: String
    var passengers: String
    var cargo_capacity: String
    var consumables: String
    var vehicle_class: String
    var pilots: [URL]
    var films: [URL]
    var created: String
    var edited: String
    var url: URL
}
