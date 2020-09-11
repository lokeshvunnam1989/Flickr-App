//
//  PhotoPresenter.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class PhotoPresenter: PhotoPresenterInput, PhotoInteractorOutput {

    weak var userInterface: PhotoPresenterOutput?
    var interactor: PhotoInteractorInput?
    var router: PhotoRouter?

    //MARK:- PhotoPresenterInput
    
    func fetchPhoto() {
        self.interactor?.fetchPhoto()
    }
        
    //MARK:- PhotoInteractorOutput
       
    func getPhotoContent(_ photoSize: PhotoSize) {
        
        guard let photoContent = photoSize.sizes.size.filter({ $0.label == "Large"}).first else {
            return print("Photo Size don't have 'Large' image")
        }
        self.interactor?.getPhoto(photoContent.source)
    }

    func updateContentView(with image: UIImage) {
        self.userInterface?.updateContentView(with: image)
    }
    
    func showErrorView(_ message: String) {
        print("Error: \(message)")
    }
}
