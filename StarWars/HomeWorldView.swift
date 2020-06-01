//
//  HomeWorldView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct HomeWorldView: View {
    var homeworld: URL?
    var body: some View {
        print(homeworld!)
       return Text("")
    }
}

struct HomeWorldView_Previews: PreviewProvider {
    static var previews: some View {
        HomeWorldView()
    }
}
