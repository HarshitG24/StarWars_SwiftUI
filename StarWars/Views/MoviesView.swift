//
//  MoviesView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/30/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviesView: View {
    var body: some View {
        
        NavigationView{
            ZStack {
                Color(UIColor(red: 0.11, green: 0.13, blue: 0.19, alpha: 1.00))
                    .edgesIgnoringSafeArea(.all)
    
        VStack{
            HStack{
                Text("Movies")
                    .foregroundColor(Color.white)
                    .font(.custom("Rockwell-Bold", size: 40))
                Spacer()
            }
            
             List{
                Section{
                    ForEach(0..<moviesData.count, id: \.self){i in
                    
                        
                     NavigationLink(destination: MovieInfoView(movie: moviesData[i])) {
                         
                        MovieRow(movie: moviesData[i])
                     }.listRowBackground(Color(UIColor(red: 0.11, green: 0.13, blue: 0.19, alpha: 1.00)))
                                
                }
                }
                
             }.rotationEffect(Angle(degrees: 360)).animation(.easeIn)
            
            Spacer()
        }.padding([.horizontal, .top], 20)
                
            }.navigationBarTitle("Movies")
            .navigationBarHidden(true)
        }.accentColor(Color.black)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

struct MovieRow: View {
    var movie: Movie
    var body: some View {
        HStack {
            WebImage(url: URL(string: movie.posterUrl))
                .onSuccess(){ image, data, cacheType in

            }.resizable()
            .frame(width: 100, height: 140, alignment: .center)
            
            VStack{
                HStack {
                    Text(movie.name)
                        .foregroundColor(Color.white)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Spacer()
                }
                
                MovieDetailRow(txt: "Release: ", val: movie.releaseDate)
                MovieDetailRow(txt: "Director: ", val: movie.director)
                MovieDetailRow(txt: "Duration: ", val: movie.duration)
                MovieDetailRow(txt: "Genre: ", val: movie.genre)
                MovieDetailRow(txt: "Rating: ", val: "IMDb \(movie.rating)")
                
                Spacer()
            }.padding(.leading, 10)
        }
    }
}

struct MovieDetailRow: View {
    var txt: String
    var val: String
    var body: some View {
        HStack{
            Text(txt)
                .foregroundColor(Color.gray)
                .font(.system(size: 10))
            Text(val)
                .foregroundColor(Color.white)
                .font(.system(size: 10))
            
            Spacer()
        }.padding(.top, 10)
    }
}
