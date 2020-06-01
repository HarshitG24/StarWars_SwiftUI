//
//  HomeView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct HomeView: View {
   @State var starwar: StarWars?
   @State var homeworld: URL?
   @State var films: [URL] = []
   @State var species: [URL] = []
   @State var vehicles: [URL] = []
   @State var starships: [URL] = []
    @State var multiplier = 1
    
//    init() {
//
//        UINavigationBar.appearance().backgroundColor = .clear
//
//         UINavigationBar.appearance().largeTitleTextAttributes = [
//            .foregroundColor: UIColor(red: 1.00, green: 0.80, blue: 0.48, alpha: 1),
//            .font : UIFont(name:"Rockwell-Bold", size: 32)!
//        ]
//
//    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("10")
                .resizable()
                .edgesIgnoringSafeArea(.all)
//                LinearGradient(gradient: .init(colors: [
////                    Color(UIColor(red: 0.18, green: 0.04, blue: 0.24, alpha: 1.00)),
////                    Color(UIColor(red: 0.75, green: 0.27, blue: 0.24, alpha: 1.00)),
////                    Color(UIColor(red: 0.85, green: 0.57, blue: 0.36, alpha: 1.00))
//                    // .blue, .purple
//                    .red, .yellow
//                ]), startPoint: .top, endPoint: .bottom)
//                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image("title2")
                    .resizable()
                    .foregroundColor(Color.white)
                    .scaledToFit()
                        .padding(.top, 20)
                        
                    .frame(width: UIScreen.main.bounds.width - 70)
                    Spacer()
                    
                    self.starwar != nil ?
                        withAnimation{
                            BioData(starwar: self.starwar!).rotationEffect(Angle(degrees: Double(360 * self.multiplier))).animation(.spring(response:1))
                        }
                        : nil
                   
                   
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.black)
                        .frame(width: UIScreen.main.bounds.width-60, height: 50, alignment: .center)
                    
                    HStack{
                        
                        NavigationLink(destination: HomeWorld(homeworld: self.starwar?.homeworld)) {
                            ImageDisplayer(name: "home", imgColor: true)
                        }
                        
                        Spacer()
                        
                       
                        NavigationLink(destination: VehiclesView(vehicles: self.vehicles)) {
                            ImageDisplayer(name: "vehicles", imgColor: self.vehicles.count > 0 ? true : false)
                        } .disabled(self.vehicles.count > 0 ? false : true)
                        
                        Spacer()
                        
                        NavigationLink(destination: StarshipView(starshipURL: self.starships)) {
                            ImageDisplayer(name: "starships", imgColor: self.starships.count > 0 ? true : false)
                        }.disabled(self.starships.count > 0 ? false : true)
                        
                        Spacer()
                        
                        NavigationLink(destination: SpeciesView(speciesURL: self.species)) {
                            ImageDisplayer(name: "avatar3", imgColor: self.species.count > 0 ? true : false)
                        }.disabled(self.species.count > 0 ? false : true)
                        
                    }.padding(.horizontal, 60)
                    
                    }
                    
                    Spacer()
                    
                    Button(action:{
                        self.loadData()
                        self.multiplier += 1
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.black)
                                .opacity(0.8)
                                .frame(width: UIScreen.main.bounds.width - 150, height: 50, alignment: .center)
                                
                            
                            Text("Random")
                                .foregroundColor(Color.yellow)
                                .font(.system(size: 28))
                                .fontWeight(.bold)
                        }
                    }
                    
                    Spacer()
                    
                }.padding(.horizontal, 20)
                .padding(.bottom, 25)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .onAppear(perform: loadData)
    }
    
    func loadData(){
        
        let randomInt = generateRandomNumber()

        let request = URLRequest(url: URL(string: base_url + "people/\(randomInt)/")!)

        URLSession.shared.dataTask(with: request){data,response,error in
            guard let data = data else{return}
            if let starwarsprofile = try? JSONDecoder().decode(StarWars.self, from: data){

                DispatchQueue.main.async {
                   self.starwar = starwarsprofile
                   self.homeworld = self.starwar!.homeworld
                   self.films = self.starwar!.films
                   self.species = self.starwar!.species
                   self.vehicles = self.starwar!.vehicles
                   self.starships = self.starwar!.starships
                }
            }

        }.resume()
    }
    
    func generateRandomNumber() -> Int{
        return Int.random(in: 1...83)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct BioData: View {
    var starwar: StarWars
    
    var body: some View {
        VStack {
            ZStack{
                DetailBox()
                VStack{
                    BioTxt(name: "Name:", value: self.starwar.name)
                    BioTxt(name: "Height:", value: self.starwar.height)
                    BioTxt(name: "Mass:", value: self.starwar.mass)
                    BioTxt(name: "Gender:", value: self.starwar.gender)
                }
            }.background(Color.clear)
            .padding(.horizontal, 20)
            
            
        }.background(Color.clear)
        
    }
}


struct BioTxt: View {
    var name: String
    var value: String
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.top, 10)
            Spacer()
            Text(value)
                .font(.system(size: 18))
                .fontWeight(.medium)
            .padding(.top, 10)
        }.foregroundColor(Color.white)
        .padding(.horizontal, 40)
    }
}

struct StarOptions: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.black)
            .frame(width: (UIScreen.main.bounds.width / 2) - 60, height: 40, alignment: .center)
            .opacity(0.5)
    }
}

struct StarNavigation: View {
    var title: String
    var imageName: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color.blue)
            Image(imageName)
            .resizable()
                .renderingMode(.original)
            .scaledToFit()
                .frame(width: 20, height: 20, alignment: .center)
        }
    }
}

struct DetailBox: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.black)
            .frame(width: UIScreen.main.bounds.width - 60 ,height: 200)
            .opacity(0.8)
            // .border(Color.red)
            .padding(.horizontal, 20)
    }
}

struct ImageDisplayer: View {
    var name: String
    var imgColor: Bool
    var body: some View {
        Image(name)
            .resizable()
//            .renderingMode(.original)
            .foregroundColor(imgColor == true ? Color.yellow : Color.gray)
            .frame(width: 30, height: 30, alignment: .center)
    }
}


//                    VStack{
//                        HStack{
//
//                            NavigationLink(destination: HomeWorld(homeworld: self.starwar?.homeworld)) {
//                                ZStack {
//                                    StarOptions()
//                                    StarNavigation(title: "HomeWorld", imageName: "home")
//                                }
//                            }
//
//                            Spacer()
//
//                            NavigationLink(destination: VehiclesView(vehicles: self.vehicles)) {
//                                ZStack {
//                                    StarOptions()
//                                    StarNavigation(title: "Vehicles", imageName: "vehicles")
//                                }
//                            }
//
//                        }.padding(.horizontal, 45)
//
//                        HStack{
//
//                            NavigationLink(destination: StarshipView(starshipURL: self.starships)) {
//                                ZStack {
//                                    StarOptions()
//                                    StarNavigation(title: "Starship", imageName: "starships")
//                                }
//                            }
//
//                            Spacer()
//
//                            NavigationLink(destination: FilmView(filmURL: self.films)) {
//                                ZStack {
//                                    StarOptions()
//                                    StarNavigation(title: "Films", imageName: "films")
//                                }
//                            }
//
//                        }.padding(.horizontal, 45)
//                    }.padding(.top, 30)
