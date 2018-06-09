//
//  AppDelegate.swift
//  StoreReviewController-Sample
//
//  Created by kawaharadai on 2018/06/08.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // 通常起動
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ReviewControllerHelper.useCount()
        return true
    }

    /// Deeplink(URLスキーム)での起動
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        ReviewControllerHelper.useCount()
        return true
    }
}

