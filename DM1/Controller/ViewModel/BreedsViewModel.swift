//
//  BreedsViewModel.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation
import UIKit

struct BreedsViewModel{
    private var breedManager = BreedManager.shared
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
        breeds.append(Breeds.Poodle)
        breeds.append(Breeds.Maltese)
        breeds.append(Breeds.Yorkshire)
        breeds.append(Breeds.Pug)
    }
    
    func getBreed(byIndex index:Int) -> (title:String, description:String, image:UIImage?){
        
        let title = breeds[index].rawValue
        let description = breeds[index].description
        let image = UIImage(named: breeds[index].imageName)
        return (title, description, image)
    }
    
    //display list of breeds for favourite
    var breedList:String{
        var result: String = ""
        let breeds = breedManager.breeds
        for(_, breed) in breeds.enumerated(){
            if let name = breed.name{
                result += name + "\n"
            }
        }
        return result
    }
    
    //add to favourite list
    mutating func addBreed(_ name:String,_ user:String, _ image:String, _ detail: String){
        guard let image = UIImage(named: image) else {return}
        
        breedManager.addBreeds(name, image, detail)
    }
    
    mutating func addBreeds(_ name:String, _ image:String, _ detail: String){
        guard let image = UIImage(named: image) else {return}
        
        breedManager.addBreeds(name, image, detail)
    }
    
}
