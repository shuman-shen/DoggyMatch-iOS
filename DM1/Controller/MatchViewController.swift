//
//  MatchViewController.swift
//  DM1
//
//  Created by xKiddos on 21/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit


class MatchViewController: UIViewController {
    @IBOutlet weak var quest1: UILabel!
    @IBOutlet weak var quest2: UILabel!
    @IBOutlet weak var yes1: UIButton!
    @IBOutlet weak var no1: UIButton!
    @IBOutlet weak var yes2: UIButton!
    @IBOutlet weak var no2: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
     var item = questions.novice
     var change = true
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quest1.text = item.quest
        item = questions.apartment
        quest2.text = item.quest
        
        yes1.backgroundColor = UIColor.lightGray
        yes1.layer.cornerRadius = yes1.frame.height/2
        yes1.setTitleColor(UIColor.white, for: .normal)
        
        no1.backgroundColor = UIColor.lightGray
        no1.layer.cornerRadius = no1.frame.height/2
        no1.setTitleColor(UIColor.white, for: .normal)
        
        yes2.backgroundColor = UIColor.lightGray
        yes2.layer.cornerRadius = yes2.frame.height/2
        yes2.setTitleColor(UIColor.white, for: .normal)
        
        no2.backgroundColor = UIColor.lightGray
        no2.layer.cornerRadius = no1.frame.height/2
        no2.setTitleColor(UIColor.white, for: .normal)
        
        nextButton.backgroundColor = UIColor.orange
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.setTitleColor(UIColor.white, for: .normal)
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
