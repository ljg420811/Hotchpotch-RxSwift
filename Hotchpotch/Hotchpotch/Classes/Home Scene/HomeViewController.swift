//
//  HomeViewController.swift
//  Hotchpotch
//
//  Created by Kilin on 16/7/29.
//  Copyright © 2016年 Kilin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct AppImformation {
    let title : String
    let iconString : String
    let storyboardID : String
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var cellItems = Observable.just(
        [
            AppImformation(title: "密码管理", iconString: String.fontAwesomeIconWithName(.Key), storyboardID: "PasswordManagementViewControllerID"),
            AppImformation(title: "图片信息", iconString: String.fontAwesomeIconWithName(.Photo), storyboardID: "PasswordManagementViewControllerID"),
        ]
    )
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCollectionView()
    }
}

// MARK:- UICollectionView
extension HomeViewController
{
    private func setupCollectionView()
    {
        // Initial collection view cell
        self.cellItems
            .bindTo(self.homeCollectionView.rx_itemsWithCellIdentifier("HomeCollectionViewCellID", cellType: HomeCollectionViewCell.self)){ (row: Int, appInformation: AppImformation, cell: HomeCollectionViewCell) in
                
                cell.setup(appInformation)
                
            }
            .addDisposableTo(self.disposeBag)
        
        // Collection view selected action
        self.homeCollectionView
            .rx_modelSelected(AppImformation)
            .subscribeNext { (appInformation: AppImformation) in
                
                let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let viewController = storyboard.instantiateViewControllerWithIdentifier(appInformation.storyboardID)
                self.navigationController?.pushViewController(viewController, animated: true)
                
            }
            .addDisposableTo(self.disposeBag)
    }
}








