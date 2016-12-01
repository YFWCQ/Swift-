//
//  YFTBSectionDataSource.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFTBSectionDataSource: YFTBBaseDataSource {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataModel.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dataModel.dataArray.count > section{
            if let sectionModel = self.dataModel.dataArray[section] as? YFTBSectionModel{
            return sectionModel.dataArray.count
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.dataModel.dataArray.count > indexPath.section{
            
            if let sectionModel:YFTBSectionModel = self.dataModel.dataArray[indexPath.section] as? YFTBSectionModel{
                if sectionModel.dataArray.count > indexPath.row {
                    let model = sectionModel.dataArray[indexPath.row] as! YFBaseCellModel
                    
                    let cell =  model.cellWithModel(model: model, tableView: tableView, indexPath: indexPath as NSIndexPath, currentVC: self.currentVC)
                    return cell
                }
            }
        }
        let cell = UITableViewCell(style:.default, reuseIdentifier:"systemCell")
        
        return cell;
        
    }

}
