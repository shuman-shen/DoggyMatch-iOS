//
//  Breeds.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation

enum Breeds:String{
    case Beagle = "Beagle", FBulldog = "French Bulldog", Labrador = "Labrador", Shiba = "Shiba Inu", Pomeranian = "Pomeranian", GermanShepherd = "German Shepherd"
    
    var imageName:String{
        switch self{
        case .Beagle: return "Beagle"
        case .FBulldog: return "FrenchBulldog"
        case .Labrador: return "Labrador"
        case .Shiba: return "Shiba"
        case .Pomeranian: return "Pomeranian"
        case .GermanShepherd: return "GermanShepherd"
        }
    }
    
    var description:String{
        switch self{
        case .Beagle: return "Active, friendly, intelligent and good temperament"
        case .FBulldog: return "Good with people, friendly dog"
        case .Labrador: return "Friendly and active, loves companionship"
        case .Shiba: return "Japanese Hunting dog, active"
        case .Pomeranian: return "Small, friendly dog"
        case .GermanShepherd: return "Large size. Originally breed for hunting"
        }
    }
}
