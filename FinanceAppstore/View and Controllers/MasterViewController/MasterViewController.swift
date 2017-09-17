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
    
    var json: JSON = JSON.null

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch self.json.type {
        case .array :
            return self.json.count
        default:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppstoreMasterCell", for: indexPath) as! MasterViewCell
        let row = indexPath.row
        
        cell.ranking?.text = String(row + 1)
        cell.title?.text = self.json[row]["im:name"]["label"].string
        cell.category?.text = self.json[row]["category"]["attributes"]["term"].string
        
        let thumbnailURL = self.json[row]["im:image"][2]["label"].string
        cell.appImage.imageFromURL(urlString: thumbnailURL!)
        cell.appImage.roundedStyle(width: cell.appImage.frame.width)
        
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
                let appId = self.json[row]["id"]["attributes"]["im:id"]
                let url = URL(string: "https://itunes.apple.com/lookup?id=\(appId)&country=kr")
                
                do {
                    let contentData = try Data(contentsOf: url!)
                    let json = JSON(data: contentData)
                    let detailViewController = segue.destination as! DetailViewController
                    detailViewController.json = json
                } catch {
                    print("error occurs")
                }
            }
        }
    }
}
