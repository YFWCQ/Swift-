//
//  YFTestCellModel.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/8.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFTestCellModel: YFBaseCellModel {

    var title:String = "33003030303"
    
    required init(dic: [String : AnyObject]) {
        super.init(dic: dic)
        self.cellIdentifier = "YFTestCell"
        self.cellHeight = 45.0
        self.cellClass = YFTestCell.classForCoder()
    }
    
    override func bindModel(baseCell: YFBaseCell, indexPath: NSIndexPath) {
        
        baseCell.textLabel?.text = title
        baseCell.backgroundColor = UIColor.red
        
    }
}
