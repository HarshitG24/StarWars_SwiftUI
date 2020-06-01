//
//  VehiclesView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct VehiclesView: View {
    
    @State var vehicles: [URL]?
    @State var vehiclesData: [Vehicles] = []
    @State var count = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack{
//            Image("v1")
//            .resizable()
//            .edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: .init(colors: [Color(UIColor(red: 0.34, green: 0.35, blue: 0.73, alpha: 1.00)), Color(UIColor(red: 0.60, green: 0.50, blue: 0.98, alpha: 1.00))]), startPoint: .top, endPoint: .bottom)
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
        
        PropertyTitle(txt: "Vehicles")
            
        VStack{
            ZStack{
                BackgroundPanel(height: 400)
            
                self.vehiclesData.count > 0 ? VStack{
                    PanelData(title: "Name: ", value: self.vehiclesData[self.count].name)
                    PanelData(title: "Model: ", value: self.vehiclesData[self.count].model )
                    PanelData(title: "Maker: ", value: self.vehiclesData[self.count].manufacturer)
                    PanelData(title: "Cost: ", value: self.vehiclesData[self.count].cost_in_credits)
                    PanelData(title: "Length: ", value: self.vehiclesData[self.count].length)
                    PanelData(title: "Speed: ", value: self.vehiclesData[self.count].max_atmosphering_speed)
                    PanelData(title: "Crew: ", value: self.vehiclesData[self.count].crew)
                    PanelData(title: "Passengers: ", value: self.vehiclesData[self.count].passengers)
                    } : nil
          }
    }
        
        Spacer()
        
        HStack {
            self.count != 0 ? Button(action:{
                self.count -= 1
            }){
                Text("Previous")
                } : nil
            
            Spacer()
            
            (self.count + 1) != self.vehiclesData.count ? Button(action:{
                self.count += 1
            }){
                Text("Next")
                } : nil
        }.foregroundColor(Color.black)
        .padding([.bottom, .horizontal], 20)
    }
            
            }.onAppear(perform: loadData)
        .navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
    }
    
    func loadData(){
        
       
            for url in self.vehicles!{
                let request = URLRequest(url: url)
                
                URLSession.shared.dataTask(with: request){data, response, error in
                   
                    guard let data = data else {return}
                    if let decodeData = try? JSONDecoder().decode(Vehicles.self, from: data){
                         DispatchQueue.main.async {
                              self.vehiclesData.append(decodeData)
                        }
                    }
                }.resume()
            }
        
    }
}

struct VehiclesView_Previews: PreviewProvider {
    static var previews: some View {
        VehiclesView()
    }
}

struct PanelData: View {
    var title: String
    var value: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }.font(.custom("Starjedi", size: 17))
        .foregroundColor(Color.white)
        .padding(.horizontal, 40)
        .padding(.top, 20)
    }
}

struct BackgroundPanel: View {
    var height: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.black)
            .frame(width: UIScreen.main.bounds.width - 40, height: height, alignment: .center)
            .opacity(0.7)
    }
}

struct PropertyTitle: View {
    var txt: String
    var body: some View {
        Text(txt)
            .font(.custom("Starjout", size: 44))
            .foregroundColor(Color.white)
    }
}
