//
//  SearchViewController.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var searchbar: UITextField!
    @IBOutlet weak var searchtable: UITableView!
    
    
    private let viewModel = BreedsViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchscell", for: indexPath)
        
        let imageView = cell.viewWithTag(3000) as? UIImageView
        let breedName = cell.viewWithTag(3001) as? UILabel
        
        if let imageView = imageView, let breedName = breedName{
            
            let currentBreed = viewModel.getBreed(byIndex: indexPath.row)
            
            imageView.image = currentBreed.image
            breedName.text = currentBreed.title
        }
        
        return cell
    }
    
    @IBAction func searchButton(_ sender: Any) {
        var request = REST_Request()
        request.getBreeds(andNamed: searchbar.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    // MARK: - Navigation

 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedRow = self.tableView.indexPathForSelectedRow else{return}
        
        let destination = segue.destination as? ListDetailViewController
        let selectedBreed = viewModel.getBreed(byIndex: selectedRow.row)
        destination?.selectedBreed = selectedBreed
     }
     
    }*/
    

}
