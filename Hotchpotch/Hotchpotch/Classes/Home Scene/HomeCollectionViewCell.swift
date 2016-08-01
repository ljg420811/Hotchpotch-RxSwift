//
//  HomeCollectionViewCell.swift
//  Hotchpotch
//
//  Created by Kilin on 16/7/29.
//  Copyright © 2016年 Kilin. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
 
    var appInformation: AppImformation?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageLabel.layer.cornerRadius = 10
        self.imageLabel.clipsToBounds = true
    }
    
    func setup(appInformation: AppImformation){
        self.appInformation = appInformation
        
        self.titleLabel.text = appInformation.title
        self.imageLabel.text = appInformation.iconString
        self.imageLabel.font = UIFont.fontAwesomeOfSize(35)
    }
}
