//
//  ContentView.swift
//  H12N12X
//
//  Created by Marwan Mekhamer on 20/04/2025.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var networkmanager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            
            List(networkmanager.posts) { post in
                
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                        
                    }
                }
                
                
            }
            .navigationTitle("H12N12X News")
            
        }
        .onAppear {
            self.networkmanager.fertchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
//   post(id: "1", title: "Hello"),
//   post(id: "2", title: "Bonjour"),
//   post(id: "3", title: "Hola")
//]
