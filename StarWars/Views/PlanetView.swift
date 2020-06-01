//
//  PlanetView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/30/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct PlanetView: View {
    var img: UIImage
    var planet: Planet 
    var body: some View {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
       
       
        .edgesIgnoringSafeArea(.all)
        ScrollView{
            VStack{
                HStack{
                    Text(planet.name)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                    Spacer()
                }
                Image(uiImage: img)
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
                
                Text(planet.description)
                    .foregroundColor(Color.white)
                    .font(.custom("Starjhol", size: 20))
                    .padding(.top, 25)
                
                
                VStack {
                    PlanetInformationTitle(title: "Astrographical Information")
                    
                    SpecificationRow(category: "Suns: ", value: "\(planet.suns)")
                    SpecificationRow(category: "Moons: ", value: "\(planet.Moons)")
                    SpecificationRow(category: "Rotation Period", value: "\(planet.rotation_period) days")
                    SpecificationRow(category: "Orbital Period", value: "\(planet.orbital_period) days")
                }.padding(.top, 30)
                
                VStack{
                    PlanetInformationTitle(title: "Physical Information")
                    SpecificationRow(category: "Atmosphere: ", value: planet.atmosphere)
                    SpecificationRow(category: "Climate: ", value: planet.climate)
                }.padding(.top, 30)
                
                Spacer()
            }.padding([.horizontal, .top], 20)
        }
    }
}
}

//struct PlanetView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetView()
//    }
//}

struct SpecificationRow: View {
    var category: String
    var value: String
    var body: some View {
        VStack {
            HStack {
                Text(category)
                Spacer()
                Text(value)
            }.foregroundColor(Color.white)
            .font(.custom("Starjhol", size: 20))
            
            Divider()
                .frame(height: 1)
                .background(Color.yellow)
        }
    }
}

struct PlanetInformationTitle: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color.yellow)
                .font(.custom("Starjedi", size: 24))
            
            Spacer()
        }.padding(.bottom, 20)
    }
}
