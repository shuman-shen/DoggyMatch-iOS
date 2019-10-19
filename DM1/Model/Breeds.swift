//
//  Breeds.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation

enum Breeds:String{
    case Beagle = "Beagle", FBulldog = "French Bulldog", Labrador = "Labrador", Shiba = "Shiba Inu", Pomeranian = "Pomeranian", GermanShepherd = "German Shepherd", Poodle = "Poodle", Maltese = "Maltese", Yorkshire = "Yorkshire Terriers", Pug = "Pug"
    
    var imageName:String{
        switch self{
        case .Beagle: return "Beagle"
        case .FBulldog: return "FrenchBulldog"
        case .Labrador: return "Labrador"
        case .Shiba: return "Shiba"
        case .Pomeranian: return "Pomeranian"
        case .GermanShepherd: return "GermanShepherd"
        case .Poodle: return "Poodle"
        case .Maltese: return "Maltese"
        case .Yorkshire: return "Yorkshire"
        case .Pug: return "Pug"
        }
    }
    
    var description:String{
        switch self{
        case .Beagle: return "Beagles are widely considered to be good with other pets and children. They are cheerful dogs that like affection. They prefer company, however, and if left alone, may howl and be destructive."
        case .FBulldog: return "The French bulldog is an even-tempered house dog that thrives on attention. In fact, he demands it! This dog is ideal for a single-person household, as he may compete for your attention with other members of the family. The French bulldog does not bark a lot, only when he finds real cause for excitement."
        case .Labrador: return "In general, Labrador retrievers are excellent family dogs, as long as you keep in mind their need for exercise and training. These are dogs bred to work and work hard and they love to have jobs to do, particularly retrieving."
        case .Shiba: return "he Shiba Inu dog breed was originally bred to flush birds and small game, and was occasionally used to hunt wild boar. He is one of Japan’s six native breeds: Akita (large), Kishu, Hokkaido, Kai, Shikoku (medium), and Shiba (small). He is known for his spirited personality, small upright ears, and cat-like agility. Today he serves primarily as a companion dog in Japan and the United States."
        case .Pomeranian: return "Pomeranians are generally perky, friendly little dogs. These are active little dogs that do need daily exercise, even if it is just a walk around the block. They are quite intelligent and do well in obedience competitions despite a small independent streak. As they age, they are more amenable to being truly lap dogs."
        case .GermanShepherd: return "German shepherd dogs get along well with children and other pets if raised with them, but in keeping with their guarding instincts, they tend to be leery of strangers. The breed is considered to be smart and easy to train."
        case .Poodle: return "Poodles are a group of formal dog breeds, the Standard Poodle, Miniature Poodle and Toy Poodle. The origin of the breed is still discussed, with a prominent dispute over whether the poodle descends from Germany as a type of water dog, or from the French Barbet"
        case .Maltese: return "The Maltese is a small breed of dog in the Toy Group. It descends from dogs originating in the Central Mediterranean Area. The breed name and origins are generally understood to derive from the Mediterranean island nation of Malta"
        case .Yorkshire: return "The Yorkshire Terrier is a small dog breed of terrier type, developed during the 19th century in Yorkshire, England. Ideally its maximum size is 7 pounds. A popular companion dog, the Yorkshire Terrier has also been part of the development of other breeds, such as the Silky Terrier"
        case .Pug: return "The pug is a breed of dog with physically distinctive features of a wrinkly, short-muzzled face, and curled tail. The breed has a fine, glossy coat that comes in a variety of colours, most often fawn or black, and a compact square body with well-developed muscles"
        }
    }
}
