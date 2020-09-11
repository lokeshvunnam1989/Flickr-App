//
//  Photos.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

struct PhotosList: Codable {
    let photos: Photos
    
    struct Photos: Codable {
        let page: Int
        let pages: Int
        let perpage: Int
        let total: String
        let photo: [Photo]
    }
}

struct Photo: Codable {
    let id: String
    let title: String
}


struct PhotoSize: Codable {
    let sizes: Sizes
    
    struct Sizes: Codable {
        let size: [Size]
        
        struct Size: Codable {
            let label: String
            let source: String
            let url: String
            let media: String
        }
    }
}
