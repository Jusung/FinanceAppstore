//
//  MyAppstoreItem.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 18/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import Foundation
import SwiftyJSON

class AppstoreItem {
    var appId: String?
    var thumbnailURL: String?
    var title: String?
    var category: String?
    
    init?(json: JSON) throws {
        guard let appId = json["id"]["attributes"]["im:id"].string else {
            throw SerializationError.missing("im:id")
        }
        
        guard let thumbnailURL = json["im:image"][2]["label"].string else {
            throw SerializationError.missing("im:image")
        }
        
        guard let title = json["im:name"]["label"].string else {
            throw SerializationError.missing("im:name")
        }
        
        guard let category = json["category"]["attributes"]["term"].string else {
            throw SerializationError.missing("term")
        }
        
        self.appId = appId
        self.thumbnailURL = thumbnailURL
        self.title = title
        self.category = category
    }
}
