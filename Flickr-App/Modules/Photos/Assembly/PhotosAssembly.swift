//
//  PhotoAssembly.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class PhotosAssembly: AssemblyProtocol {
        
    func assemblyModule() -> UIViewController {
        
        return self.viewControllerForPhoto()
    }
    
    private func viewControllerForPhoto() -> PhotosViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: Constants.Main, bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.PhotosVC) as? PhotosViewController
        viewController?.presenter = self.presenterModuleWithVC(controller: viewController!)
        
        return viewController!
    }
    
    private func presenterModuleWithVC(controller: PhotosViewController) -> PhotosPresenter {
        let presenter = PhotosPresenter()
        presenter.userInterface = controller
        presenter.interactor = self.interactorModuleWithPresenter(presenter: presenter)
        presenter.router = self.RouterModuleWithController(controller: controller)
        
        return presenter
    }
    
    private func interactorModuleWithPresenter(presenter: PhotosPresenter) -> PhotosInteractor {
        let interactor = PhotosInteractor()
        interactor.presenter = presenter
        
        return interactor
    }
    
    private func RouterModuleWithController(controller: PhotosViewController) -> PhotosRouter {
        let router = PhotosRouter()
        router.transitionHandler = controller
        
        return router
    }
}

extension UICollectionView {
            
    func collectionCell(at index: IndexPath) -> PhotoCollectionCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionCell", for: index) as? PhotoCollectionCell
        cell?.presenter = self.presenterModuleWithVC(controller: cell!)
        
        return cell!
    }
    
    private func presenterModuleWithVC(controller: PhotoCollectionCell) -> PhotoCellPresenter {
        let presenter = PhotoCellPresenter()
        presenter.userInterface = controller
        presenter.interactor = self.interactorModuleWithPresenter(presenter: presenter)
        
        return presenter
    }
    
    private func interactorModuleWithPresenter(presenter: PhotoCellPresenter) -> PhotoCellInteractor {
        let interactor = PhotoCellInteractor()
        interactor.presenter = presenter
        
        return interactor
    }
    
}

