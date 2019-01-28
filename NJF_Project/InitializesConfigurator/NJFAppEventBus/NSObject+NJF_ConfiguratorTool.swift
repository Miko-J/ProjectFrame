//
//  NSObject+NJF_ConfiguratorTool.swift
//  NJF_Project
//
//  Created by niujf on 2019/1/28.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

import UIKit

class NSObject_NJF_ConfiguratorTool: NSObject {

}

@objc public extension NSObject {
    func safeSetValuesForKeys(_ dict:Dictionary<String,Any>)  {
        for key in dict.keys {
            
            let selectorStr = "set" + key.prefix(1).capitalized + key.suffix(from: key.index(key.startIndex, offsetBy: 1)) + ":"
            let selector = NSSelectorFromString(selectorStr)
            
            if (self.responds(to: selector)) {
                self.perform(selector, with: dict[key])
            }
            else {
                assert(false, self.description + "没有" + key + "属性"  + "，请检查!")
            }
        }
    }
    
    public func dict(plist:String) -> Dictionary<String,Any> {
        
        let plistName = NSString.init(string: plist).deletingPathExtension;
        
        if let fileURL = Bundle.main.url(forResource: plistName, withExtension: "plist") ?? Bundle.init(for: self.classForCoder).url(forResource: plistName, withExtension: "plist"){
            var isDir: ObjCBool = false
            
            if ((FileManager.default.fileExists(atPath: fileURL.path, isDirectory: &isDir)) && isDir.boolValue == false) {
                print(fileURL);
                
                do {
                    let data = try Data.init(contentsOf: fileURL, options: .mappedIfSafe)
                    
                    guard let datasourceDictionary = try PropertyListSerialization.propertyList(from: data , options: [], format: nil) as? [String:Any] else{
                        return [String:Any]()
                    }
                    
                    return datasourceDictionary;
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        return [String:Any]()
    }
}
