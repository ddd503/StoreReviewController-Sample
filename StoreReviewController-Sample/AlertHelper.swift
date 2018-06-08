//
//  AlertHelper.swift
//  StoreReviewController-Sample
//
//  Created by kawaharadai on 2018/06/08.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class AlertHelper: NSObject {

    static func alertWithClosure(title: String?,
                                 messege: String?,
                                 handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        
        let alert = UIAlertController(title: title,
                                      message: messege,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
                
        alert.addAction(okAction)
        
        return alert
    }

}
