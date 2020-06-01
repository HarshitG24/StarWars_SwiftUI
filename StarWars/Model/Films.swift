//
//  Film.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/29/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation

struct Films: Decodable, Hashable {
    var title: String
    var episode_id: String
    var opening_crawl: String
    var director: String
    var producer: String
    var release_date: String
    var characters: [URL]
    var planets: [URL]
    var starships: [URL]
    var vehicles: [URL]
    var species: [URL]
    var created: String
    var edited: String
    var url: URL
}
