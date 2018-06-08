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
        let appStart = UserDefaults.standard.integer(forKey: "start")
        
        // 起動回数
        guard appStart >= 10 else {
            let alert = AlertHelper.alertWithClosure(title: "アプリ起用が少ないです", messege: "これからもよろしく", handler: nil)
            present(alert, animated: true)
            return
        }
        
        // 30日以上経っているか
        guard let nextDay = UserDefaults.standard.object(forKey: "now") as? Date, nextDay < Date() else {
            let alert = AlertHelper.alertWithClosure(title: "30日経っていないです", messege: "これからもよろしく", handler: nil)
            present(alert, animated: true)
            return
        }
        
        // 使用可能OSは10.3以上
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
            // 30日後を保存
            let nextDay: Date = Date(timeIntervalSinceNow: 60*60*24*30)
            UserDefaults.standard.set(nextDay, forKey: "now")
        }
    }
    
    
}

