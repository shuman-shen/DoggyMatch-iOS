//
//  ProfileViewController.swift
//  DM1
//
//  Created by karen lee on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    var item = images.profile
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = UIImage(named: item.image)
        // Do any additional setup after loading the view.
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
