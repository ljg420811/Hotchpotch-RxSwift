//
//  Common.swift
//  Hotchpotch
//
//  Created by Kilin on 16/8/1.
//  Copyright © 2016年 Kilin. All rights reserved.
//

import UIKit

// MARK:- Color
let hotchpotchColorGray = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
let hotchpotchColorRed  = UIColor(red: 238/255.0, green: 85/255.0,  blue: 64/255.0,  alpha: 1)


// MARK:- UIView extension
extension UIView{
    func colorfulCornerBorder(color: UIColor, cornerRadius: CGFloat){
        self.layer.borderWidth  = 1
        self.layer.borderColor  = color.CGColor
        self.layer.cornerRadius = cornerRadius
    }
}


// MARK:- UILabel extension
extension UILabel{
    func awesomeFont(size: CGFloat, fontName: FontAwesome){
        self.font = UIFont.fontAwesomeOfSize(size)
        self.text = String.fontAwesomeIconWithName(fontName)
    }
}


// MARK:- UIButton extension
extension UIButton{
    func awesomeFont(size: CGFloat, fontName: FontAwesome){
        self.titleLabel?.font = UIFont.fontAwesomeOfSize(size)
        self.setTitle(String.fontAwesomeIconWithName(fontName), forState: .Normal)
    }
    
    func selected(color: UIColor){
        self.backgroundColor = color
        self.colorfulCornerBorder(color, cornerRadius: 5)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func unselected(){
        self.backgroundColor = UIColor.clearColor()
        self.colorfulCornerBorder(hotchpotchColorRed, cornerRadius: 5)
        self.setTitleColor(hotchpotchColorRed, forState: .Normal)
    }
}