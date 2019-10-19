//
//  ProfileViewModel.swift
//  DM1
//
//  Created by karen lee on 19/10/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation
import UIKit

struct ProfileViewModel{
    //reference to model
    private var breedManager = BreedManager.shared
    
    //display list of users
    var userList:String{
        var result: String = ""
        let users = breedManager.users
        for(_, user) in users.enumerated(){
            if let username = user.username{
                result += username + "\n"
            }
        }
        return result
    }
    
    mutating func addUser(_ username:String, _ userImage:String){
        guard let userImage = UIImage(named: userImage) else {return}
        
        breedManager.addUser(username, userImage)
    }
}
