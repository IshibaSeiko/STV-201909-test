//
//  CouponStruct.swift
//  STVCoupon
//
//  Created by STV-M025 on 2019/09/21.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

struct CouponData: Codable {
    let returnCode: String
    let couponCount: Int
    let couponList: [Coupon]
}

struct Coupon: Codable {
    let couponID: String
    let priceDown: Int
    let fromExpire: String
    let toExpire: String
}

