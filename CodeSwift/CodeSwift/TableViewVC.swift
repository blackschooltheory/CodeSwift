//
//  TableViewVC.swift
//  CodeSwift
//
//  Created by mac on 2021/9/16.
//

import UIKit


class TableViewVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tableView:UITableView = UITableView.init(frame: CGRect.init(x: 0, y: NavHeight, width: ScreenWidth, height: ScreenHeigh - NavHeight), style: .plain)
        self.view.addSubview(tableView)
//        tableView.tableHeaderView
        
        
        
    }
    
//    func tableHeadView()->UIView {
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
