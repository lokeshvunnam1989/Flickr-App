//
//  PhotoRouter.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import Foundation

class PhotosRouter: PhotosRouterInput  {
    
    var transitionHandler: BaseViewController?
    
    func showPhotoDetail(_ photo: Photo) {
        let detailAssembly = PhotoAssembly()
        detailAssembly.input = photo
        self.transitionHandler?.pushViewController(detailAssembly.assemblyModule(), true)
    }
}
