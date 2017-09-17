//
//  AppstoreItemDetailInfo.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 17/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import Foundation
import UIKit

class AppstoreItemDetailInfo {
    var thumbnailURL: String?
    var title: String?
    var author: String?
    var artworkUrl100: String?
    var trackName: String?
    var artistName: String?
    var appDescription: String?
    var currentVersionReleaseDate: String?
    var releaseDate: String?
    var releaseNotes: String?
    var sellerName: String?
    var primaryGenreName: String?
    var version: String?
    var trackContentRating: String?
    var developer: String?
    var category: String?
    var updatedDate: String?
    var rating: String?
}

enum DetailViewModelItemType {
    case profile
    case description
    case release
    case information
}

protocol DetailViewModelItem {
    var type: DetailViewModelItemType { get }
    var sectionTitle: String { get }
}

class DetailViewModelProfileItem: DetailViewModelItem {
    var type: DetailViewModelItemType {
        return .profile
    }
    
    var sectionTitle: String {
        return ""
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
    
    var sectionTitle: String {
        return "Description"
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
    
    var sectionTitle: String {
        return "What's New"
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
    
    var sectionTitle: String {
        return "Information"
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

class DetailViewModel: NSObject {
    var items = [DetailViewModelItem]()
    
    override init() {
        super.init()

        let itemInfo = AppstoreItemDetailInfo()
        
        if let thumbnailURL = itemInfo.thumbnailURL, let title = itemInfo.title, let author = itemInfo.author {
            let profileItem = DetailViewModelProfileItem(thumbnailURL: thumbnailURL, title: title, author: author)
            items.append(profileItem)
        }
        
        if let appDescription = itemInfo.appDescription {
            let descriptionItem = DetailViewModelDescriptionItem(appDescription: appDescription)
            items.append(descriptionItem)
        }
        
        if let releaseDate = itemInfo.releaseDate, let releaseNote = itemInfo.releaseNotes {
            let releaseItem = DetailViewModelReleaseItem(releaseDate: releaseDate, releaseNote: releaseNote)
            items.append(releaseItem)
        }
        
        if let developer = itemInfo.developer, let category = itemInfo.category, let updateDate = itemInfo.updatedDate, let version = itemInfo.version, let rating = itemInfo.rating {
            let informationItem = DetailViewModelInformationItem(developer: developer, category: category, updatedDate: updateDate, version: version, rating: rating)
            items.append(informationItem)
        }
    }
}

//extension DetailViewModel: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return items.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // we will configure the cells here
//    }
//}
