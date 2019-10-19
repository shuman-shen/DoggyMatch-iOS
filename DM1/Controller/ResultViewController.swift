//
//  ResultViewController.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultText: UITextView!
    @IBOutlet weak var resultSave: UIButton!
    
    //private var viewModel = ResultViewModel()
    
    var item = breeds.poodle
    var itemImage = breedImage.poodle
    
   // let persistenceManager: PersistenceManager
    
   /* init(persistenceManager: PersistenceManager){
        self.persistenceManager = persistenceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //super.init(coder: aDecoder)
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultImage.image = UIImage(named: itemImage.dogImage.image)
        resultText.text = "Breed: " + item.dog.name + "\nSize: \(item.dog.size)\nDescription: \(item.dog.info)"
        
        
        //createFavList()
    }
    
   /* func createFavList(){
        let breed = Breed(context: persistenceManager.context)
        breed.name = "Beagle"
        breed.detail = "Beagles are widely considered to be good with other pets and children. They are cheerful dogs that like affection. They prefer company, however, and if left alone, may howl and be destructive."
        persistenceManager.save()
    }*/
    
    @IBAction func saveButton(_ sender: UIButton) {
      //  guard let name = self.resultText.text, let detail = self.resultText.text, let image = self.resultImage.text, let user = self.resultImage.text  else{return}
        
       // viewModel.addBreed(name, user, image, detail)
        //persistenceManager.save()
        
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
    
    func save(){
        let fm = setUpForFileWriting()
        
        createNewDirectory(fm)
        
        let newFilePath = "\(fm.newDirectory)/\(resultText.text!)"
        
        createFile(at: newFilePath, with: fm.fileManager)
        
        writeToFile(to: newFilePath)
        
    }
    
    func remove(){
        let fm = setUpForFileWriting()
        // Deleting a directory
        do
        {
            try fm.fileManager.removeItem(atPath: fm.newDirectory)
        }
        catch let error as NSError
        {
            print ("Error: \(error.localizedDescription )")
        }
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
        let newDir = docsURL.appendingPathComponent(resultText.text!).path
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
        let data:Data? = ("\(resultText.text!)\n" as
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
            print("no save")
        }
        return nil
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
