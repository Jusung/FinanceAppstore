//
//  AppstoreItemModel.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 18/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import Foundation
import SwiftyJSON

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

class AppstoreDetailItem {
    var thumbnailURL: String?
    var trackName: String?
    var artistName: String?
    var appDescription: String?
    var currentVersionReleaseDate: String?
    var releaseNotes: String?
    var sellerName: String?
    var primaryGenreName: String?
    var version: String?
    var contentAdvisoryRating: String?
    var screenshots: [JSON]?
    
    init?(data: Data) throws {
        let json = JSON(data: data)
        let body = json["results"][0]
        
        guard let thumbnailURL = body["artworkUrl100"].string else {
            throw SerializationError.missing("artworkUrl100")
        }
        
        guard let title = body["trackName"].string else {
            throw SerializationError.missing("trackName")
        }
        
        guard let author = body["artistName"].string else {
            throw SerializationError.missing("artistName")
        }
        
        guard let appDescription = body["description"].string else {
            throw SerializationError.missing("description")
        }
        
        guard let currentVersionReleaseDate = body["currentVersionReleaseDate"].string else {
            throw SerializationError.missing("currentVersionReleaseDate")
        }
        
        guard let releaseNotes = body["releaseNotes"].string else {
            throw SerializationError.missing("releaseNotes")
        }
        
        guard let sellerName = body["sellerName"].string else {
            throw SerializationError.missing("sellerName")
        }
        
        guard let primaryGenreName = body["primaryGenreName"].string else {
            throw SerializationError.missing("primaryGenreName")
        }
        
        guard let version = body["version"].string else {
            throw SerializationError.missing("version")
        }
        
        guard let contentAdvisoryRating = body["contentAdvisoryRating"].string else {
            throw SerializationError.missing("contentAdvisoryRating")
        }
        
        self.thumbnailURL = thumbnailURL
        self.trackName = title
        self.artistName = author
        self.appDescription = appDescription
        self.currentVersionReleaseDate = currentVersionReleaseDate
        self.releaseNotes = releaseNotes
        self.sellerName = sellerName
        self.primaryGenreName = primaryGenreName
        self.version = version
        self.contentAdvisoryRating = "Rated \(contentAdvisoryRating)"
        self.screenshots = body["screenshotUrls"].arrayValue
    }
}
