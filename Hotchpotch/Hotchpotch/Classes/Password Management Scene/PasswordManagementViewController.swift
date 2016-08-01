//
//  PasswordManagementViewController.swift
//  Hotchpotch
//
//  Created by Kilin on 16/7/29.
//  Copyright © 2016年 Kilin. All rights reserved.
//

import UIKit

class PasswordManagementViewController: UIViewController
{
    @IBAction func addPasswordButtonClicked(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        if let viewController = storyboard.instantiateViewControllerWithIdentifier("AddPasswordViewControllerID") as? AddPasswordViewController
        {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
