//
//  RESTRequest.swift
//  DM1
//
//  Created by karen lee on 14/10/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import Foundation

struct REST_Request{
    private var dogBreeds:[DogAPIbreed] = []
    private let session = URLSession.shared //session created
    
    private let base_url: String = "https://api.thedogapi.com/v1/breeds/search?q="
    //private let paramQuery: String = "q"
    
    mutating func getBreeds(andNamed: String){
        dogBreeds = []
       // let url = base_url + paramQuery + andNamed
        let url = base_url + andNamed
        
        //conversion to remove spaces for a valid URL
        guard let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else{
            return
        }
        
        if let url = URL(string: escapedAddress){ //for invaid url request
            let request = URLRequest(url: url)
            getData(request, element: "breeds") //array bracket to be returned
        }
    }
    
    private func getData(_ request: URLRequest, element: String){
        let task = session.dataTask(with: request, completionHandler: { //what to do with response that come back
            data, response, downloadError in
            
            if let error = downloadError{
                print(error) //if error occurs
            }else{
                var parsedResult: Any! = nil //JSON response returned as not sure whether string/int returned
                do{
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }catch{print()}
                //looking at returned result
                let result = parsedResult as! [[String:Any]]
                
                print(result)
                
                
               /* if let reviews = parsedResult as? [[String:Any]] {
                    for review in reviews {
                        if let name = review["weight"] as? String {
                           // do something with authorName
                            print(reviews)
                        }
                    }
                }*/
               // let allBreeds = result [element] as? [[String:Any]]
               // print(allBreeds)
            }
             
        })
        task.resume() //start task
    }
}
