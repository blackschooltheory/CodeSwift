//
//  MJRefreshManager.swift
//  CodeSwift
//
//  Created by mac on 2021/9/20.
//

import UIKit
import MJRefresh

class MJRefreshManager: NSObject {
    //上拉刷新（自定义文字）
    static func headRefresh(pullText:String,releaseText:String,loadingText:String,timeText:String,tableView:UITableView,callbackClosure:@escaping ()->Void) -> MJRefreshNormalHeader{
        let head:MJRefreshNormalHeader = MJRefreshNormalHeader.init {
            callbackClosure()
        }
        head.setTitle("下拉刷新", for: .idle)
        head.setTitle("释放刷新", for: .pulling)
        head.setTitle("加载中...", for: .refreshing)
//        head.modifyLastUpdatedTimeText { (date) in
//            let dateForm = DateFormatter.init()
//            dateForm.dateFormat = "yyyy-MM-dd HH:mm:ss"
//            let dateStr = dateForm.string(from: date!)
//            return dateStr
//        }
//        head.lastUpdatedTimeLabel?.isHidden = true  隐藏上次更新时间
        return head
    }
    //上拉刷新（动画）
    
}
