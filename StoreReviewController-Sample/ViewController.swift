//
//  ViewController.swift
//  StoreReviewController-Sample
//
//  Created by kawaharadai on 2018/06/08.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func popupReview(_ sender: Any) {
        // 使用可能OSは10.3以上
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
}

