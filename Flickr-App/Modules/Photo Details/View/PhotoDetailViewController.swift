//
//  PhotoDetailViewController.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class PhotoDetailViewController: BaseViewController, PhotoPresenterOutput {

    var presenter : PhotoPresenterInput!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.fetchPhoto()
    }
    
    func updateContentView(with image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}
