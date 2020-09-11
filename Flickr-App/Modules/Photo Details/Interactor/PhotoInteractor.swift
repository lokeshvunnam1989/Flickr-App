//
//  PhotoInteractor.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class PhotoInteractor: PhotoInteractorInput {

    weak var presenter: PhotoInteractorOutput?
    var photo: Photo?

    func fetchPhoto() {
        
        guard let photo = self.photo else { return }
        
        let connection = APIConnectionFactory.connection()
        let request = RequestFactory.photoSizeConnectionsRequest(photo.id)
        connection.sendRequest(request) { (data, error) in
            guard error == nil else {
                self.presenter?.showErrorView(error.debugDescription)
                return
            }
            
            if let data = data {
                do {
                    let photoSize: PhotoSize = try JSONDecoder().decode(PhotoSize.self, from: data)
                    self.presenter?.getPhotoContent(photoSize)
                } catch {
                    self.presenter?.showErrorView(error.localizedDescription)
                }
            }
        }
    }
    
    func getPhoto(_ url: String) {
        
        let imageCache = ManagerFactory.sharedImageCatch
        if let image = imageCache.image(withIdentifier: url) {
            self.presenter?.updateContentView(with: image)
            return
        }
        
        DownloadImage().download(for: url) { (image) in
            if let image = image {
                imageCache.add(image, withIdentifier: url)
                self.presenter?.updateContentView(with: image)
            }
        }
    }
}
