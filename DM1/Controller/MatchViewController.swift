//
//  MatchViewController.swift
//  DM1
//
//  Created by karen lee on 21/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit


class MatchViewController: UIViewController {
    @IBOutlet weak var quest1: UILabel!
    @IBOutlet weak var quest2: UILabel!
    @IBOutlet weak var yes1: UIButton!
   
    
     var item = questions.novice
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quest1.text = item.quest
        item = questions.apartment
        quest2.text = item.quest
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
