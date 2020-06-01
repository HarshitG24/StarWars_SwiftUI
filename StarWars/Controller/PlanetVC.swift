//
//  PlanetVC.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/30/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class PlanetVC: NSObject, ObservableObject{
  //  @Published var myimages: [UIImage] = []
    @Published var myPlanets: [PlanetName] = []
    
    override init() {
        super.init()
        self.downloadImages()
    }
    
    func downloadImages(){
        for i in 0..<planetHomePage.count{
            let url = planetHomePage[i].imageUrl
            let request = URLRequest(url: URL(string: url)!)
            
            URLSession.shared.dataTask(with: request){data, response, error in
                guard let data = data else {return}
                
                if let myimage = UIImage(data: data){
                    DispatchQueue.main.async {
                        withAnimation {
                            planetHomePage[i].planetImg = myimage
                            self.myPlanets.append(planetHomePage[i])
                          //  self.myimages.append(myimage)
                        }
                    }
                }
            }.resume()
        }
    }
}
