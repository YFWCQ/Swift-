//
//  YFTBDataSource.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/8.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFTBDataSource: YFTBBaseDataSource {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataModel.dataArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.dataModel.dataArray.count > indexPath.row{
            
            let model = self.dataModel.dataArray[indexPath.row] as! YFBaseCellModel
            
            let cell =  model.cellWithModel(model: model, tableView: tableView, indexPath: indexPath as NSIndexPath, currentVC: self.currentVC)
            
            return cell
        }
        let cell = UITableViewCell(style:.default, reuseIdentifier:"systemCell")
        
        return cell;
        
    }
    

    
}
