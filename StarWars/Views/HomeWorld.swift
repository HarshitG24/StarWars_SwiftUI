//
//  HomeWorld.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct HomeWorld: View {
    
    var homeworld: URL?
    @State var name: String = "--"
    @State var climate: String = "--"
    @State var terrain: String = "--"
    @State var population: String = "--"
    @State var rotation: String = "--"
    @State var residents: Int = 0
    @State var films: Int = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
//            Image("home1")
//            .resizable()
//            .scaledToFill()
//            .edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: .init(colors: [
             Color(UIColor(red: 0.05, green: 0.10, blue: 0.27, alpha: 1.00)),
             Color(UIColor(red: 0.32, green: 0.64, blue: 0.84, alpha: 1.00))
            ]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.left")
                        .resizable()
                            .foregroundColor(Color.white)
                        .frame(width: 20, height: 20)
                        .padding([.leading, .top], 30)
                    }
                    Spacer()
                }
                
                Text("HomeWorld")
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
                VStack {
                    ZStack{
                       RoundedRectangle(cornerRadius: 5)
                       .fill(Color.black)
                       .frame(width: UIScreen.main.bounds.width - 60 ,height: 320)
                       .opacity(0.8)
                       // .border(Color.red)
                       .padding(.horizontal, 20)
                        VStack{
                            BioTxt(name: "Name:", value: self.name)
                            BioTxt(name: "Climate:", value: self.climate)
                            BioTxt(name: "Terrain:", value: self.terrain)
                            BioTxt(name: "Population:", value: self.population)
                            BioTxt(name: "Rotation_period:", value: self.rotation)
                            BioTxt(name: "Residents:", value: "\(self.residents)")
                            BioTxt(name: "Films:", value: "\(self.films)")
                        }
                    }.background(Color.clear)
                    .padding(.horizontal, 20)
                    
                    
                }.offset(x: 0, y: -60)
                Spacer()
            }
        }.navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
        .onAppear(perform: loadData)
    }
    
    func loadData(){
        let request = URLRequest(url: self.homeworld!)
         
         URLSession.shared.dataTask(with: request){data,response,error in
             guard let data = data else{return}
             if let homedata = try? JSONDecoder().decode(Homeworld.self, from: data){
                 
                self.name = homedata.name
                self.climate = homedata.climate
                self.population = homedata.population
                self.terrain = homedata.terrain
                self.rotation = homedata.rotation_period
                self.residents = homedata.residents.count
                self.films = homedata.films.count
                 
             }
             
         }.resume()
    }
}

struct HomeWorld_Previews: PreviewProvider {
    static var previews: some View {
        HomeWorld()
    }
}
