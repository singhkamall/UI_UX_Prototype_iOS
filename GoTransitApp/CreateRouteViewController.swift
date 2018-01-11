//
//  CreateRouteViewController.swift
//  GoTransitApp
//
//  Created by Robert Argume on 2018-01-10.
//  Copyright © 2018 GoTransit. All rights reserved.
//

import UIKit

class CreateRouteViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    //PRIVATE VARIABLES
    var seats:Int = 0
    
    var activeTextField = UITextField()
    
    let datePicker = UIDatePicker()
    
    var descriptionPlaceHolder = "Leather interiors. Spacious place inside. Always clean. No beverages aboard. No smokers"
    
    // OUTLETS

    @IBOutlet weak var switchImageView: UIImageView!
    
    @IBOutlet weak var currentPositionImageView: UIImageView!
    
    
    @IBOutlet weak var clockImageView: UIImageView!
    
    @IBOutlet weak var RouteNameTextField: UITextField!
    
    @IBOutlet weak var originTextField: UITextField!
    
    @IBOutlet weak var destinationTextField: UITextField!
    
    @IBOutlet weak var initialTimeTextField: UITextField!
    
    @IBOutlet weak var endingTimeTextField: UITextField!
    
    @IBOutlet weak var routeDurationLabel: UILabel!
    
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
        
        let tapOnSwitchLocationsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(switchLocationsImageTapped(tapGestureRecognizer:)))
        switchImageView.isUserInteractionEnabled = true
        switchImageView.addGestureRecognizer(tapOnSwitchLocationsGestureRecognizer)
        
        let tapOnGetCurrentLocationsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(currentLocationImageTapped(tapGestureRecognizer:)))
        currentPositionImageView.isUserInteractionEnabled = true
        currentPositionImageView.addGestureRecognizer(tapOnGetCurrentLocationsGestureRecognizer)
        
        let tapOnClockGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clockImageTapped(tapGestureRecognizer:)))
        clockImageView.isUserInteractionEnabled = true
        clockImageView.addGestureRecognizer(tapOnClockGestureRecognizer)
        
        createDatePicker()
        
    }
    
    func createDatePicker() {
        
        // format for picker
        datePicker.datePickerMode = .dateAndTime
        
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        initialTimeTextField.inputAccessoryView = toolbar
        
        // assigning date picker to text field
        initialTimeTextField.inputView = datePicker
        
        
    }
    
    @objc func donePressed() {
        
        // format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        initialTimeTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    @IBAction func onRadioButtonClick(_ sender: DLRadioButton) {
        seats = sender.tag;
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
    
    // Delegates to capture tap gesture for 3 different image views
    @objc func switchLocationsImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let temp = originTextField.text
        originTextField.text = destinationTextField.text
        destinationTextField.text = temp
    }
    
    @objc func currentLocationImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let currentLocation = "Centennial College.Progress Campus"
        self.activeTextField.text = currentLocation
    }
    
    @objc func clockImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let calculatedDurations = ["35 mins", "32 mins", "40 mins", "36 mins", "45 mins", "50 mins", "29 mins"]
        
        if initialTimeTextField.text != ""  {
            endingTimeTextField.text = "calculatedTime"
            
            let index = Int(arc4random_uniform(UInt32(calculatedDurations.count)))
            routeDurationLabel.text = calculatedDurations[index]
        }
    }
    
    // Delegate for getting which text field got focus
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    // Delegate Functions for removing the place holder when user start typing in the text view
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textView.text == descriptionPlaceHolder)
        {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
    // Delegate Functions for adding a place holder when there is no focus on the text view and user did not typed in data
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (textView.text == "")
        {
            textView.text = descriptionPlaceHolder
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
 
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    
    
}
