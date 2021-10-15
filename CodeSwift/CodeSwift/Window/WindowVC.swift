//
//  WindowVC.swift
//  CodeSwift
//
//  Created by mac on 2021/10/13.
//

import UIKit

class WindowVC: UIViewController {

    
    //MARK:UIWindow 在iOS 13以后引入UISceneDelegate 管理界面的生命周期后，在有SceneDelegate下的默认的UIWindow的方式创建蒙版的方式失效了
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        UIWindow 
        
    }
    //MARK:获取keyWindow ,
    func getKeyWindow() -> UIWindow {
        var window = UIApplication.shared.keyWindow
        
        if #available(iOS 13.0, *) {
            // 在 iOS 13 以后获取KeyWindow 的方式废弃了
            window = UIApplication.shared.windows.filter({$0.isKeyWindow}).last
        }
        return window!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
