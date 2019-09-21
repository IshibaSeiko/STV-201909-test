//
//  WillUseViewController.swift
//  STVCoupon
//
//  Created by STV-M025 on 2019/09/21.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

class WillUseViewController: UIViewController {

    @IBOutlet weak var offLabel: UILabel!
    
    @IBOutlet weak var buttonBackView: UIView!
    @IBOutlet weak var expireLabel: UILabel!
    
    @IBOutlet weak var guidLabel: UILabel!
    
    // lastCheck
    @IBOutlet weak var lastCheckView: UIView!
    @IBOutlet weak var usingExpireLabel: UILabel!
    @IBOutlet weak var usingGuidLabel: UILabel!
    
    // used
    @IBOutlet weak var usedView: UIView!
    @IBOutlet weak var usedDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guidLabel.text = NSLocalizedString("guidText", comment: "guidText")
        usingGuidLabel.text = NSLocalizedString("usingGuidText", comment: "usingGuidText")
        
        buttonBackView.isHidden = false
        lastCheckView.isHidden = true
        usedView.isHidden = true
    }
    
    func setLabel(data: Coupon) {
        offLabel.text = "￥\(data.priceDown) OFF\nCOUPON"
        expireLabel.text = "\(data.fromExpire)~\(data.toExpire)"
    }

    @IBAction func tapedUse(_ sender: UIButton) {
        buttonBackView.isHidden = true
        lastCheckView.isHidden = false
        usedView.isHidden = true
    }
    
    @IBAction func tapedUseCheck(_ sender: UIButton) {
        buttonBackView.isHidden = true
        lastCheckView.isHidden = true
        usedView.isHidden = false
    }
    
    @IBAction func tapedNoteUse(_ sender: UIButton) {
        buttonBackView.isHidden = false
        lastCheckView.isHidden = true
        usedView.isHidden = true
    }
    
    @IBAction func tapedCancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
