//
//  HomeCollectionViewCell.swift
//  Hotchpotch
//
//  Created by Kilin on 16/7/29.
//  Copyright © 2016年 Kilin. All rights reserved.
//

import UIKit

typealias CellItem = (title: String, iconString: String)

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageLabel.layer.cornerRadius = 10
        self.imageLabel.clipsToBounds = true
    }
    
    func setup(item: CellItem){
        self.titleLabel.text = item.title
        self.imageLabel.text = item.iconString
        self.imageLabel.font = UIFont.fontAwesomeOfSize(35)
    }
}
