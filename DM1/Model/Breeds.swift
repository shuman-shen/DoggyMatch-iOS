//
//  Breeds.swift
//  DM1
//
//  Created by karen lee on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation

enum Breeds:String{
    case Beagle = "Beagle", FBulldog = "French Bulldog", Labrador = "Labrador"
    
    var imageName:String{
        switch self{
        case .Beagle: return "Beagle"
        case .FBulldog: return "FrenchBulldog"
        case .Labrador: return "Labrador"
        }
    }
    
    var description:String{
        switch self{
        case .Beagle: return "Active, friendly, intelligent and good temperament"
        case .FBulldog: return "Good with people, friendly dog"
        case .Labrador: return "Friendly and active, loves companionship"
        }
    }
}
