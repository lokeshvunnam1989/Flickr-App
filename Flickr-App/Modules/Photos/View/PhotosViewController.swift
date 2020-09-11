//
//  PhotosViewController.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class PhotosViewController: BaseViewController, PhotosPresenterOutput {
    
    var presenter : PhotosPresenterInput!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Search Photos by entering text
        self.presenter.searchPhotos("kitten")
    }

    func updateContent() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2.0
        let height = width

        return CGSize(width: width - 1, height: height - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.getPhotosCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.collectionCell(at: indexPath)
        
        if let photo = self.presenter.getPhoto(indexPath.row) {
            cell.setPhoto(photo)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.presenter.showPhotoDetail(indexPath.row)
    }
}
