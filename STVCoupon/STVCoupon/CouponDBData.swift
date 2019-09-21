//
//  CouponDBData.swift
//  STVCoupon
//
//  Created by STV-M025 on 2019/09/21.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit
import RealmSwift


var realm: Realm!
var dataList = [] as! [Results<couponTable>]

class CouponDBData: NSObject {
    
    func makeTable() {
        do {
            // realmのインスタンスを生成
            realm = try Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            
        } catch let error {
            print(error)
        }
    }
    
    // realmにデータを保存
    func saveCouponData(couponList: [Coupon]) {
        
        var addData:[couponTable] = []
        

    
        for coupon in couponList {
            let couponColum = couponTable()
            couponColum.couponID = coupon.couponID
            couponColum.priceDown = coupon.priceDown
            couponColum.usedFlg = false
            couponColum.wishStatusFlg = false
            couponColum.fromExpire = coupon.fromExpire
            couponColum.toExpire = coupon.toExpire
            
            addData.append(couponColum)
        }
        
        try! realm.write {
            realm.add(addData)
        }
    }
    
    func getCouponData() -> [couponTable] {
        let object = realm.objects(couponTable.self)
        return Array(object)
    }
 
    
}
/*

extension String {
    func dateOfStringFormatter(string: String) -> String {
        let format = "yyyy/MM/dd"
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        guard let date = formatter.date(from: string) else { return "" }
        
//        let format = "yyyy/MM/dd HH:mm:ss"
//        let formatter: DateFormatter = DateFormatter()
//        formatter.calendar = Calendar(identifier: .gregorian)
//        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

*/
