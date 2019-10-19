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
    
    
    func setUpForFileWriting() -> (fileManager: FileManager, newDirectory: String)
    {
        // Get a reference to the file manager
        let fileManager = FileManager .default
        
        // Get the path to the documents path
        // This method returns an array of paths that contain the document directory
        let dirPaths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        let docsDir = dirPaths[0].path
        
        // Navigate to the docs directory
        fileManager.changeCurrentDirectoryPath(docsDir)
        
        // Creating a new directory as a URL
        let docsURL:URL = dirPaths[0]
        
        // Append the new directory to the directory path
        let newDir = docsURL.appendingPathComponent(textField.text!).path
        return (fileManager, newDir)
    }
    
    func createNewDirectory(_ fm: (fileManager: FileManager, newDirectory: String))
    {
        do
        {
            // Create new Directory
            try fm.fileManager.createDirectory(atPath: fm.newDirectory, withIntermediateDirectories: true, attributes: nil)
        }
        catch let error as NSError
        {
            print ("Error: \(error.localizedDescription )")
        }
    }
    
    func createFile(at path: String, with fileManager: FileManager)
    {
        // Create file if it doesn't exist
        if !fileManager.fileExists(atPath: path)
        {
            fileManager.createFile(atPath: path, contents: Data(), attributes: nil)
        }
    }
    
    func writeToFile(to filePath: String)
    {
        // Prepare data for writing to file
        let data:Data? = ("\(profileImage.text!)\n" as
            NSString).data(using: String.Encoding.utf8.rawValue)
        
        // Get a reference to the file
        let file: FileHandle? = FileHandle(forUpdatingAtPath: filePath)
        
        // Append data to the file
        file?.seekToEndOfFile()
        if let contents = data{
            file?.write(contents)
        }
        
        file?.closeFile()
    }
    
    func readContentsOfFile(at filePath: String, with fileName: String, using fileManager: FileManager) -> String?
    {
        
        do
        {
            var contents: String = ""
            let filelist = try fileManager.contentsOfDirectory(atPath: filePath)
            
            for filename in filelist
            {
                contents = "The filename \(filename) contains: \n\n"
                break;
            }
            
            let file = "\(filePath)/\(fileName)"
            
            let fileContents = try String(contentsOfFile: (file))
            contents = contents + fileContents
            return contents
        }
        catch
        {
            print("Computer say no")
        }
        return nil
    }
    
    
    @IBAction func submitProfile(_ sender: Any) {
        if(textField.text != "") {
            //save profile
            //guard let username = textField.text, let userImage = profileImage.text else{return}
            //viewModel.addUser(username, userImage)
            let fm = setUpForFileWriting()
            
            createNewDirectory(fm)
            
            let newFilePath = "\(fm.newDirectory)/\(textField.text!)"
            
            createFile(at: newFilePath, with: fm.fileManager)
            
            writeToFile(to: newFilePath)
            
            //profileImage.text = readContentsOfFile(at: fm.newDirectory, with: textField.text!, using: fm.fileManager)
            
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


