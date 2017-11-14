//
//  ScheduleCollectionViewCell.swift
//  LichChieuPhim
//
//  Created by ThanhTu on 11/12/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let uR = URLRequest(url: URL(string: "https://google.com")!)
        webView.loadRequest(uR)
        
        
    }
}
