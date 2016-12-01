//
//  YFTBBaseDelegate.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFTBBaseDelegate: NSObject,UITableViewDelegate {

    weak var currentVC:YFBaseViewController!
    
    var dataModel:YFTBDataModel!
    
    required init(daModel:YFTBDataModel, VC:YFBaseViewController) {
        super.init()
        dataModel = daModel
        currentVC = VC
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.separatorInset = UIEdgeInsets.zero
        if #available(iOS 8.0, *) {
            cell.layoutMargins = UIEdgeInsets.zero
        } else {
            // Fallback on earlier versions
        }
    }
    //MARK:------PullingRefreshTableViewDelegate
    //Scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let refreshTableView:FYRefreshTableView = scrollView as? FYRefreshTableView {
            refreshTableView.tableViewDidScroll(scrollView)
        }
    }
    //停止拖拽
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let refreshTableView:FYRefreshTableView = scrollView as? FYRefreshTableView {
            refreshTableView.tableViewDidEndDragging(scrollView)
        }
    }

    
}
