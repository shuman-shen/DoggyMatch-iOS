//
//  SearchTableViewController.swift
//  DM1
//
//  Created by karen lee on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    private let viewModel = BreedsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listcell", for: indexPath)

        let imageView = cell.viewWithTag(1000) as? UIImageView
        let breedName = cell.viewWithTag(1001) as? UILabel
        
        if let imageView = imageView, let breedName = breedName{
            
            let currentBreed = viewModel.getBreed(byIndex: indexPath.row)
            
            imageView.image = currentBreed.image
            breedName.text = currentBreed.title
        }

        return cell
    }
 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedRow = self.tableView.indexPathForSelectedRow else{return}
        
        let destination = segue.destination as? ListDetailViewController
        let selectedBreed = viewModel.getBreed(byIndex: selectedRow.row)
        destination?.selectedBreed = selectedBreed
    }
    

}
