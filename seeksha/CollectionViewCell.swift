//
//  CollectionViewCell.swift
//  seeksha
//
//  Created by moblie on 26/11/2018.
//  Copyright © 2018 lbh. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var resImage: UIImageView!
    @IBOutlet var resLabel: UILabel!
    
    func displayContent(image: UIImage, title: String){
        resImage.image = image
        resLabel.text = title
    }
}
