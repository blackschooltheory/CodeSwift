//
//  HomeViewControllView.swift
//  CodeSwift
//
//  Created by mac on 2021/9/17.
//

import UIKit

class HomeViewControllView: UIViewController, UIDragInteractionDelegate, UIDropInteractionDelegate {
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        
        let provider = NSItemProvider.init(object: "this is item" as NSItemProviderWriting)
        let dragItem = UIDragItem.init(itemProvider: provider)
        return [dragItem]
        
    }
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return true
    }
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal.init(operation: .copy)
    }

    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        for item in session.items {
                let itemProvider = item.itemProvider
                guard itemProvider.canLoadObject(ofClass: String.self)
                else {continue}

                itemProvider.loadObject(ofClass: String.self, completionHandler: { (object, error) in
                    print("哈哈哈")
                    if let str = object as? String {
                        print(str)
//                        DispatchQueue.main.async {
//                            self.imageView.image = image
//                        }
                    }
                })
            }
    }

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
        
        
        let view = UIView.init(frame: CGRect.init(x: 100, y: 300, width: 100, height: 100))
        view.backgroundColor = .purple
        
        self.view.addSubview(view)
        
        let dragAction = UIDragInteraction.init(delegate: self)
        dragAction.isEnabled = true
        view.addInteraction(dragAction)
        
        
        
        let label = UILabel.init(frame: CGRect.init(x: 100, y: 500, width: 300, height: 150))
        label.text = "label"
        label.backgroundColor = .brown
        label.isUserInteractionEnabled = true
        self.view.addSubview(label)
        
        let dropAction = UIDropInteraction.init(delegate: self)
    
        label.addInteraction(dropAction)
        
        
        
        
        
        
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
