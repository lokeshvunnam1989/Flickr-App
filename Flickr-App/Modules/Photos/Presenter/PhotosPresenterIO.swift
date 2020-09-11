//
//  PhotoPresenterIO.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

protocol PhotosPresenterInput {
    
    func searchPhotos(_ search: String)
    func getPhotosCount() -> Int
    func getPhoto(_ index: Int) -> Photo?
    func showPhotoDetail(_ index:Int)
}

protocol PhotosPresenterOutput: class {
    
    func updateContent()
}


protocol PhotoCellPresenterInput {
    
    func fetchPhotoSize(for photo: Photo)
}

protocol PhotoCellPresenterOutput: class {
    
    func updateContentView(with image: UIImage)
}

