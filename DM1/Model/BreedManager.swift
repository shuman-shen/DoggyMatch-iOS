//
//  BreedManager.swift
//  DM1
//
//  Created by karen lee on 19/10/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class BreedManager{
    
    static let shared = BreedManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let managedContext: NSManagedObjectContext
    
    //keep collection
    private (set) var breeds:[Breed] = []
    private (set) var users:[User] = []
    
    private init(){
        managedContext = appDelegate.persistentContainer.viewContext
        loadBreeds()
        loadUsers()
    }
    
    private func createNSUser(_ user: String, userImage: UIImage) -> User{
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)! //create entity
        
        //create placeholder for User object
        let nsUser = NSManagedObject(entity: userEntity, insertInto: managedContext) as! User
        
        //insert into object
        nsUser.setValue(user, forKey: "username")
        let data = userImage.pngData() as NSData?
        nsUser.userImage = data
        return nsUser
    }
    
    private func createNSBreed(_ name: String, user: User, image: UIImage, detail: String) -> Breed{
        let breedEntity = NSEntityDescription.entity(forEntityName: "Breed", in: managedContext)! //create entity
        
        //create placeholder for User object
        let nsBreed = NSManagedObject(entity: breedEntity, insertInto: managedContext) as! Breed
        
        //insert into object
        nsBreed.setValue(name, forKey: "name")
        let data = image.pngData() as NSData?
        nsBreed.image = data
        nsBreed.user = user
        nsBreed.setValue(detail, forKey: "detail")
        return nsBreed
    }
    
     private func createNSBreeds(_ name: String, image: UIImage, detail: String) -> Breed{
        let breedEntity = NSEntityDescription.entity(forEntityName: "Breed", in: managedContext)!
         let nsBreeds = NSManagedObject(entity: breedEntity, insertInto: managedContext) as! Breed
        nsBreeds.setValue(name, forKey: "name")
        let datas = image.pngData() as NSData?
        nsBreeds.image = datas
        nsBreeds.setValue(detail, forKey: "detail")
        return nsBreeds
    }
    
    func addBreed(_ name:String, _ user:String,_ image:UIImage, _ detail:String){
        let nsUser = createNSUser(user, userImage: image)
        let nsBreed = createNSBreed(name, user: nsUser, image: image, detail: detail)
        breeds.append(nsBreed)
        
        do{
            try managedContext.save() //save to memory
        }catch let error as NSError{
            print("Unable to save \(error), \(error.userInfo)")
        }
    }
    
    func addBreeds(_ name:String,_ image:UIImage, _ detail:String){
        //let nsUser = createNSUser(user, userImage: image)
        let nsBreeds = createNSBreeds(name, image: image, detail: detail)
        breeds.append(nsBreeds)
        
        do{
            try managedContext.save() //save to memory
        }catch let error as NSError{
            print("Unable to save \(error), \(error.userInfo)")
        }
    }
    
    func addUser(_ username:String, _ userImage:UIImage){
        let nsUser = createNSUser(username, userImage: userImage)
        users.append(nsUser)
    }
    
    private func loadBreeds(){ //loads at start of app
        do{
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Breed")
            
            let result = try managedContext.fetch(fetchRequest)
            breeds = result as! [Breed]
        }catch let error as NSError{
            print("Unable to save \(error), \(error.userInfo)")
        }
    }
    
    private func loadUsers(){
        do{
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            let result = try managedContext.fetch(fetchRequest)
            users = result as! [User]
        }catch let error as NSError{
            print("Unable to save \(error), \(error.userInfo)")
        }
    }
    
}
