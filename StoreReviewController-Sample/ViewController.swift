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

    private let overUseCount = 10

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popupReview(_ sender: Any) {
        
        // 起動回数チェック
        guard ReviewControllerHelper.isOverUseCount(useCount: overUseCount) else {
            let alert = AlertHelper.alertWithClosure(title: "アプリ起用が少ないです",
                                                     messege: "これからもよろしく",
                                                     handler: nil)
            present(alert, animated: true)
            return
        }
        
        // 経過日数チェック
        guard ReviewControllerHelper.isPassedDay() else {
            let alert = AlertHelper.alertWithClosure(title: "30日経っていないです", messege: "これからもよろしく", handler: nil)
            present(alert, animated: true)
            return
        }
        
        // 使用可能OSは10.3以上
        if #available(iOS 10.3, *) {
            // レビュー訴求
            SKStoreReviewController.requestReview()
            
            // 次回レビュー訴求表示条件は「前回表示時から10回以上起動している」かつ「前回表示から30日以上経過している」
            // 30日後を保存
            ReviewControllerHelper.saveNextAbleDays(laterDayCount: 30)
            // 起動回数をリセット
            ReviewControllerHelper.resetUseCount()
        }
    }
    
    
}

