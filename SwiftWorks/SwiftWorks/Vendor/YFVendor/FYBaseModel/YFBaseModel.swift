//
//  YFBaseModel.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFBaseModel: NSObject {

    override init() {
        super.init()
    }
    
    init(dicNS:NSDictionary){
        super.init()
        self .setValuesForKeys(dicNS as! [String : AnyObject])
    }
    required  init(dic:[String:AnyObject]){
        super.init()
        self .setValuesForKeys(dic)
    }
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("Undefined Key:" + key + "in")
        print(self.classForCoder)
    }
    
    func setHandleModel_FY(handle:YFBaseHandle){
        
    }

}
