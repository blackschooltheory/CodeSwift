//
//  DLKFileManage.swift
//  CodeSwift
//
//  Created by mac on 2021/9/27.
//

import UIKit

class DLKFileManage: NSObject {
   
    var fileManage = FileManager.default
    
    
    
    func createFileDir(path:String?) -> Bool {
        if path == nil  {
            return false
        }
     let result = try? fileManage.createDirectory(atPath: path!, withIntermediateDirectories: true, attributes: nil)
        
        if result != nil {
            return true
        }
        return false
    }
    
    func removeFileDir(path:String?) -> Bool {
        if path == nil  {
            return false
        }
        let result = try? fileManage.removeItem(atPath: path!)
        if result != nil {
            return true
        }
        return false
    }
    
    func createFile(path:String?) -> Bool {
        if path == nil  {
            return false
        }
        return fileManage.createFile(atPath:path!, contents: Data.init(base64Encoded: "胆囊结石难分难舍年时间单刷"), attributes: [:])
    }
    
    
    
}
