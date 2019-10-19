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
        }
    }
    
}
