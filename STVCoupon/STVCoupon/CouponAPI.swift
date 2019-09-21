//
//  CouponAPI.swift
//  STVCoupon
//
//  Created by STV-M025 on 2019/09/21.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit
import Alamofire

protocol CouponAPIDelegate: class {
    func getResponse(couponData: CouponData)
}

struct Constant {
    static let requestURL = "https://st-ventures.mocklab.io/couponList"
}

enum Result<T, Error> {
    case success(T)
    case failed(Error)
}

enum Error {
    case error
}

class CouponAPI: NSObject {
    weak var delegate: CouponAPIDelegate?
    
    func requestAlamofire() {
        
        Alamofire.request(Constant.requestURL, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                guard let responseData = try? JSONDecoder().decode(CouponData.self, from: data) else { return }
                self.delegate?.getResponse(couponData: responseData)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
