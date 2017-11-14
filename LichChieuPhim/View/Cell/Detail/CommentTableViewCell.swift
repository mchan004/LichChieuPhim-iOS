//
//  CommentTableViewCell.swift
//  LichChieuPhim
//
//  Created by ThanhTu on 11/14/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import UIKit
import Cosmos

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var labelNoidung: UILabel!
    
    var comment: Comment? {
        didSet {
            if let dt = comment?.Name {
                labelName.text = dt + ":"
            }
            if let dt = comment?.DateCreate {
                labelTime.text = "(" + dt + ")"
            }
            if let dt = comment?.Rate {
                print(dt)
                if let d = Double(dt) {
                    rate.rating = d
                }
            }
            if let dt = comment?.Comment {
                labelNoidung.text = dt
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
