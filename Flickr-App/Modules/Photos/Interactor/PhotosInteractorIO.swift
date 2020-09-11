//
//  PhotoInteractorIO.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

protocol PhotosInteractorInput {
    
    func searchPhotos(_ search: String)
    func getPhotosCount() -> Int
    func getPhoto(_ index: Int) -> Photo?
}

protocol PhotosInteractorOutput: class {
        
    func updateContent()
    func showErrorView(_ message: String)
}


protocol PhotoCellInteractorInput {
    
    func fetchPhotoSize(for photo: Photo)
    func getPhoto(_ url: String, _ photo: Photo)
}

protocol PhotoCellInteractorOutput: class {
        
    func getPhotoContent(_ photoSize: PhotoSize, _ photo: Photo)
    func updateContentView(with image: UIImage)
    func showErrorView(_ message: String)
}
