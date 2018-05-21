//
//  AppDelegate.swift
//  Lilaky
//
//  Created by hesham tatawy on 13/08/1439 AH.
//  Copyright © 1439 alatheertech. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         sleep(3)
          IQKeyboardManager.shared.enable = true
//        
//        if Helper.getUserData() == true {
//            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
//            
//            window?.rootViewController = tab
//            
//        }
   
        return true
    }


}

