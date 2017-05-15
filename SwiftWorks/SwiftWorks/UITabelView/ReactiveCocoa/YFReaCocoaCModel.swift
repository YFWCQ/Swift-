//
//  YFReaCocoaCModel.swift
//  SwiftWorks
//
//  Created by FYWCQ on 2017/5/15.
//  Copyright © 2017年 Medalands. All rights reserved.
//

import UIKit

class YFReaCocoaCModel: YFBaseCellModel {

    var title:String = "33003030303"
    
    required init(dic: [String : AnyObject]) {
        super.init(dic: dic)
        self.cellIdentifier = "YFReaCocoaCell"
        self.cellHeight = 45.0
        //        self.cellClass = YFTestCell.classForCoder()
    }
    
    override func bindModel(baseCell: YFBaseCell, indexPath: NSIndexPath) {
        
        baseCell.textLabel?.text = title
        baseCell.backgroundColor = UIColor.red
        
    }

}
