//
//  Row3NowShowingTableViewCell.swift
//  LichChieuPhim
//
//  Created by ThanhTu on 11/12/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import UIKit

class Row3NowShowingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var buttonCGV: UIButton!
    @IBOutlet weak var buttonGalaxy: UIButton!
    @IBAction func actionCGV(_ sender: Any) {
        if let cgv = Luu.movie?.CGV {
            if cgv != "null" {
                UIApplication.shared.open(URL(string: cgv)!, options: [:], completionHandler: nil)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let image = UIImage(na)
        buttonCGV.setTitle("", for: .normal)
        buttonCGV.setImage(#imageLiteral(resourceName: "logocgv").withRenderingMode(.alwaysOriginal), for: .normal)
        
        buttonGalaxy.setTitle("", for: .normal)
        buttonGalaxy.setImage(#imageLiteral(resourceName: "logogalaxy").withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
