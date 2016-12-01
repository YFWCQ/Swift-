//
//  CCBlockModel.swift
//  SwiftWorks
//
//  Created by Medalands on 15/4/28.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

import UIKit

class CCBlockModel: NSObject {
    override init() {
        
        super.init()
        
        //        var a = 1
    }
    var block:((String)->(Bool))!
    
    var sss:String!
    
    
    let kFYHttpTimeoutInterval:CGFloat = 20.0
    var host:String!
    var port:String?
    var path:String?
    var paramDic:NSMutableDictionary!

    var callBackSuccess:(()->())!

    
    
    func initPath(_ host:String,port:String,path:String) -> CCBlockModel{
        let param:CCBlockModel = CCBlockModel()
        param.sss = host
        param.host = "13"
        return param
    }
//    func block(s1:String) ->Bool{
//      
//    print("%@",s1)
//        
//    return false

    
   
}
