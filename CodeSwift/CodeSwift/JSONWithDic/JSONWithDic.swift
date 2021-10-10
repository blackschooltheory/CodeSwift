//
//  JSONWithDic.swift
//  CodeSwift
//
//  Created by mac on 2021/9/28.
//

import Foundation

func jsonToDic(jsonStr:String) -> [String:Any]? {
    guard let data = jsonStr.data(using: .utf8) else { return nil }
    let dic:[String:Any]? = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
    return dic
}


func dicToJson(dic:[String:Any]) -> String? {
    
    if !JSONSerialization.isValidJSONObject(dic) {
        //不是 对象
        return nil
    }
    
//    JSONSerialization.data(withJSONObject: <#T##Any#>, options: JSONSerialization.WritingOptions)
    guard let data =  try? JSONSerialization.data(withJSONObject: dic, options: []) else { return nil }
    let jsonStr = String.init(data: data, encoding: .utf8)
    return jsonStr
    
    
    
}
