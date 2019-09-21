//
//  ViewController.swift
//  STVCoupon
//
//  Created by STV-M025 on 2019/09/21.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var couponListData: [Coupon] = []
    var couponDataBase: [couponTable] = []
    let couponDBData = CouponDBData()
    
    @IBOutlet weak var couponListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        couponDBData.makeTable()
        
        couponDataBase = couponDBData.getCouponData()
        
        couponListTableView.delegate = self
        couponListTableView.dataSource = self
        
        couponListTableView.rowHeight = UITableView.automaticDimension
        
        let couponAPI = CouponAPI()
        couponAPI.delegate = self
        
        couponAPI.requestAlamofire()
    }
    
}

extension ListViewController: CouponAPIDelegate {
    func getResponse(couponData: CouponData) {
        print(couponData)
        
        couponDBData.saveCouponData(couponList: couponData.couponList)
        couponDataBase = couponDBData.getCouponData()
        
        couponListTableView.reloadData()
    }
}

 extension ListViewController: UITableViewDataSource {
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return couponDataBase.count != 0 ? couponDataBase.count : 1
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if couponDataBase.count != 0 {
        tableView.register(UINib(nibName: "CouponCell", bundle: nil), forCellReuseIdentifier: "CouponCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CouponCell", for: indexPath)
        
        guard let couponCell = cell as? CouponCell else { return cell }
        couponCell.setCell(couponData: couponDataBase[indexPath.row])
        
        return couponCell
    }
    
    tableView.register(UINib(nibName: "NothingCouponCell", bundle: nil), forCellReuseIdentifier: "NothingCouponCell")
    let cell = tableView.dequeueReusableCell(withIdentifier: "NothingCouponCell", for: indexPath)
    return cell
 }
 
 
 }
 
 extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height = couponListTableView.frame.size.height / 2
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "WillUseViewController", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "WillUseViewController")
        self.present(nextView, animated: true, completion: nil)
    }
 }

