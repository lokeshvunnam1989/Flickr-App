//
//  IRequest.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

public class IRequest {
    func requiresAuthentication() -> Bool {
        return true
    }
    
    func apiEndpoint() -> String {
        fatalError("Must Override in class: \(self)")
    }
    
    func methodType() -> HTTPMethod {
        return .get
    }
    
    func parameters() -> [String: Any] {
        return [:]
    }
}


public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

// MARK: -

/// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any]
