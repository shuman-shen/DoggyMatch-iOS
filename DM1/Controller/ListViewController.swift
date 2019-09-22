//
//  ListDetailViewController.swift
//  DM1
//
//  Created by karen lee on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var listTitle: UILabel!
    @IBOutlet weak var listDetail: UITextView!
    
    var selectedBreed:(title:String, description:String, image:UIImage?)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedBreed = selectedBreed{
            listImage.image = selectedBreed.image
            listTitle.text = selectedBreed.title
            listDetail.text = selectedBreed.description
        }
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
