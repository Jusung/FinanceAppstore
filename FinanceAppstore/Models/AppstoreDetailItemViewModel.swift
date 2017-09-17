//
//  AppstoreItemViewModel.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 18/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

enum DetailViewModelItemType {
    case profile
    case description
    case release
    case information
    case screenshots
}

protocol DetailViewModelItem {
    var type: DetailViewModelItemType { get }
}

class DetailViewModel: NSObject {
    var items = [DetailViewModelItem]()
    
    init?(data: Data) throws {
        super.init()
        
        guard let itemInfo = try AppstoreDetailItem(data: data) else {
            throw SerializationError.missing("data")
        }
        
        if let thumbnailURL = itemInfo.thumbnailURL, let title = itemInfo.trackName, let author = itemInfo.sellerName {
            let profileItem = DetailViewModelProfileItem(thumbnailURL: thumbnailURL, title: title, author: author)
            items.append(profileItem)
        }
        
        //
        if let screenshotUrls = itemInfo.screenshots {
            let screenshotItem = DetailViewModelScreenshotsItem(screenshots: screenshotUrls)
            items.append(screenshotItem)
        }
        //
        
        if let appDescription = itemInfo.appDescription {
            let descriptionItem = DetailViewModelDescriptionItem(appDescription: appDescription)
            items.append(descriptionItem)
        }
        
        if let releaseDate = itemInfo.currentVersionReleaseDate, let releaseNote = itemInfo.releaseNotes {
            let releaseItem = DetailViewModelReleaseItem(releaseDate: releaseDate, releaseNote: releaseNote)
            items.append(releaseItem)
        }
        
        if let developer = itemInfo.sellerName, let category = itemInfo.primaryGenreName, let updateDate = itemInfo.currentVersionReleaseDate, let version = itemInfo.version, let rating = itemInfo.contentAdvisoryRating {
            let informationItem = DetailViewModelInformationItem(developer: developer, category: category, updatedDate: updateDate, version: version, rating: rating)
            items.append(informationItem)
        }
    }
}

extension DetailViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        switch item.type {
        case .profile:
            if let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewGeneralInfoCell.identifier, for: indexPath) as? DetailViewGeneralInfoCell {
                cell.item = item
                return cell
            }
        case .description:
            if let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewDescriptionCell.identifier, for: indexPath) as? DetailViewDescriptionCell {
                cell.item = item
                return cell
            }
        case .release:
            if let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewWhatsNewCell.identifier, for: indexPath) as? DetailViewWhatsNewCell {
                cell.item = item
                return cell
            }
        case .information:
            if let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewInformationCell.identifier, for: indexPath) as? DetailViewInformationCell {
                cell.item = item
                return cell
            }
        case .screenshots:
            if let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewScreenshotCell.identifier, for: indexPath) as? DetailViewScreenshotCell {
                cell.item = item
                return cell
            }
        }
        
        return UITableViewCell()
    }
}

class DetailViewModelProfileItem: DetailViewModelItem {
    var type: DetailViewModelItemType {
        return .profile
    }
    
    var thumbnailURL: String
    var title: String
    var author: String
    
    init(thumbnailURL: String, title: String, author: String) {
        self.thumbnailURL = thumbnailURL
        self.title = title
        self.author = author
    }
}

class DetailViewModelDescriptionItem: DetailViewModelItem {
    var type: DetailViewModelItemType {
        return .description
    }
    
    var appDescription: String
    
    init(appDescription: String) {
        self.appDescription = appDescription
    }
}

class DetailViewModelReleaseItem: DetailViewModelItem {
    var type: DetailViewModelItemType {
        return .release
    }
    
    var releaseDate: String
    var releaseNote: String
    
    init(releaseDate: String, releaseNote: String) {
        self.releaseDate = releaseDate
        self.releaseNote = releaseNote
    }
}

class DetailViewModelInformationItem: DetailViewModelItem {
    var type: DetailViewModelItemType {
        return .information
    }
    
    var developer: String
    var category: String
    var updatedDate: String
    var version: String
    var rating: String
    
    init(developer: String, category: String, updatedDate: String, version: String, rating: String) {
        self.developer = developer
        self.category = category
        self.updatedDate = updatedDate
        self.version = version
        self.rating = rating
    }
}

class DetailViewModelScreenshotsItem: DetailViewModelItem {
    var type: DetailViewModelItemType {
        return .screenshots
    }

    var screenshots: [JSON]
    
    init(screenshots: [JSON]) {
        self.screenshots = screenshots
    }
}
