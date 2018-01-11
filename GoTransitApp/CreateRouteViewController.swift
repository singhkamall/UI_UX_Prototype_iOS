//
//  CreateRouteViewController.swift
//  GoTransitApp
//
//  Created by Robert Argume on 2018-01-10.
//  Copyright © 2018 GoTransit. All rights reserved.
//

import UIKit

class CreateRouteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GO Transit"

        // Update color for navigactino bar
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        navigationController?.navigationBar.titleTextAttributes = attrs
        navigationController?.navigationBar.barStyle = UIBarStyle(rawValue: 1)!;
        
        // Modify the text for the default "Back Button" in the navigation bar
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil,  action: nil)
    }

  

}
