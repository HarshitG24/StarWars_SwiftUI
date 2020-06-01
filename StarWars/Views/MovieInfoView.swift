//
//  MovieInfoView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/30/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct MovieInfoView: View {
    var movie: Movie
    @State var movieimg: UIImage?
    @State var hasimg: Bool = false
    @State var showSheet: Bool = false
    var body: some View {
        ZStack {
            //            Color(UIColor(red: 0.12, green: 0.15, blue: 0.27, alpha: 1.00))
            //                .edgesIgnoringSafeArea(.all)
            Color(UIColor(red: 0.11, green: 0.13, blue: 0.19, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            
            if hasimg{
                VStack{
                    Image(uiImage: self.movieimg!)
                        .resizable()
                        //.scaledToFit()
                        .aspectRatio(2, contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                        //.frame(height: 200, alignment: .topLeading)
                        .background(Color.green)
                        .transition(.opacity)
                    
                    VStack{
                        MovieSpecs(txt1: "Director: ", txt2: "Time: ", val1: movie.director, val2: movie.duration)
                        
                        MovieSpecs(txt1: "Genre: ", txt2: "Release: ", val1: movie.genre, val2: movie.releaseDate)
                    }.padding(.top, 20)
                    
                    HStack {
                        Image("imdb")
                            .resizable()
                            .frame(width:40, height: 40)
                            .padding(.trailing, 10)
                        Text(movie.rating)
                            .font(.system(size: 14))
                        Spacer()
                    }.foregroundColor(Color.yellow)
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                        .offset(x: 0, y: -20)
                    
                    VStack {
                        HStack {
                            Text("Synopsis")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.bottom, 15)
                        
                        
                        Text(movie.summary)
                            .foregroundColor(Color(UIColor(red: 0.49, green: 0.53, blue: 0.60, alpha: 1.00)))
                            .font(.system(size: 16))
                        
                        Button(action:{
                            self.showSheet.toggle()
                        }){
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .frame(width: 200, height: 40, alignment: .center)
                                
                                Text("Show Trailer")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                            }
                        }.padding(.top, 20)
                        .sheet(isPresented: $showSheet) {
                            TrailerView(url: self.movie.trailerUrl)
                        }
                        
                    }.padding(.horizontal, 20)
                        .offset(x: 0, y: -25)
                    
                    Spacer()
                }.padding(.top, 0.5)
            }
        }
        .onAppear(perform: downloadImage)
        .navigationBarTitle("\(movie.name)", displayMode: .inline)
        //        .navigationBarHidden(true)
        //        .navigationBarBackButtonHidden(true)
    }
    
    func downloadImage(){
        
        let url = URL(string: self.movie.imgURL)
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let data = data else {return}
            
            if let img = UIImage(data: data){
                DispatchQueue.main.async {
                    withAnimation{
                        self.movieimg = img
                        self.hasimg.toggle()
                    }
                }
            }
        }.resume()
    }
}

//struct MovieInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieInfoView(movie: moviesData[0])
//    }
//}

struct MovieSpecs: View {
    var txt1: String
    var txt2: String
    var val1: String
    var val2: String
    var body: some View {
        HStack{
            HStack{
                Text(txt1)
                    .foregroundColor(Color(UIColor(red: 0.49, green: 0.53, blue: 0.60, alpha: 1.00)))
                
                Text(val1)
                    .foregroundColor(Color.white)
                
            }
            
            Spacer()
            HStack{
                Text(txt2)
                    .foregroundColor(Color(UIColor(red: 0.49, green: 0.53, blue: 0.60, alpha: 1.00)))
                
                Text(val2)
                    .foregroundColor(Color.white)
                
            }
            
        }.padding(.horizontal, 20)
            .padding(.bottom, 15)
            .font(.custom("Starjedi", size: 14))
    }
}
