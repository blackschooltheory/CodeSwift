//
//  PXCommon.swift
//  CodeSwift
//
//  Created by mac on 2021/9/23.
//

import Foundation
import UIKit

// 设计稿的宽高 px
let DesignUIWidth = 750
let DesignUIHeight = 1334

//MARK:根据屏幕倍图 @2 @3 设置大小
func ScalePXToPT(size:Float) -> Float {
    return size / Float(UIScreen.main.scale)
}
//按照屏幕尺寸缩放设计
func ScreenWidthPXToPT(pxSize:Float) -> CGFloat {
    return CGFloat(Int(pxSize) * ScreenWidth / DesignUIWidth)
}
// px 直接转化成pt (默认设计稿都是@2 图；所以pt = px/2)
func DLKWith(size:Float) -> CGFloat {
    return CGFloat(size/2.0)
}
//MARK:按照ipad 与iPhone的不同来设计屏幕尺寸
func ChangeWidth(size:Float) -> CGFloat {
    if UIDevice.current.userInterfaceIdiom == .pad {
        // ipad
        return DLKWith(size: size)
    }
    //其他 iphone
    
    return ScreenWidthPXToPT(pxSize: size)
}


