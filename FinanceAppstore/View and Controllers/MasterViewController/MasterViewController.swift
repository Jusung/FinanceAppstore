//
//  MasterViewController.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 16/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit
import SwiftyJSON

class MasterViewController: UITableViewController {
    
    var items: [AppstoreItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppstoreMasterCell", for: indexPath) as! MasterViewCell
        let row = indexPath.row
        let item: AppstoreItem = items[row]
        
        cell.ranking?.text = String(row + 1)
        cell.item = item
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: "DetailSegueIdentifier", sender: indexPath)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegueIdentifier" {
            if let indexPath = sender as? IndexPath {
                let row = indexPath.row
                let item: AppstoreItem = items[row]
                let appId = item.appId
                let url = URL(string: "https://itunes.apple.com/lookup?id=\(appId!)&country=kr")
                
                do {
                    let contentData = try Data(contentsOf: url!)
                    let detailViewController = segue.destination as! DetailViewController
                    let viewModel = try DetailViewModel(data: contentData)
                    detailViewController.viewModel = viewModel
                } catch {
                    print("error occurs while prepare data:\(error)")
                }
            }
        }
    }
}
