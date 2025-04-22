//
//  PostData.swift
//  H12N12X
//
//  Created by Marwan Mekhamer on 21/04/2025.
//

import Foundation

struct Result: Decodable {
    let hits : [Post]
}

struct Post : Decodable, Identifiable {
    var id : String {
        return objectID
    }
    let title : String
    let url: String?
    let points: Int
    let objectID: String
}
