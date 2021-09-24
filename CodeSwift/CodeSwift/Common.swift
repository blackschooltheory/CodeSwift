//
//  Common.swift
//  CodeSwift
//
//  Created by mac on 2021/9/16.
//

import Foundation
import UIKit

let ScreenWidth = Int(UIScreen.main.bounds.size.width)
let ScreenHeigh = Int(UIScreen.main.bounds.size.height)
let NavHeight = isIphoneX() ? 88 : 64


//判断是否是IphoneX
func IsIphoneX()->Bool{
    var iphoneX = false
    if UIDevice.current.userInterfaceIdiom != .phone {
        //不是iPhone的情况 直接返回 false
        return false
    }
    if #available(iOS 11.0, *) {
        let window:UIWindow = (UIApplication.shared.delegate?.window!!)!
        if window.safeAreaInsets.bottom > 0 {
            iphoneX = true
            // 当有安全区域时，说明是iPhoneX 以上的全面屏
        }
    }
    return iphoneX
}

//颜色转换成图片
func ImageFromColorSize(color:UIColor,size:CGSize) -> UIImage {
    //设置frame大小
    let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
    //根据尺寸设置图片上下文
    UIGraphicsBeginImageContext(size)
    //
    let context:CGContext = UIGraphicsGetCurrentContext()!
    context.setFillColor(color.cgColor)
    context.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsGetCurrentContext()
    return image!
}

//设置导航栏颜色


