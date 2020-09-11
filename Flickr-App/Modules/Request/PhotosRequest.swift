//
//  PhotosRequest.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class SearchPhotosRequest: IRequest {
    
    let search: String
    
    init(_ search: String) {
        self.search = search
    }
    
    override func apiEndpoint() -> String {
        return "?method=flickr.photos.search&tags=\(search)&page=1"
    }
    
    override func methodType() -> HTTPMethod {
        return .get
    }
}

class PhotoSizeRequest: IRequest {
    
    let id: String
    
    init(_ id: String) {
        self.id = id
    }
    
    override func apiEndpoint() -> String {
        return "?method=flickr.photos.getSizes&photo_id=\(id)"
    }
    
    override func methodType() -> HTTPMethod {
        return .get
    }
}
