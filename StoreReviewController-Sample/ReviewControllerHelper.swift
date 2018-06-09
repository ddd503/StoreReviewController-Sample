//
//  ReviewControllerHelper.swift
//  StoreReviewController-Sample
//
//  Created by kawaharadai on 2018/06/09.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import Foundation

final class ReviewControllerHelper {
    
    /// 起動回数をカウントする
    static func useCount() {
        let useCount = UserDefaults.standard.integer(forKey: "useCount")
        // 初回、レビュー訴求可能判定日時がない場合は、現時刻を保存
        if useCount == 0, UserDefaults.standard.object(forKey: "nextAbleDay") as? Date == nil {
            UserDefaults.standard.set(Date(), forKey: "nextAbleDay")
        }
        UserDefaults.standard.set(useCount + 1, forKey: "useCount")
    }
    
    /// 起動回数をリセットする(〜回起動ごとにアクションを行うため)
    static func resetUseCount() {
        UserDefaults.standard.set(0, forKey: "useCount")
    }
    
    /// 起動回数が規定の値を超えているか
    ///
    /// - Parameter useCount: 規定されている起動回数
    /// - Returns: true: 規定を超えている、false: 規定を超えていない
    static func isOverUseCount(useCount: Int) -> Bool {
        return UserDefaults.standard.integer(forKey: "useCount") >= useCount
    }
    
    /// コールしたタイミングから~日後の日時を保存する
    ///
    /// - Parameter laterDayCount: 何日後の日時を保存するか
    static func saveNextAbleDays(laterDayCount: Double) {
        UserDefaults.standard.set(Date(timeIntervalSinceNow: 60 * 60 * 24 * laterDayCount), forKey: "nextAbleDay")
    }
    
    /// 前回のレビュー訴求から〜日以上経っているか（規定となる日時は前回ボタンを押したタイミングでsaveNextAbleDaysメソッドで決定、保存している）
    ///
    /// - Returns: true: 規定の日数以上経過している、false: 規定日数以上経過していない
    static func isPassedDay() -> Bool {
        guard let nextAbleDay = UserDefaults.standard.object(forKey: "nextAbleDay") as? Date else {
            return false
        }
        return Date() > nextAbleDay
    }
    
}

