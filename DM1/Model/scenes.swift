//
//  scenes.swift
//  DM1
//
//  Created by xKiddos on 21/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation

enum questions{
    case novice, apartment, shed, kids
    
    var quest:String{
        switch self{
        case .novice:
            return ("Are you a novice owner?")
        case .apartment:
            return ("Do you live in an apartment?")
        case .shed:
            return ("So you feel annoyed cleaning sheds?")
        case .kids:
            return ("Do you have kids at home?")
        }
    }
}

enum images{
    case home, profile
    var image:String{
        switch self{
        case .home:
            return ("Logo")
        case .profile:
            return ("default_profile")
        }
    }
}

enum breeds{
    case beagle, bulldog, labrador, shiba, pomeranian, germanShepherd
    
    var dog:(name:String, size:String, info:String){
        switch self{
        case .beagle:
            return ("Beagle", "Medium", "Active, friendly, intelligent and good temperament")
        case .bulldog:
            return ("French Bulldog", "Small", "Good with people, friendly dog")
        case .labrador:
            return ("Labrador", "Large", "Friendly and active, loves companionship")
        case .shiba:
            return ("Shiba Inu", "Medium", "Japanese Hunting dog, active")
        case .pomeranian:
            return ("Pomeranian", "Small", "Small, friendly dog")
        case .germanShepherd:
            return ("German Shepherd", "Large", "Large size. Originally breed for hunting")
        }
    }
}

enum breedImage{
    case beagle, bulldog, labrador, shiba, pomeranian, germanShepherd
    
    var dogImage:(name:String,image:String){
        switch self{
        case .beagle:
            return ("Beagle", "Beagle")
        case .bulldog:
            return ("French Bulldog", "FrenchBulldog")
        case .labrador:
            return ("Labrador", "Labrador")
        case .shiba:
            return ("Shiba", "Shiba")
        case .pomeranian:
            return ("Pomeranian", "Pomeranian")
        case .germanShepherd:
            return ("German Shepherd", "GermanShepherd")
        }
    }
}



