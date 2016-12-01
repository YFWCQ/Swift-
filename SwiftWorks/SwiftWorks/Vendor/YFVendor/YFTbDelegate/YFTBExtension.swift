//
//  YFTBExtension.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/8.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

extension NSObject{
    
    private struct YFTBDelegateKeys {
        static var YFTBDelegateKey = "YFTBDelegateKey"
        static var YFTBDataSourceKey = "YFTBDataSourceKey"
        static var YFTBDataModelKey = "YFTBDataModelKey"

    }
    
    var tbDeleagteYF:YFTBBaseDelegate!{
        get{
            return objc_getAssociatedObject(self, &YFTBDelegateKeys.YFTBDelegateKey) as? YFTBBaseDelegate
        }
        set{
            if tbDeleagteYF != newValue {
                if let nnValue = newValue {
                    // 存储新的
                    willChangeValue(forKey: "tbDeleagteYF")
                    objc_setAssociatedObject(self, &YFTBDelegateKeys.YFTBDelegateKey, nnValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    didChangeValue(forKey: "tbDeleagteYF")

                }
            }
        }
    }
    
    var tbDataSouce:YFTBBaseDataSource!{
        get{
            return objc_getAssociatedObject(self, &YFTBDelegateKeys.YFTBDataSourceKey) as? YFTBBaseDataSource
 
        }
        set{
            if tbDataSouce != newValue {
                if let nnValue = newValue {
                    // 存储新的
                    willChangeValue(forKey: "tbDataSouce")
                    objc_setAssociatedObject(self, &YFTBDelegateKeys.YFTBDataSourceKey, nnValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    didChangeValue(forKey: "tbDataSouce")
                    
                }
            }
        }
    }
    
    var dataModelYF:YFTBDataModel! {
        get{
            return objc_getAssociatedObject(self, &YFTBDelegateKeys.YFTBDataModelKey) as? YFTBDataModel
        }
        set{
            if dataModelYF != newValue {
                if let nnValue = newValue {
                    // 存储新的
                    willChangeValue(forKey: "dataModelYF")
                    objc_setAssociatedObject(self, &YFTBDelegateKeys.YFTBDataModelKey, nnValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    didChangeValue(forKey: "dataModelYF")
                }
            }

        }
    }
}

func setTBDelegateOfSingleSection(toObject:NSObject,tableView:UITableView,currentVC:YFBaseViewController!){
    
    toObject.dataModelYF = YFTBDataModel()
    
    toObject.tbDeleagteYF = YFTBDelegate(daModel: toObject.dataModelYF, VC: currentVC)
    toObject.tbDataSouce = YFTBDataSource(daModel: toObject.dataModelYF, VC: currentVC)
    
    tableView.delegate = toObject.tbDeleagteYF
    tableView.dataSource = toObject.tbDataSouce
    
}

func setTBDelegateOfSections(toObject:NSObject,tableView:UITableView,currentVC:YFBaseViewController!){
    
    toObject.dataModelYF = YFTBDataModel()
    
    toObject.tbDeleagteYF = YFTBSectionDelegate(daModel: toObject.dataModelYF, VC: currentVC)
    toObject.tbDataSouce = YFTBSectionDataSource(daModel: toObject.dataModelYF, VC: currentVC)
    
    tableView.delegate = toObject.tbDeleagteYF
    tableView.dataSource = toObject.tbDataSouce
    
}














