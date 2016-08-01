//
//  AddPasswordViewController.swift
//  Hotchpotch
//
//  Created by Kilin on 16/7/29.
//  Copyright © 2016年 Kilin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddPasswordViewController: UIViewController {

    @IBOutlet weak var accountBackgroundView: UIView!
    @IBOutlet weak var accountIconLabel: UILabel!
    @IBOutlet weak var accountInputTextField: UITextField!
    
    @IBOutlet weak var passwordBackgroundView: UIView!
    @IBOutlet weak var passwordIconLabel: UILabel!
    @IBOutlet weak var passwordInputTextField: UITextField!
    
    @IBOutlet weak var descriptionBackgroundView: UIView!
    @IBOutlet weak var descriptionIconLabel: UILabel!
    @IBOutlet weak var descriptionInputTextField: UITextField!
    
    @IBOutlet weak var orderIconLabel: UILabel!
    @IBOutlet weak var orderTipsButton: UIButton!
    @IBOutlet weak var orderLeftButton: UIButton!
    @IBOutlet weak var orderRightButton: UIButton!
    
    @IBOutlet weak var encryptionIconLabel: UILabel!
    @IBOutlet weak var encryptionTipsButton: UIButton!
    @IBOutlet weak var encryptionButton: UIButton!
    @IBOutlet weak var decryptionButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUILayout()
        self.bindActions()
    }
    
    // MARK:- Bind Actions
    func bindActions() {
        orderLeftButton.rx_tap
            .subscribeNext({ [weak self] in
                self?.orderLeftButton.selected(hotchpotchColorRed)
                self?.orderRightButton.unselected()
            })
            .addDisposableTo(disposeBag)
        
        orderRightButton.rx_tap
            .subscribeNext({ [weak self] in
                self?.orderRightButton.selected(hotchpotchColorRed)
                self?.orderLeftButton.unselected()
                })
            .addDisposableTo(disposeBag)
    }
    
    // MARK:- UI Layout
    func setupUILayout() {
        // Setup account
        accountBackgroundView.colorfulCornerBorder(hotchpotchColorGray, cornerRadius: 5)
        accountIconLabel.awesomeFont(20, fontName: .User)
        
        // Setup password
        passwordBackgroundView.colorfulCornerBorder(hotchpotchColorGray, cornerRadius: 5)
        passwordIconLabel.awesomeFont(20, fontName: .Lock)
        
        // Setup description
        descriptionBackgroundView.colorfulCornerBorder(hotchpotchColorGray, cornerRadius: 5)
        descriptionIconLabel.awesomeFont(20, fontName: .Pencil)
        
        // Setup order
        orderIconLabel.awesomeFont(20, fontName: .Sort)
        orderTipsButton.awesomeFont(10, fontName: .QuestionCircle)
        orderLeftButton.awesomeFont(20, fontName: .SortAlphaAsc)
        orderRightButton.awesomeFont(20, fontName: .SortAlphaDesc)
        orderLeftButton.selected(hotchpotchColorRed)
        orderRightButton.unselected()
        
        // Setup encryption
        encryptionIconLabel.awesomeFont(20, fontName: .Eye)
        encryptionTipsButton.awesomeFont(10, fontName: .QuestionCircle)
        encryptionButton.awesomeFont(20, fontName: .Certificate)
        decryptionButton.awesomeFont(20, fontName: .SunO)
        encryptionButton.selected(hotchpotchColorRed)
        decryptionButton.unselected()
    }
}











