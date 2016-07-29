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

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var cellItems = Observable.just(
        [
            ("密码管理", String.fontAwesomeIconWithName(.Key)),
            ("图片信息", String.fontAwesomeIconWithName(.Photo)),
            ("密码管理", String.fontAwesomeIconWithName(.Key)),
            ("密码管理", String.fontAwesomeIconWithName(.Key)),
            ("密码管理", String.fontAwesomeIconWithName(.Key)),
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
        self.cellItems
            .bindTo(self.homeCollectionView.rx_itemsWithCellIdentifier("HomeCollectionViewCellID", cellType: HomeCollectionViewCell.self)){ (row: Int, item: CellItem, cell: HomeCollectionViewCell) in
                
                cell.setup(item)
                
            }
            .addDisposableTo(self.disposeBag)
        
        self.homeCollectionView
            .rx_modelSelected(CellItem)
            .subscribeNext { (cellItem: CellItem) in
                
                print(cellItem)
                
            }
            .addDisposableTo(self.disposeBag)
    }
}








