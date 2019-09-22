//
//  CameraViewController.swift
//  DM1
//
//  Created by karen lee on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices

class CameraViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    
    var avPlayerViewController: AVPlayerViewController!
    var image: UIImage?
    var movieURL: URL?
    var lastChosenMediaType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            photoButton.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateDisplay()
    }
    
    func updateDisplay(){
        if let mediaType = lastChosenMediaType {
            if mediaType == (kUTTypeImage as NSString) as String {
                imageView.image = image!
                imageView.isHidden = false
                if avPlayerViewController != nil {
                    avPlayerViewController!.view.isHidden = true
                }
            }else if mediaType == (kUTTypeMovie as NSString) as String {
                if avPlayerViewController == nil {
                    avPlayerViewController = AVPlayerViewController()
                    let avPlayerView = avPlayerViewController!.view
                    avPlayerView?.frame = imageView.frame
                    avPlayerView?.clipsToBounds = true
                    view.addSubview(avPlayerView!)
                }
                if let url = movieURL {
                    imageView.isHidden = true
                    avPlayerViewController.player = AVPlayer(url: url)
                    avPlayerViewController!.view.isHidden = false
                    avPlayerViewController!.player!.play()
                }
            }
        }
    }

 /*   @IBAction func takeButton(_ sender: UIButton) {
        pickMediaFromSource(UIImagePickerController.SourceType.camera)
    }
    
    func pickMediaFromSource(_ sourceType:UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType)!
             picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            present(picker, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title:"Error accessing media",message: "Unsupported media source.", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate
{
    // Delegate method to process once the media has been selected
    // by the user.
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        lastChosenMediaType = info[UIImagePickerControllerMediaType] as? String
        
        // Set the variable to the data retrieved.
        if let mediaType = lastChosenMediaType {
            if mediaType == (kUTTypeImage as NSString) as String {
                image = info[UIImagePickerControllerEditedImage] as? UIImage
                saveImage(image: image!, path: "test")
                
            } else if mediaType == (kUTTypeMovie as NSString) as String {
                movieURL = info[UIImagePickerControllerMediaURL] as? URL
            }
        }
        
        // Dismiss the picker to return to the apps view
        picker.dismiss(animated: true, completion: nil)
    }
    
    func saveImage (image: UIImage, path: String)
    {
        let pngImageData = image.pngData()
        
        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let imageUniqueName : Int64 = Int64(NSDate().timeIntervalSince1970 * 1000);
        
        var filePath = docDir.appendingPathComponent("\(imageUniqueName).png");
        
        do{
            try pngImageData?.write(to : filePath , options : .atomic)
            
        }catch{
            print("couldn't write image")
        }
        
        /* Test to see if the image was written */
        filePath = docDir.appendingPathComponent("\(imageUniqueName).png");
        
        if FileManager.default.fileExists(atPath: filePath.path){
            
            if let _ = UIImage(contentsOfFile : filePath.path){
                
                let confirmImage = UIImage(named : filePath.path)
                print(confirmImage!.size)
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion:nil)
    }
}


extension ViewController:UINavigationControllerDelegate{}

    
    */

 }
