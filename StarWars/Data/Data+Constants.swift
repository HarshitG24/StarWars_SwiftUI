//
//  Data+Constants.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation
import UIKit

var base_url = "https://swapi.dev/api/"
var movie_url = "http://www.omdbapi.com/?apikey=85743106"

var COLOR1 = UIColor(red: 0.92, green: 0.23, blue: 0.35, alpha: 1.00)
var COLOR2 = UIColor(red: 0.98, green: 0.51, blue: 0.19, alpha: 1.00)
var COLOR3 = UIColor(red: 0.97, green: 0.72, blue: 0.19, alpha: 1.00)
var COLOR4 = UIColor(red: 0.18, green: 0.60, blue: 0.85, alpha: 1.00)

var planetHomePage = [
    PlanetName(name: "Tatooine", imageUrl: "https://vignette.wikia.nocookie.net/starwars/images/b/b0/Tatooine_TPM.png/revision/latest?cb=20131019121937", planetImg: nil, planet: planets[0]),
 
    PlanetName(name: "Coruscant", imageUrl: "https://i.pinimg.com/originals/17/a3/fd/17a3fdc7ac714ea17be17824fcd3ca83.jpg", planetImg: nil, planet: planets[1]),
 
    PlanetName(name: "Hoth", imageUrl: "https://vignette.wikia.nocookie.net/starwars/images/8/81/Hoth_AoRCR.png/revision/latest?cb=20170222025915", planetImg: nil, planet: planets[2]),
 
    PlanetName(name: "Naboo", imageUrl:  "https://vignette.wikia.nocookie.net/starwars/images/4/41/Naboo_FFGRebellion.png/revision/latest?cb=20170529051916", planetImg: nil, planet: planets[0]),
 
    PlanetName(name: "Alderan", imageUrl: "https://i.pinimg.com/originals/73/2b/df/732bdf9f1c83d007ce8ccc7d732eee1e.jpg", planetImg: nil, planet: planets[1]),
 
    PlanetName(name: "Bespin", imageUrl: "https://vignette.wikia.nocookie.net/starwars/images/2/2c/Bespin_EotECR.png/revision/latest?cb=20170222012550", planetImg: nil, planet: planets[2]),
 
    PlanetName(name: "Dagobah", imageUrl: "https://vignette.wikia.nocookie.net/starwars/images/a/af/Mustafar_DB.png/revision/latest?cb=20160118061913", planetImg: nil, planet: planets[0]),
 
    PlanetName(name: "Mustafar", imageUrl:  "https://vignette.wikia.nocookie.net/starwars/images/5/52/Kamino-DB.png/revision/latest?cb=20150920190527", planetImg: nil, planet: planets[1]),
 
    PlanetName(name: "Kamino", imageUrl:  "https://vignette.wikia.nocookie.net/starwars/images/e/ea/Kashyyyk-SW-MTHC.png/revision/latest?cb=20190605010641", planetImg: nil, planet: planets[2]),
 
 PlanetName(name: "Kashyyk", imageUrl: "https://vignette.wikia.nocookie.net/starwars/images/9/99/Yavin-Battlefront.png/revision/latest?cb=20170911200018", planetImg: nil, planet: planets[0]),
]

var imgURL = [
  "https://vignette.wikia.nocookie.net/starwars/images/b/b0/Tatooine_TPM.png/revision/latest?cb=20131019121937",
  
  "https://i.pinimg.com/originals/17/a3/fd/17a3fdc7ac714ea17be17824fcd3ca83.jpg",
  
  "https://vignette.wikia.nocookie.net/starwars/images/8/81/Hoth_AoRCR.png/revision/latest?cb=20170222025915",
  
  "https://vignette.wikia.nocookie.net/starwars/images/4/41/Naboo_FFGRebellion.png/revision/latest?cb=20170529051916",
  
  "https://i.pinimg.com/originals/73/2b/df/732bdf9f1c83d007ce8ccc7d732eee1e.jpg",
  
  "https://vignette.wikia.nocookie.net/starwars/images/2/2c/Bespin_EotECR.png/revision/latest?cb=20170222012550",
  
  
  
  
  
  "https://vignette.wikia.nocookie.net/starwars/images/4/48/Dagobah_ep3.jpg/revision/latest?cb=20100122163146",
  
  "https://vignette.wikia.nocookie.net/starwars/images/a/af/Mustafar_DB.png/revision/latest?cb=20160118061913",
  
  "https://vignette.wikia.nocookie.net/starwars/images/5/52/Kamino-DB.png/revision/latest?cb=20150920190527",
  
  "https://vignette.wikia.nocookie.net/starwars/images/e/ea/Kashyyyk-SW-MTHC.png/revision/latest?cb=20190605010641",
  
  "https://vignette.wikia.nocookie.net/starwars/images/9/99/Yavin-Battlefront.png/revision/latest?cb=20170911200018",
  
  "https://vignette.wikia.nocookie.net/starwars/images/9/96/Ryloth-Homecoming.png/revision/latest?cb=20200517155255"
]

var planets = [
 Planet(name: "Tatooine", description: "Tatooine was a sparsely inhabited circumbinary desert planet located in the galaxy's Outer Rim Territories. It was the homeworld of Anakin and Luke Skywalker, who would go on to shape galactic history. Part of a binary star system, the planet was oppressed by scorching suns, resulting in the world lacking the necessary surface water to sustain large populations. As a result, many residents of the planet instead drew water from the atmosphere via moisture farms. The planet also had no natural surface vegetation.", suns: 2, Moons: 3, rotation_period: 34, orbital_period: 304, climate: "Hot and Arid", atmosphere: "Breathable"),
 
 Planet(name: "Coruscant", description: "Coruscant, also known as Imperial Center during the rule of the Galactic Empire, was an ecumenopolis—a city-covered planet, collectively known as Galactic City— in the Coruscant system of the Core Worlds. Though debated by historians, it was generally believed that Coruscant was the original homeworld of humanity. Noted for its cosmopolitan culture and towering skyscrapers, Coruscant's population consisted of approximately one trillion citizens hailing from a vast array of both humanoid and alien species. In addition, Coruscant's strategic location at the end of several major trade routes enabled it to grow in power and influence, causing the city-planet to surpass its early rivals and become the hub of galactic culture, education, finance, fine arts, politics and technology. It was the location of several major landmarks, including the Jedi Temple, Monument Plaza and the Senate Building.", suns: 1, Moons: 4, rotation_period: 24, orbital_period: 365, climate: "Temperature", atmosphere: "Breathable"),
 
 Planet(name: "Hoth", description: "Hoth was a remote, icy planet that was the sixth planet in the star system of the same name. It notably hosted Echo Base, the temporary headquarters of the Alliance to Restore the Republic, until the Galactic Empire located the Rebels, initiating a major confrontation known as the Battle of Hoth.", suns: 1, Moons: 3, rotation_period: 0, orbital_period: 549, climate: "Frigid", atmosphere: "Breathable, Clean")
]

var swMovies = [
 "https://lumiere-a.akamaihd.net/v1/images/star-wars-the-rise-of-skywalker-theatrical-poster-1000_ebc74357.jpeg?region=0%2C0%2C891%2C1372",
 "https://m.media-amazon.com/images/M/MV5BOTM2NTI3NTc3Nl5BMl5BanBnXkFtZTgwNzM1OTQyNTM@._V1_.jpg",
 "https://geekinginindiana.com/wp/wp-content/uploads/2017/12/tlj.jpg",
 "https://www.slantmagazine.com/wp-content/uploads/2017/03/rogueoneastarwarsstorybr.jpg",
 "https://tvguide1.cbsistatic.com/feed/1/461/116208461.jpg",
 "https://m.media-amazon.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg",
 
 "https://images-na.ssl-images-amazon.com/images/I/91mJqQ3gyhL._RI_.jpg",
 "https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
 "https://images-na.ssl-images-amazon.com/images/I/71dK4mbeI1L._SL1372_.jpg",
 "https://m.media-amazon.com/images/M/MV5BMDAzM2M0Y2UtZjRmZi00MzVlLTg4MjEtOTE3NzU5ZDVlMTU5XkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_.jpg",
 "https://m.media-amazon.com/images/M/MV5BYTRhNjcwNWQtMGJmMi00NmQyLWE2YzItODVmMTdjNWI0ZDA2XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg"
]

var moviesData = [
    Movie(name: "Star War: The rise of skywalker", duration: "2h 22m", director: "J.J. Abrams", rating: "6.7/10", summary: "When it's discovered that the evil Emperor Palpatine did not die at the hands of Darth Vader, the rebels must race against the clock to find out his whereabouts. Finn and Poe lead the Resistance to put a stop to the First Order's plans to form a new Empire, while Rey anticipates her inevitable confrontation with Kylo Ren. Warning: Some flashing-lights scenes in this film may affect photosensitive viewers.", releaseDate: "December 16, 2019", imgURL: "https://lumiere-a.akamaihd.net/v1/images/star-wars-the-rise-of-skywalker-theatrical-poster-1000_ebc74357.jpeg?region=1%2C318%2C999%2C499", genre: "Sci-fi/Adventure", trailerUrl: "https://www.youtube.com/watch?v=8Qn_spdM5Zg"),
 
    Movie(name: "Solo: A star wars story", duration: "2h 15m", director: "Ron Howard", rating: "6.9/10", summary: "In a galaxy where hyperfuel is in high demand, Han Solo gets involved in a large-scale heist within the criminal underworld and meets individuals who change his life.", releaseDate: "May 10, 2018", imgURL: "https://lumiere-a.akamaihd.net/v1/images/solo-a-star-wars-story-theatrical-poster-2_f4af9297.jpeg?region=0%2C397%2C1298%2C646&width=1200", genre: "Sci-fi/Action", trailerUrl: "https://www.youtube.com/watch?v=jPEYpryMp2s"),
 
    Movie(name: "Star Wars: The Last Jedi", duration: "2h 32m", director: "Rian Johnson", rating: "7/10", summary: "Rey seeks to learn the ways of the Jedi under Luke Skywalker, its remaining member, to reinvigorate the Resistance's war against the First Order.", releaseDate: "December 9, 2017", imgURL: "https://lumiere-a.akamaihd.net/v1/images/the-last-jedi-theatrical-poster-tall-a_6a776211.jpeg?region=0%2C53%2C1536%2C768&width=1200", genre: "Sci-fi/Adventure", trailerUrl: "https://www.youtube.com/watch?v=Q0CbN8sfihY"),
 
    Movie(name: "Rogue One: A Star Wars Story", duration: "2h 13m", director: "Gareth Edwards", rating: "7.8/10", summary: "Jyn's father is forcibly taken by the Galactic Empire to help them complete the Death Star. When she grows up, she joins a group of resistance fighters who aim to steal the Empire's blueprints.", releaseDate: "December 15, 2016", imgURL: "https://lumiere-a.akamaihd.net/v1/images/rogueone_onesheeta_8a255456.jpeg?region=0%2C77%2C1688%2C849&width=1200", genre: "Sci-fi/Action", trailerUrl: "https://www.youtube.com/watch?v=frdj1zb9sMY"),
 
    Movie(name: "Star Wars: The Force Awakens", duration: "2h 15m", director: "J.J. Abrams", rating: "7.9/10", summary: "A new order threatens to destroy the New Republic. Finn, Rey and Poe, backed by the Resistance and the Republic, must find a way to stop them and find Luke, the last surviving Jedi.", releaseDate: "December 17, 2015", imgURL: "https://lumiere-a.akamaihd.net/v1/images/avco_payoff_1-sht_v7_lg_32e68793.jpeg?region=118%2C252%2C1384%2C696&width=1200", genre: "Sci-fi/Adventure", trailerUrl: "https://www.youtube.com/watch?v=sGbxmsDFVnE"),
 
    Movie(name: "Return of the Jedi", duration: "2h 16m", director: "Richard Marquand", rating: "8.3/10", summary: "Luke Skywalker attempts to bring his father back to the light side of the Force. At the same time, the rebels hatch a plan to destroy the second Death Star.", releaseDate: "May 25, 1983", imgURL: "https://lumiere-a.akamaihd.net/v1/images/Star-Wars-Return-Jedi-VI-Poster_a10501d2.jpeg?region=9%2C210%2C624%2C312", genre: "Sci-fi/Adventure", trailerUrl: "https://www.youtube.com/watch?v=5UfA_aKBGMc"),
 
    Movie(name: "The Empire Strikes Back", duration: "2h 7m", director: "Irvin Kershner", rating: "8.7/10", summary: "Darth Vader is adamant about turning Luke Skywalker to the dark side. Master Yoda trains Luke to become a Jedi Knight while his friends try to fend off the Imperial fleet.", releaseDate: "May 17, 1980", imgURL: "https://lumiere-a.akamaihd.net/v1/images/Star-Wars-Empire-Strikes-Back-V-Poster_878f7fce.jpeg?region=25%2C299%2C612%2C306", genre: "Sci-fi/Adventure", trailerUrl: "https://www.youtube.com/watch?v=JNwNXF9Y6kY"),
 
    Movie(name: "Star Wars: Episode IV - A New Hope", duration: "2h 5m", director: "George Lucas", rating: "8.6/10", summary: "After Princess Leia, the leader of the Rebel Alliance, is held hostage by Darth Vader, Luke and Han Solo must free her and destroy the powerful weapon created by the Galactic Empire.", releaseDate: "1977", imgURL: "https://lumiere-a.akamaihd.net/v1/images/Star-Wars-New-Hope-IV-Poster_c217085b.jpeg?region=40%2C219%2C586%2C293", genre: "Sci-fi/Sci-fi", trailerUrl: "https://www.youtube.com/watch?v=vZ734NWnAHA"),
 
    Movie(name: "Star Wars: Revenge of the Sith", duration: "2h 20m", director: "George Lucas", rating: "7.5/10", summary: "Anakin joins forces with Obi-Wan and sets Palpatine free from the evil clutches of Count Doku. However, he falls prey to Palpatine and the Jedis' mind games and gives into temptation.", releaseDate: "May 19, 2005", imgURL: "https://lumiere-a.akamaihd.net/v1/images/Star-Wars-Revenge-Sith-III-Poster_646108ce.jpeg?region=0%2C356%2C746%2C374", genre: "Sci-fi/Adventure", trailerUrl: "https://www.youtube.com/watch?v=5UnjrG_N8hU"),
 
    Movie(name: "Attack of the Clones", duration: " 2h 22m", director: "George Lucas", rating: "6.5/10", summary: "While pursuing an assassin, Obi Wan uncovers a sinister plot to destroy the Republic. With the fate of the galaxy hanging in the balance, the Jedi must defend the galaxy against the evil Sith.", releaseDate: "May 16, 2002", imgURL: "https://lumiere-a.akamaihd.net/v1/images/Star-Wars-Attack-Clones-II-Poster_53baa2e7.jpeg?region=0%2C188%2C678%2C340", genre: "Sci-fi/Adventure", trailerUrl: "https://www.youtube.com/watch?v=gYbW1F_c9eM"),
 
    Movie(name: "The Phantom Menace", duration: "2h 16m", director: "George Lucas", rating: "6.5/10", summary: "Jedi Knights Qui-Gon Jinn and Obi-Wan Kenobi set out to stop the Trade Federation from invading Naboo. While travelling, they come across a gifted boy, Anakin, and learn that the Sith have returned.", releaseDate: "May 19, 1999", imgURL: "https://lumiere-a.akamaihd.net/v1/images/Star-Wars-Phantom-Menace-I-Poster_f5832812.jpeg?region=0%2C250%2C678%2C340", genre: "Sci-fi/Adventure", trailerUrl: "https://www.youtube.com/watch?v=bD7bpG-zDJQ")
]

