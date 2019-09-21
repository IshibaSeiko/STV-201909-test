//
//  CouponTable.swift
//  STVCoupon
//
//  Created by STV-M025 on 2019/09/21.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit
import RealmSwift

class couponTable: Object {
    @objc dynamic var couponID: String = ""       // ID
    @objc dynamic var priceDown: Int = 0
    @objc dynamic var usedFlg: Bool = false       // 利用状況
    @objc dynamic var wishStatusFlg: Bool = false    // いいねステータス
    @objc dynamic var fromExpire: String = ""    // 有効期限開始日
    @objc dynamic var toExpire: String = ""   // 有効期限終了日
    
    // idをプライマリキーに設定
    override static func primaryKey() -> String? {
        return "couponID"
    }
}

