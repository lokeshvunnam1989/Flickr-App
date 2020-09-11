//
//  BaseViewController.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func pushViewController(_ controller: UIViewController, _ animated: Bool ) {
        self.navigationController?.pushViewController(controller, animated: animated)
    }
    
    func dismissViewController(_ animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
}
