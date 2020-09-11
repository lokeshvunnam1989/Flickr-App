//
//  APIConnectionFactory.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class APIConnectionFactory {
    
    public class func connection() -> IConnection {
        
        return serverConnecion()
    }
    
    private class func serverConnecion() -> IConnection {

        return  HTTPClient(baseURL: LiveURL, apiKey: APIKeys.flickr)
    }
}
