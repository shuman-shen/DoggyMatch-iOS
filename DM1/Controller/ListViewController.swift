//
//  ListDetailViewController.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var listTitle: UILabel!
    @IBOutlet weak var listDetail: UITextView!
    
    private var viewModel = BreedsViewModel()
    
    @IBAction func saveButton(_ sender: Any) {
        //guard let name = listTitle.text, let image = listImage.text, let detail = listDetail.text else{return}
       // viewModel.addBreeds(name, image, detail)
        
        let alertController = UIAlertController(title: "Breed", message: "Save to Favourites?", preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "Save", style: .default, handler: { (action) -> Void in
            //add save to file method
            self.save()
            print("Saved to favourites")
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel save")
        })
        
        alertController.addAction(saveButton)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
        
    }
    
    var selectedBreed:(title:String, description:String, image:UIImage?)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedBreed = selectedBreed{
            listImage.image = selectedBreed.image
            listTitle.text = selectedBreed.title
            listDetail.text = selectedBreed.description
            
            //print(NSHomeDirectory())
        }
    }
    
    func save(){
        let fm = setUpForFileWriting()
        
        createNewDirectory(fm)
        
        let newFilePath = "\(fm.newDirectory)/\(listTitle.text!)"
        
        createFile(at: newFilePath, with: fm.fileManager)
        
        writeToFile(to: newFilePath)
        
        //listDetail.text = readContentsOfFile(at: fm.newDirectory, with: listTitle.text!, using: fm.fileManager)
    }
    
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
        let newDir = docsURL.appendingPathComponent(listTitle.text!).path
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
        let data:Data? = ("\(listTitle.text!)\n" as
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
                contents = "Dog breed \(filename) saved: \n\n"
                break;
            }
            
            let file = "\(filePath)/\(fileName)"
            
            let fileContents = try String(contentsOfFile: (file))
            contents = contents + fileContents
            return contents
        }
        catch
        {
            print("no save")
        }
        return nil
    }
    
}
