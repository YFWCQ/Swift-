//
//  YFTBDelegate.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFTBDelegate: YFTBBaseDelegate {

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if self.dataModel.dataArray.count > indexPath.row {
            let model = self.dataModel.dataArray[indexPath.row] as! YFBaseCellModel
            return model.cellHeight
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.dataModel.dataArray.count > indexPath.row{
            
            let model = dataModel.dataArray[indexPath.row]
            
            if model.isKind(of: YFBaseCellModel.classForCoder()){
                let cellModel = model as! YFBaseCellModel
                cellModel.tableView(tableView: tableView, didSelectRowAtIndexPath: indexPath as NSIndexPath,modelViewController: currentVC)
            }
        }

    }
    
}
