//
//  ProfileViewController.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImage: UITextField!
    @IBOutlet weak var textField: UITextField! 
    @IBOutlet weak var takePhoto: UIButton!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var selectPhoto: UIButton!
    
    private var viewModel = ProfileViewModel()
    let imagePicker = UIImagePickerController()
    
    @IBAction func submitProfile(_ sender: Any) {
        if(textField.text != "") {
            //save profile
            //guard let username = textField.text, let userImage = profileImage.text else{return}
            //viewModel.addUser(username, userImage)
            
            //confirm alert
            let alert = UIAlertController(title: "Create Profile", message: "Profile created", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Create Profile", message: "Please enter your name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func selectPhotoBut(_ sender: Any) {
        if(textField.text != "") {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Create Profile", message: "Please enter your name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    }


