//
//  DetailViewScreenshotCell.swift
//  FinanceAppstore
//
//  Created by Jusung Kye on 18/09/2017.
//  Copyright © 2017 TestForKakaoBank. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailViewScreenshotCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var screenshots: [JSON] = []
    var item: DetailViewModelItem? {
        didSet {
            guard let item = item as? DetailViewModelScreenshotsItem else {
                return
            }
            self.screenshots = item.screenshots
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - CollectionView DataSource & Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 135, height: 240)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenshotCollectionCell", for: indexPath) as! ScreenshotCollectionCell
        
        if let thumbnailURL = screenshots[indexPath.row].string {
            cell.imageView.imageFromURL(urlString: thumbnailURL)
            return cell
        }

        return UICollectionViewCell()
    }
    
}
