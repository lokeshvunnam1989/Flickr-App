//
//  PhotoPresenterIO.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

protocol PhotoPresenterInput {
    
    func fetchPhoto()
}

protocol PhotoPresenterOutput: class {
    
    func updateContentView(with image: UIImage)
}
