//
//  HandyJsonManage.swift
//  CodeSwift
//
//  Created by mac on 2021/9/22.
//

import UIKit
import HandyJSON
struct testModel:HandyJSON {
    var one:String?
    var name:String?
    var age:String?
    var user:User? //MARK:嵌套的对象模型
}
//
struct User:HandyJSON {
    var name:String?
    var sex:String?
    
}


class HandyJsonManage: NSObject {
    
    //MARK: 返回的数据源 如何使用
    func resolveData() {
        
        // 之前的方式是获取到的 data数据先转换成dic 对象然后在一个个处理解析
        
        let respondData:Data = Data.init(base64Encoded: "eqrewrwetwe0")!
        let dicJson = try? JSONSerialization.jsonObject(with: respondData, options: .mutableContainers)
      
        //MARK:将json字符串直接转化为 testModel 的模型数据
//        let model = JSONDeserializer<testModel>.deserializeFrom(json: "xxxx")
//        model?.age
        let dataArr:[String:Any] = [:]
        //designatedPath 设置方法是具体取所有数据源中的那个层级下的模型
        let model = JSONDeserializer<testModel>.deserializeFrom(dict: dataArr, designatedPath: "data.user")

        dicToModel(dic: dicJson as! [String:Any], structName: "jsonModel")
    }
    //MARK:自动打印模型的表单
    func dicToModel(dic:[String:Any],structName:String) {
        var arrOrDic:[String:Any] = [:]
        print("struct \(structName):HandyJSON{")
        for (key,value) in dic {
            if value is Dictionary<String, Any> {
                arrOrDic[key] = value
                print("var \(key):[\(key)]?")
            }else if value is Array<Any> {
                let arryModel:[Any] = value as! [Any]
                
                arrOrDic[key] = arryModel[0]
                print("var \(key):[\(key)]?")
            }else{
                print("var \(key):String?")
            }
        }
        print("}")
        for (key,value) in arrOrDic {
            let model:[String:Any] =  value as! [String:Any]
            dicToModel(dic: model, structName: key)
        }
    }
    
    
    
}
