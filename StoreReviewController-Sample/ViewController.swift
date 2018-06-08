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
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func popupReview(_ sender: Any) {
        SKStoreReviewController.requestReview()
    }
}

