//
//  YFTBSectionDelegate.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFTBSectionDelegate: YFTBBaseDelegate {

    //MARK:高度
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.dataModel.dataArray.count > indexPath.section{
            if let sectionModel:YFTBSectionModel = self.dataModel.dataArray[indexPath.section] as? YFTBSectionModel{
            if sectionModel.dataArray.count > indexPath.row{
                if let model = sectionModel.dataArray[indexPath.row] as? YFBaseCellModel{
                return model.cellHeight
                }
               }
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.dataModel.dataArray.count > indexPath.section{
            if let sectionModel:YFTBSectionModel = self.dataModel.dataArray[indexPath.section] as? YFTBSectionModel{
                if sectionModel.dataArray.count > indexPath.row{
                    if  let model = sectionModel.dataArray[indexPath.row] as? YFBaseCellModel{
                        model.tableView(tableView: tableView, didSelectRowAtIndexPath: indexPath as NSIndexPath,modelViewController: currentVC)
                    }
                }
            }
         }
    }
}
