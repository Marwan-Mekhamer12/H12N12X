//
//  NewworkManager.swift
//  H12N12X
//
//  Created by Marwan Mekhamer on 21/04/2025.
//

import Foundation


class NetworkManager: ObservableObject {
    
   @Published var posts = [Post]()
    
    func fertchData() {
                
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error?.localizedDescription ?? "")
                }
                
                if let safeData = data {
                    self.pareseJson(safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func pareseJson(_ urlString: Data) {
        do {
            let decoder = JSONDecoder()
            let resultM = try decoder.decode(Result.self, from: urlString)
            DispatchQueue.main.async {
                self.posts = resultM.hits
            }
        }catch {
            print(error)
        }
        
    }

}

