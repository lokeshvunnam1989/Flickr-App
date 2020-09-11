//
//  PhotoInteractorIO.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

protocol PhotoInteractorInput {
    
    func fetchPhoto()
    func getPhoto(_ url: String)
}

protocol PhotoInteractorOutput: class {
    
    func getPhotoContent(_ photoSize: PhotoSize)
    func updateContentView(with image: UIImage)
    func showErrorView(_ message: String)
}
