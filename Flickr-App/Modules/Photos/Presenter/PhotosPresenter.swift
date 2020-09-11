//
//  PhotoPresenter.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class PhotosPresenter: PhotosPresenterInput, PhotosInteractorOutput {
    
    weak var userInterface: PhotosPresenterOutput?
    var interactor: PhotosInteractorInput?
    var router: PhotosRouter?
    
    //MARK:- PhotoPresenterInput
    
    func searchPhotos(_ search: String) {
        self.interactor?.searchPhotos(search)
    }
    
    func getPhotosCount() -> Int {
        self.interactor?.getPhotosCount() ?? 0
    }
    
    func getPhoto(_ index: Int) -> Photo? {
        self.interactor?.getPhoto(index)
    }
    
    func showPhotoDetail(_ index: Int) {
        if let photo = self.interactor?.getPhoto(index) {
            self.router?.showPhotoDetail(photo)
        }
    }

    
    //MARK:- PhotoInteractorOutput
    
    func updateContent() {
        self.userInterface?.updateContent()
    }
            
    func showErrorView(_ message: String) {
        print("Error: \(message)")
    }
}


class PhotoCellPresenter: PhotoCellPresenterInput, PhotoCellInteractorOutput {
    
    weak var userInterface: PhotoCellPresenterOutput?
    var interactor: PhotoCellInteractorInput?

    //MARK:- PhotoCellPresenterInput
    
    func fetchPhotoSize(for photo: Photo) {

        let imageCache = ManagerFactory.sharedImageCatch
        if let image = imageCache.image(withIdentifier: photo.id) {
            self.userInterface?.updateContentView(with: image)
            return
        }
        
        self.interactor?.fetchPhotoSize(for: photo)
    }
    
        
    //MARK:- PhotoCellInteractorOutput
       
    func getPhotoContent(_ photoSize: PhotoSize, _ photo: Photo) {
        
        guard let photoContent = photoSize.sizes.size.filter({ $0.label == "Large Square"}).first else {
            return print("Photo Size don't have 'Large Square' image")
        }
        self.interactor?.getPhoto(photoContent.source, photo)
    }

    func updateContentView(with image: UIImage) {
        self.userInterface?.updateContentView(with: image)
    }
    
    func showErrorView(_ message: String) {
        print("Error: \(message)")
    }
}

