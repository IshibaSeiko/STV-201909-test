//
//  CouponCell.swift
//  STVCoupon
//
//  Created by STV-M025 on 2019/09/21.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

class CouponCell: UITableViewCell {

    @IBOutlet weak var priceDownLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var expireLabel: UILabel!
    @IBOutlet weak var wishButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapWishButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let wish = UIImage(imageLiteralResourceName: "wish")
        let unwish = UIImage(imageLiteralResourceName: "unwish")
        
        if sender.isSelected {
            sender.setImage(unwish, for: UIControl.State.normal)
        } else {
            sender.setImage(wish, for: UIControl.State.normal)
        }
    }
    
    func setCell(couponData: couponTable) {
        priceDownLabel.text = "￥\(couponData.priceDown) OFF\nCOUPON"
        // TODO: localizable
        statusLabel.text = "有効期限"
        expireLabel.text = "\(couponData.fromExpire)~\(couponData.toExpire)"
        
    }
}
