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
            return ("Do you feel annoyed cleaning sheds?")
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
            return ("Beagle", "Medium", "Beagles are widely considered to be good with other pets and children. They are cheerful dogs that like affection. They prefer company, however, and if left alone, may howl and be destructive.")
        case .bulldog:
            return ("French Bulldog", "Small", "The French bulldog is an even-tempered house dog that thrives on attention. In fact, he demands it! This dog is ideal for a single-person household, as he may compete for your attention with other members of the family. The French bulldog does not bark a lot, only when he finds real cause for excitement.")
        case .labrador:
            return ("Labrador", "Large", "In general, Labrador retrievers are excellent family dogs, as long as you keep in mind their need for exercise and training. These are dogs bred to work and work hard and they love to have jobs to do, particularly retrieving.")
        case .shiba:
            return ("Shiba Inu", "Medium", "The Shiba Inu dog breed was originally bred to flush birds and small game, and was occasionally used to hunt wild boar. He is one of Japan’s six native breeds: Akita (large), Kishu, Hokkaido, Kai, Shikoku (medium), and Shiba (small). He is known for his spirited personality, small upright ears, and cat-like agility. Today he serves primarily as a companion dog in Japan and the United States.")
        case .pomeranian:
            return ("Pomeranian", "Small", "Pomeranians are generally perky, friendly little dogs. These are active little dogs that do need daily exercise, even if it is just a walk around the block. They are quite intelligent and do well in obedience competitions despite a small independent streak. As they age, they are more amenable to being truly lap dogs.")
        case .germanShepherd:
            return ("German Shepherd", "Large", "German shepherd dogs get along well with children and other pets if raised with them, but in keeping with their guarding instincts, they tend to be leery of strangers. The breed is considered to be smart and easy to train.")
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



