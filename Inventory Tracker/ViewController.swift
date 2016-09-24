//
//  ViewController.swift
//  Inventory Tracker
//
//  Created by Zain-Ul Haq on 2016-05-10.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        imageView.addGestureRecognizer(tapGesture)
        imageView.userInteractionEnabled = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: AnyObject) {
        saveDataToDisk()
        
        
    }
    
    func handleTapGesture(tapGesture: UITapGestureRecognizer) {
        addImagePicker()
    }
    
    func addImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true) {}
    }
    
    func saveDataToDisk() {
        let itemTitle = itemTextField.text
        
        if !(itemTitle?.isEmpty)! {
            
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
            
            
            if let itemCost = numberFormatter.numberFromString(costTextField.text!) {
                
                if let image = imageView.image {
                } else {
                    "Error: no or invalid image"
                }
                
            } else {
                print("Error: missing cost or invalid format")
            }
            
        } else {
            print("Error: missing item title")
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as! UIImage? {
            imageView.image = image
        }
    }

}

