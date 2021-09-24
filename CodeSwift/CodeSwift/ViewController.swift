//
//  ViewController.swift
//  CodeSwift
//
//  Created by mac on 2021/9/6.
//

import UIKit



class ViewController: UIViewController,JumpProtocol {

    let button:UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
    
    func changeBackColor(backColor: UIColor) {
        self.view.backgroundColor = backColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        cacheObjc.saveName = nil
       
        self.view.addSubview(button)
        button.backgroundColor = .blue
//        button.addTarget(self, action: #selector(btnClick(btn:)), for: <#T##UIControl.Event#>)
        
        button.addTarget(self, action: #selector(btnClick(_:)),for:.touchUpInside)
        
        self.view.backgroundColor = .white
        
        
    }
    
  @objc  func btnClick(_ btn:UIButton)  {
        
        print("输出数据")
    
    let vc = TableVC.init()
    vc.hidesBottomBarWhenPushed = true
    self.navigationController?.pushViewController(vc, animated: true)
    
    
    
//    let jumpVC = JumpVC.init()
//    jumpVC.modalPresentationStyle = .fullScreen
//    jumpVC.viewClosure = { [weak self] (str:String) -> String in
//        self?.button.setTitle("jump的按钮是\(str)", for: .normal)
//        return "12345"
//    }
//    jumpVC.delegate = self
//    
//    btn.isEnabled = false
//    
//    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//        btn.isEnabled = true
//    }
//    
//    self.present(jumpVC, animated: true, completion: nil)


    
    
    
    }
    
    // MARK === 逃逸闭包
    func toDoClosure(closure:@escaping(String) -> Void)  {
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute: {
            closure("good test")
        })
    }

     

}







func isIphoneX() -> Bool {
    var iphoneX:Bool = false
    
    if UIDevice.current.userInterfaceIdiom != .phone{
        return false
    }
   
    if #available(iOS 11.0, *)  {
        let mainWindow:UIWindow = UIApplication.shared.delegate?.window as! UIWindow
        if mainWindow.safeAreaInsets.bottom > 0.0 {
            iphoneX = true
        }
    }
    
    return iphoneX
    
}




@propertyWrapper
class userCache<T> {
    var key:String
    init(_ key:String) {
        self.key = key
    }
    var wrappedValue:T?{
        get{
            (UserDefaults.standard.object(forKey: key))! as? T
        }
        set{
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: key)
            }else{
                UserDefaults.standard.setValue(newValue, forKey: key)
            }
        }
    }
}

struct cacheObjc {
    
    @userCache("200")
   static var saveName:String?
    
}


