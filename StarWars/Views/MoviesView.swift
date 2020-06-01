//
//  MoviesView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/30/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
//       init() {
//
//           UINavigationBar.appearance().backgroundColor = .black
//
//            UINavigationBar.appearance().largeTitleTextAttributes = [
//               .foregroundColor: UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00),
//               .font : UIFont(name:"Rockwell-Bold", size: 40)!
//           ]
//
//       }
    
    @ObservedObject var movie = MovieVC()
    var body: some View {
        
        NavigationView{
            ZStack {
                Color(UIColor(red: 0.11, green: 0.13, blue: 0.19, alpha: 1.00))
                    .edgesIgnoringSafeArea(.all)
              //  Color.white
                

        VStack{
            HStack{
                Text("Movies")
                    .foregroundColor(Color.white)
                    .font(.custom("Rockwell-Bold", size: 40))
                Spacer()
            }
            
            if self.movie.movieimg.count == swMovies.count{
             List{
                Section{
                    ForEach(0..<swMovies.count, id: \.self){i in
                    
                        
                     NavigationLink(destination: MovieInfoView(movie: moviesData[i])) {
                         
                        MovieRow(movie: moviesData[i], img: self.movie.movieimg[i])
                     }.listRowBackground(Color(UIColor(red: 0.11, green: 0.13, blue: 0.19, alpha: 1.00)))
                                
                }
                }
                
             }.rotationEffect(Angle(degrees: 360)).animation(.easeIn)
    }
            
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
    var img: UIImage
    var body: some View {
        HStack {
            Image(uiImage: img)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150, alignment: .center)
                .cornerRadius(10)
            
            
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
