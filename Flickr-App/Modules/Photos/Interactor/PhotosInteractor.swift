//
//  PhotoInteractor.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class PhotosInteractor: PhotosInteractorInput {

    weak var presenter: PhotosInteractorOutput?
    
    var photosList: PhotosList?
    
    //MARK:- PhotoInteractorInput
    
    func searchPhotos(_ search: String) {
        
        let connection = APIConnectionFactory.connection()
        let request = RequestFactory.searchPhotosConnectionsRequest(search)
        connection.sendRequest(request) { (data, error) in
            guard error == nil else {
                self.presenter?.showErrorView(error.debugDescription)
                return
            }
            
            if let data = data {
                do {
                    let photosList: PhotosList = try JSONDecoder().decode(PhotosList.self, from: data)
                    self.photosList = photosList
                    self.presenter?.updateContent()
                } catch {
                    self.presenter?.showErrorView(error.localizedDescription)
                }
            }
        }
    }
    
    func getPhotosCount() -> Int {
        return self.photosList?.photos.photo.count ?? 0
    }
    
    func getPhoto(_ index: Int) -> Photo? {
        return self.photosList?.photos.photo[index]
    }
}

//MARK:-

class PhotoCellInteractor: PhotoCellInteractorInput {
    
    weak var presenter: PhotoCellInteractorOutput?
    
    //MARK:- PhotoCellInteractorInput
    
    func fetchPhotoSize(for photo: Photo) {
        
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
                    self.presenter?.getPhotoContent(photoSize, photo)
                } catch {
                    self.presenter?.showErrorView(error.localizedDescription)
                }
            }
        }
    }
    
    func getPhoto(_ url: String, _ photo: Photo) {
        
        let imageCache = ManagerFactory.sharedImageCatch
        if let image = imageCache.image(withIdentifier: photo.id) {
            self.presenter?.updateContentView(with: image)
            return
        }
        
        DownloadImage().download(for: url) { (image) in
            if let image = image {
                imageCache.add(image, withIdentifier: photo.id)
                self.presenter?.updateContentView(with: image)
            }
        }
    }
}
