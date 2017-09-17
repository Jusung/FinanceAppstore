//
//  DetailViewController.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailViewController: UITableViewController {
    var json: JSON = JSON.null

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Change with View Model Style using AppstoreItemDetailInfo
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewGeneralInfoCell", for: indexPath) as! DetailViewGeneralInfoCell
            let thumbnailURL = json["results"][0]["artworkUrl100"].string
            cell.appImage.imageFromURL(urlString: thumbnailURL!)
            cell.appImage.roundedStyle(width: cell.appImage.frame.width)
            cell.title?.text = json["results"][0]["trackName"].string
            cell.author?.text = json["results"][0]["artistName"].string
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewDescriptionCell", for: indexPath) as! DetailViewDescriptionCell
            cell.appDescription.text = json["results"][0]["description"].string
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewWhatsNewCell", for: indexPath) as! DetailViewWhatsNewCell
            
            if let releaseDate = json["results"][0]["currentVersionReleaseDate"].string {
                let shortDate = releaseDate.shortDate(dateString: releaseDate)
                
                cell.releaseDate.text = shortDate
            }
            cell.releaseNotes.text = json["results"][0]["releaseNotes"].string
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewInformationCell", for: indexPath) as! DetailViewInformationCell
            cell.developer.text = json["results"][0]["sellerName"].string
            cell.category.text = json["results"][0]["primaryGenreName"].string
            cell.version.text = json["results"][0]["version"].string
            
            cell.rating.text = "Rated \(json["results"][0]["trackContentRating"])"
            
            if let releaseDate = json["results"][0]["currentVersionReleaseDate"].string {
                let shortDate = releaseDate.shortDate(dateString: releaseDate)
                cell.updatedDate.text = shortDate
            }
        
            return cell
        }

        return UITableViewCell()
    }
}
