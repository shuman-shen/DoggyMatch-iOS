//
//  ViewController.swift
//  DM1
//
//  Created by xKiddos on 21/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    var item = images.home
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: item.image)
        
        var request = REST_Request()
        request.getBreeds(andNamed: "Poodle")
        
       
    }


}

