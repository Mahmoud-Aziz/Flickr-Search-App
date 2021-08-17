//
//  MasterCollecCollectionViewCell.swift
//  TheNewFlickr
//
//  Created by Mahmoud Aziz on 16/08/2021.
//

import UIKit
import Kingfisher


class MasterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    var cellIdentifier: String? = ""
    var id:Int = 0
    
    func configure(url: URL?, id: String?) {
        if self.cellIdentifier == id {
            self.imageView.kf.setImage(with: url)
        } 
    }
}
