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

  
    @IBAction func onCreateButtonPressed(_ sender: UIButton) {
        let title = "\n\n\nRide Created Successfully !!"
        
        let message = ""
        
        let image = UIImage(named: "Success")
        
        let  alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Okay",
            style: .default,
            handler: nil)
        
        
        //action.setValue(image, forKey: "image")
        
        let imageView = UIImageView(frame: CGRectMake(117, 20, 40, 40))
        imageView.image = image
        
        alert.view.addSubview(imageView)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
        
     
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
}
