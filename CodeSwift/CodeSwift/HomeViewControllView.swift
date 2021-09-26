//
//  HomeViewControllView.swift
//  CodeSwift
//
//  Created by mac on 2021/9/17.
//

import UIKit

class HomeViewControllView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 设置导航栏颜色为白色，并且去除导航栏下方的黑线
//        self.navigationController?.navigationBar.setBackgroundImage(imageFromColor(color: .blue, size: CGSize.init(width: ScreenWidth, height: 64)), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        self.title = "导航栏"
        self.view.backgroundColor = .white
        
//        self.view.backgroundColor = .brown
        
        let btn = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        btn.backgroundColor = .purple
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
    }
    @objc func btnClick(){
//        let vc = TableVC.init()
//        vc.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        let vc = ViewController.init()
//        vc.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(vc, animated: true)
        
        //test file create
        let fileManage = DLKFileManage.init()
        let path = NSHomeDirectory() + "/Library/dlkcache"
        
//       let createResult = fileManage.createFileDir(path: path)
//
//        if createResult {
//            print("创建成功")
//        }else{
//            print("失败")
//        }
        let removeResult = fileManage.removeFileDir(path: path)
        
        if removeResult {
            print("成功")
        }else{
            print("失败")
        }
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
