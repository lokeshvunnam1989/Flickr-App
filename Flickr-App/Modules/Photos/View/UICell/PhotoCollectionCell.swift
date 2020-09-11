//
//  PhotoCollectionCell.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell, PhotoCellPresenterOutput {
    
    var presenter : PhotoCellPresenterInput!
    @IBOutlet weak var imageView: UIImageView!
    
    func setPhoto(_ photo: Photo) {
        self.presenter.fetchPhotoSize(for: photo)
    }
    
    func updateContentView(with photo: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = photo
        }
    }
}
