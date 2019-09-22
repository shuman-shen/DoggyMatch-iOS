//
//  ResultViewController.swift
//  DM1
//
//  Created by karen lee on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultText: UITextView!
    @IBOutlet weak var resultSave: UIButton!
    
    var item = breeds.beagle
    var itemImage = breedImage.beagle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultImage.image = UIImage(named: itemImage.dogImage.image)
        resultText.text = "Breed: " + item.dog.name + "\nSize: \(item.dog.size)\nDescription: \(item.dog.info)"
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
