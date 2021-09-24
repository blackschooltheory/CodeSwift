//
//  PXCommon.swift
//  CodeSwift
//
//  Created by mac on 2021/9/23.
//

import Foundation
import UIKit

// 设计稿的宽高
let DesignUIWidth = 750
let DesignUIHeight = 1334

//MARK:根据屏幕尺寸 @2 @3 设置大小
func ScalePXToPT(size:Float) -> Float {
    return size / Float(UIScreen.main.scale)
}

func ScreenWidthPXToPT(pxSize:Float) -> Float {
    return Float(Int(pxSize) * ScreenWidth / DesignUIWidth)
}


