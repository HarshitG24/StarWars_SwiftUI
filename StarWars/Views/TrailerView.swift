//
//  TrailerView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 6/1/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI
import WebKit

struct TrailerView: View {
    var url: String?
    var body: some View {
       WebView(urlString: url!)
    }
}

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView()
    }
}


struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        guard let safeString = urlString else {return}
        guard let url = URL(string: safeString) else {return}
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
