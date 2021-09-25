//
//  NavControllerManager.swift
//  CodeSwift
//
//  Created by mac on 2021/9/22.
//

import UIKit

class NavControllerManager: NSObject {
    
    //MARK:设置导航栏文字大小，颜色
    func setTextProperty(target:UINavigationController) {
        // 方法一 设置title 的属性来修改
        var titleAttributes:[NSAttributedString.Key:Any] = [:]
        titleAttributes[.foregroundColor] = UIColor.blue
        titleAttributes[.font] = UIFont.systemFont(ofSize:20)
        target.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        /* 方法二 设置一个view 替换原本的titleLabel
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 44))
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .blue
        target.navigationItem.titleView = titleLabel
         */
    }
    // MARK:去除导航栏底部黑线
    func removeBottomLine(target:UINavigationController) {
        target.navigationController?.navigationBar.shadowImage = UIImage.init()
    }
    
    //MARK:设置背景图片
    func backImage(target:UINavigationController,backImage:UIImage) {
        /*
         这个涉及到 屏幕方向
         target.navigationBar.setBackgroundImage(backImage, for: .any, barMetrics: .compact)
         */
        target.navigationBar.setBackgroundImage(backImage, for: .default)
    }
    
    //MARK:根据颜色设置背景图片
    func backImageWithColor(target:UINavigationController, color:UIColor,size:CGSize) {
        //通过，颜色生成图片
        let image = ImageFromColorSize(color: color, size: size)
        target.navigationBar.setBackgroundImage(image, for: .default)
    }
    //MARK:导航栏渐变颜色
    
    
    //MARK:导航栏动画效果
    
    
}
