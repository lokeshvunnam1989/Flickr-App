//
//  PhotoAssembly.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class PhotoAssembly: AssemblyProtocol {
        
    var input: Photo?

    func assemblyModule() -> UIViewController {
        
        return self.viewControllerForPhotoDetail()
    }
    
    private func viewControllerForPhotoDetail() -> PhotoDetailViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Constants.Main, bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.PhotoDetailVC) as? PhotoDetailViewController
        viewController?.presenter = self.presenterModuleWithVC(controller: viewController!)
        
        return viewController!
    }
    
    private func presenterModuleWithVC(controller: PhotoDetailViewController) -> PhotoPresenter {
        let presenter = PhotoPresenter()
        presenter.userInterface = controller
        presenter.interactor = self.interactorModuleWithPresenter(presenter: presenter)
        
        return presenter
    }
    
    private func interactorModuleWithPresenter(presenter: PhotoPresenter) -> PhotoInteractor {
        let interactor = PhotoInteractor()
        interactor.presenter = presenter
        interactor.photo = self.input
        
        return interactor
    }
    
}
