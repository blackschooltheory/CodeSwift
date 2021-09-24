//
//  JumpVC.swift
//  CodeSwift
//
//  Created by mac on 2021/9/15.
//

import UIKit


protocol JumpProtocol {
    func changeBackColor(backColor:UIColor)
}

class JumpVC: UIViewController {
    var viewClosure:((String)->String)?
    var delegate:JumpProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let btnStr:String = String(arc4random()/100)
        let button:UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(button)
        button.backgroundColor = .blue
//        button.addTarget(self, action: #selector(btnClick(btn:)), for: <#T##UIControl.Event#>)
        button.setTitle(btnStr, for: .normal)
        button.addTarget(self, action: #selector(btnClick(_:)),for:.touchUpInside)
        
        self.view.backgroundColor = .brown
    }
    
    @objc  func btnClick(_ btn:UIButton)  {
          
        print("输出数据\(String(describing: btn.titleLabel?.text))")
        if let closure:((String)->String) = viewClosure {
            closure(btn.titleLabel?.text! ?? "")
        }
        if delegate == nil {
        }else{
            self.delegate?.changeBackColor(backColor: UIColor.brown)
        }
        
        self.dismiss(animated: true, completion: nil)
      
      }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    deinit {
        print("jump释放")
    }
}
