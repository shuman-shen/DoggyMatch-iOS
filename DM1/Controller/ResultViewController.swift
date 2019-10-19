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
    
    var item = breeds.beagle
    var itemImage = breedImage.beagle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultImage.image = UIImage(named: itemImage.dogImage.image)
        resultText.text = "Breed: " + item.dog.name + "\nSize: \(item.dog.size)\nDescription: \(item.dog.info)"
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
      //  guard let name = self.resultText.text, let detail = self.resultText.text, let image = self.resultImage.text, let user = self.resultImage.text  else{return}
        
       // viewModel.addBreed(name, user, image, detail)
        
        
        let alertController = UIAlertController(title: "Breed", message: "Save to Favourites?", preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "Save", style: .default, handler: { (action) -> Void in
            //add save to file method
            print("Saved to favourites")
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel save")
        })
        
        alertController.addAction(saveButton)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
        
        
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
