//
//  TableVC.swift
//  CodeSwift
//
//  Created by mac on 2021/9/20.
//

import UIKit
import MJRefresh
class TableVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let sscan = UIScreen.main.scale
        createUI()
    }
    
    func createUI() {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y:64, width: ScreenWidth, height: ScreenHeigh-64))
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //
        tableView.mj_header = MJRefreshManager.headRefresh(pullText: "", releaseText: "", loadingText: "", timeText: "", tableView: tableView, callbackClosure: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                           tableView.mj_header?.endRefreshing()
                       }
        })
            
//            MJRefreshNormalHeader.init(refreshingBlock: {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                tableView.mj_header?.endRefreshing()
//            }
//        })
        tableView.tableFooterView = UIView.init(frame: .zero)
        
        
//        let cells = tableView.visibleCells
        
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

extension TableVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "SimpleCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? SimpleCell
        if cell == nil {
            cell = SimpleCell.init(style: .default, reuseIdentifier: cellId)
        }
        cell?.selectionStyle = .none
        cell?.setClosure {
            print("点击事件")
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击事件----")
    }
    
   
}
