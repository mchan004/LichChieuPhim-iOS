//
//  Row2NowShowingTableViewCell.swift
//  LichChieuPhim
//
//  Created by ThanhTu on 11/8/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import UIKit
import YouTubePlayer

class Row2NowShowingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelNoiDung: UILabel!
    @IBOutlet weak var ytb: YouTubePlayerView!
    
    var movie: Movie? {
        didSet {
            if let dt = movie?.NoiDung {
                labelNoiDung.text = dt
            }
            
            if let dt = movie?.Trailer {
                ytb.loadVideoID(dt)
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
