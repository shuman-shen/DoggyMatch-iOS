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
    @IBOutlet weak var quest3: UILabel!
    @IBOutlet weak var quest4: UILabel!
    @IBOutlet weak var yes3: UIButton!
    @IBOutlet weak var no3: UIButton!
    @IBOutlet weak var yes4: UIButton!
    @IBOutlet weak var no4: UIButton!
    
    var item = questions.novice
    //var change = true
 
    func selected(button: UIButton){
        button.isSelected = true
        button.backgroundColor = UIColor.blue 
    }
    
    func notSelected(button: UIButton){
        button.isSelected = false
        button.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func yes1(_ sender: UIButton) {
        if yes1.isSelected == false {
            selected(button: yes1)
            notSelected(button: no1)
        } else {
            notSelected(button: yes1)
        }
    }
    
    @IBAction func no1(_ sender: UIButton) {
        if no1.isSelected == false {
            selected(button: no1)
            notSelected(button: yes1)
        } else {
            notSelected(button: no1)
        }
    }
    
    @IBAction func yes2(_ sender: UIButton) {
        if yes2.isSelected == false {
            selected(button: yes2)
            notSelected(button: no2)
        } else {
            notSelected(button: yes2)
        }
    }
    
    @IBAction func no2(_ sender: UIButton) {
        if no2.isSelected == false {
            selected(button: no2)
            notSelected(button: yes2)
        } else {
            notSelected(button: no2)
        }
    }
    
    @IBAction func yes3(_ sender: UIButton) {
        if yes3.isSelected == false {
            selected(button: yes3)
            notSelected(button: no3)
        } else {
            notSelected(button: yes3)
        }
    }
    
    @IBAction func no3(_ sender: UIButton) {
        if no3.isSelected == false {
            selected(button: no3)
            notSelected(button: yes3)
        } else {
            notSelected(button: no3)
        }
    }
    
    @IBAction func yes4(_ sender: UIButton) {
        if yes4.isSelected == false {
            selected(button: yes4)
            notSelected(button: no4)
        } else {
            notSelected(button: yes4)
        }
    }
    
    @IBAction func no4(_ sender: UIButton) {
        if no4.isSelected == false {
            selected(button: no4)
            notSelected(button: yes4)
        } else {
            notSelected(button: no4)
        }
    }
    
     var request = REST_Request()
    
    @IBAction func nextButton(_ sender: UIButton) {
        if (sender.tag == 1) && (sender.tag == 3 || sender.tag == 4) && (sender.tag == 5 || sender.tag == 6) && (sender.tag == 7 || sender.tag == 8){
            request.getBreeds(andNamed: "Yorkshire Terrier")
            print("Yorkshire")
        }else if (sender.tag == 2) && (sender.tag == 3 || sender.tag == 4) && (sender.tag == 5 || sender.tag == 6) && (sender.tag == 7 || sender.tag == 8){
            request.getBreeds(andNamed: "German Shepherd")
            print("German Shephard")
        }else if (sender.tag == 1 || sender.tag == 2) && (sender.tag == 3) && (sender.tag == 5 || sender.tag == 6) && (sender.tag == 7 || sender.tag == 8){
            request.getBreeds(andNamed: "Pug")
            print("Pug")
        }else if (sender.tag == 1 || sender.tag == 2) && (sender.tag == 4) && (sender.tag == 5 || sender.tag == 6) && (sender.tag == 7 || sender.tag == 8){
            request.getBreeds(andNamed: "Labrador")
            print("Labrador")
        }else if (sender.tag == 1 || sender.tag == 2) && (sender.tag == 3 || sender.tag == 4) && (sender.tag == 5) && (sender.tag == 7 || sender.tag == 8){
            request.getBreeds(andNamed: "Beagle")
            print("Beagle")
        }else if (sender.tag == 1 || sender.tag == 2) && (sender.tag == 3 || sender.tag == 4) && (sender.tag == 6) && (sender.tag == 7 || sender.tag == 8){
            request.getBreeds(andNamed: "Poodle")
            print("Poodle")
        }else if (sender.tag == 1 || sender.tag == 2) && (sender.tag == 3 || sender.tag == 4) && (sender.tag == 5 || sender.tag == 6) && (sender.tag == 7){
            request.getBreeds(andNamed: "Shiba")
            print("Shiba")
        }else if (sender.tag == 1 || sender.tag == 2) && (sender.tag == 3 || sender.tag == 4) && (sender.tag == 5 || sender.tag == 6) && ( sender.tag == 8){
            request.getBreeds(andNamed: "French Bulldog")
            print("French Bulldog")
        }else{
            request.getBreeds(andNamed: "Maltese")
            print("Maltese")
        }
    }
    
    private func isButtonValid(){ //fix
        var isValid = true
        
        if (yes1.isSelected == true || no1.isSelected == true) && (yes2.isSelected == true || no2.isSelected == true) && (yes3.isSelected == true || no3.isSelected == true) && (yes4.isSelected == true || no4.isSelected == true ){
            nextButton.isEnabled = isValid
        }else if (yes1.isSelected == false || no1.isSelected == false) && (yes2.isSelected == false || no2.isSelected == false) && (yes3.isSelected == false || no3.isSelected == false) && (yes4.isSelected == false || no4.isSelected == false ){
            isValid = false
            nextButton.isEnabled = isValid
        }
       // nextButton.isEnabled = isValid
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        quest1.text = item.quest
        item = questions.apartment
        quest2.text = item.quest
        item = questions.shed
        quest3.text = item.quest
        item = questions.kids
        quest4.text = item.quest
        
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
        no2.layer.cornerRadius = no2.frame.height/2
        no2.setTitleColor(UIColor.white, for: .normal)
        
        yes3.backgroundColor = UIColor.lightGray
        yes3.layer.cornerRadius = yes3.frame.height/2
        yes3.setTitleColor(UIColor.white, for: .normal)
        
        no3.backgroundColor = UIColor.lightGray
        no3.layer.cornerRadius = no3.frame.height/2
        no3.setTitleColor(UIColor.white, for: .normal)
        
        yes4.backgroundColor = UIColor.lightGray
        yes4.layer.cornerRadius = yes4.frame.height/2
        yes4.setTitleColor(UIColor.white, for: .normal)
        
        no4.backgroundColor = UIColor.lightGray
        no4.layer.cornerRadius = no4.frame.height/2
        no4.setTitleColor(UIColor.white, for: .normal)
        
        nextButton.backgroundColor = UIColor.orange
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.setTitleColor(UIColor.white, for: .normal)
        
       // isButtonValid()
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
