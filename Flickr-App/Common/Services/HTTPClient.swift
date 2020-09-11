//
//  HTTPClient.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation
import AlamofireImage

class HTTPClient: IConnection {
    
    private let baseURL: String
    private var apiKey: String?

    init(baseURL: String, apiKey: String?) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
 
    private func createFullURL(endPoint: String) -> URL {
        
        var endPoint = endPoint
        if let apiKey = self.apiKey {
            endPoint.append("&api_key=\(apiKey)")
        }
        endPoint.append("&format=json&nojsoncallback=1")
        
        return URL(string: "\(self.baseURL)\(endPoint)")!
        //return self.baseURL.appendingPathComponent(endPoint)
    }

    override func sendRequest(_ iRequest: IRequest, callback: @escaping RequestCallback) {
        
        let url = createFullURL(endPoint: iRequest.apiEndpoint())
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .returnCacheDataElseLoad,
                                          timeoutInterval: 30.0)
        request.httpMethod = iRequest.methodType().rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (result) in
            switch result {
            case .success(( _, let data)):
                callback(data, nil)
                break
            case .failure(let error):
                print("Error: \(String(describing: error))")
                callback(nil, error)
                break
            }
        }
        dataTask.resume()
    }
}

class DownloadImage {
    
    func download(for url: String, callBack: @escaping (_ image: UIImage?) -> Void) {

        let urlRequest = URLRequest(url: URL(string: url)!)

        ImageDownloader().download(urlRequest) { response in
            if case .success(let image) = response.result {
                callBack(image)
            }
            if case .failure(let error) = response.result {
                print("Image download failed error: \(String(describing: error.errorDescription))")
                callBack(nil)
            }

        }
    }
}

extension URLSession {
    func dataTask(with request: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: request) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
