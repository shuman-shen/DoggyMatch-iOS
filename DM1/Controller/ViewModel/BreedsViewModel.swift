//
//  BreedsViewModel.swift
//  DM1
//
//  Created by karen lee on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation
import UIKit

struct BreedsViewModel{
    private (set) var breeds:[Breeds] = []
    
    var count:Int{
        return breeds.count
    }
    
    init(){loadData()}
    
    private mutating func loadData(){
        breeds.append(Breeds.Beagle)
        breeds.append(Breeds.FBulldog)
        breeds.append(Breeds.Labrador)
        breeds.append(Breeds.Shiba)
        breeds.append(Breeds.Pomeranian)
        breeds.append(Breeds.GermanShepherd)
    }
    
    func getBreed(byIndex index:Int) -> (title:String, description:String, image:UIImage?){
        
        let title = breeds[index].rawValue
        let description = breeds[index].description
        let image = UIImage(named: breeds[index].imageName)
        return (title, description, image)
    }
}
