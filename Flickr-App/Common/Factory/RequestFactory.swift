//
//  RequestFactory.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class RequestFactory {
    
    public class func searchPhotosConnectionsRequest(_ search: String) -> IRequest {
        return SearchPhotosRequest(search)
    }
    
    public class func photoSizeConnectionsRequest(_ id: String) -> IRequest {
        return PhotoSizeRequest(id)
    }
}
