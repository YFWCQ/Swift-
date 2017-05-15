//
//  YFBaseCellModel.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFBaseCellModel: YFBaseModel {

    weak var currentVC:YFBaseViewController!

    
    var cellClass:AnyClass!
    var cellHeight:CGFloat = 0.0
    var cellIdentifier:String?
    var didSelectCellBlock:(()->())!
    
    required init(dic: [String : AnyObject]) {
        super.init(dic: dic)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath ,modelViewController:YFBaseViewController) {
        
    }
    
    func bindModel(baseCell:YFBaseCell,indexPath:NSIndexPath)
    {
        
    }
    
    func cellWithModel(model:YFBaseCellModel,tableView:UITableView,indexPath:NSIndexPath,currentVC:YFBaseViewController)->YFBaseCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier!) as? YFBaseCell
        if cell == nil
        {
            if self.cellClass != nil {
                 let _: YFBaseCell.Type = cellClass as! YFBaseCell.Type
                
//                 let classCell = cellClassType(style: .plain, reuseIdentifier: self.cellIdentifier)
//                
//                if classSubCell = classCell as? YFBaseCell {
//                    cell  = classSubCell
//                }
//                    cell = cellClassType(style: .plain, reuseIdentifier: model.cellIdentifier)
                
            }else{
                if let cellArray = (Bundle.main.loadNibNamed(model.cellIdentifier!, owner: nil, options: nil) as AnyObject) as? [YFBaseCell]{
                    cell = cellArray[0]
                }

            }
    }
        model.currentVC = currentVC
        model.bindModel(baseCell: cell!, indexPath: indexPath)
        return cell!
    }

}
