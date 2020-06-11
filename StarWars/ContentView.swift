//
//  ContentView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .yellow
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
    }
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Star War")
            }
            
//            PlanetTab()
//            .tabItem {
//                    Image("p2")
//                        .renderingMode(.template)
//                    Text("Planets")
//                        .foregroundColor(Color.yellow)
//            }
            
            MoviesView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
            }
            
            QuizTab()
                .tabItem {
                    Image("quiz2")
                        .renderingMode(.template)
                    Text("Quiz")
            }
        }.accentColor(.yellow)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
