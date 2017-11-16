//
//  Row1NowShowingTableViewCell.swift
//  LichChieuPhim
//
//  Created by ThanhTu on 11/7/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher
import FBSDKShareKit

class Row1NowShowingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    @IBOutlet weak var ratingStar: CosmosView!
    @IBOutlet weak var buttonShare: FBSDKShareButton!
    
    
    var movie: Movie? {
        didSet {
            labelTitle.text = movie?.TenPhim
            if let u = movie?.HinhAnh {
                if let url = URL(string: u) {
                    imageMovie.kf.setImage(with: url)
                }
            }
            let bodyString = NSMutableAttributedString(string: "")
            
            if let KC = movie?.KhoiChieu {
                let khoiChieu = NSMutableAttributedString(string: "Khởi chiếu: " + KC + "\n")
                
                khoiChieu.addAttribute(
                    NSAttributedStringKey.font,
                    value: UIFont(
                        name: "Arial-BoldMT",
                        size: 16)!,
                    range: NSRange(
                        location:0,
                        length:11))
                bodyString.append(khoiChieu)
            }
            
            if let dt = movie?.TheLoai {
                let str = NSMutableAttributedString(string: "Thể loại: " + dt + "\n")
                
                str.addAttribute(
                    NSAttributedStringKey.font,
                    value: UIFont(
                        name: "Arial-BoldMT",
                        size: 16)!,
                    range: NSRange(
                        location:0,
                        length:9))
                bodyString.append(str)
            }
            
            if let dt = movie?.DienVien {
                let str = NSMutableAttributedString(string: "Diễn viên: " + dt + "\n")
                
                str.addAttribute(
                    NSAttributedStringKey.font,
                    value: UIFont(
                        name: "Arial-BoldMT",
                        size: 16)!,
                    range: NSRange(
                        location:0,
                        length:10))
                bodyString.append(str)
            }
            labelBody.attributedText = bodyString
            
            if let dt = movie?.DaoDien {
                let str = NSMutableAttributedString(string: "Đạo diễn: " + dt + "\n")
                
                str.addAttribute(
                    NSAttributedStringKey.font,
                    value: UIFont(
                        name: "Arial-BoldMT",
                        size: 16)!,
                    range: NSRange(
                        location:0,
                        length:10))
                bodyString.append(str)
            }
            labelBody.attributedText = bodyString
            
            if let dt = movie?.NhaSanXuat {
                let str = NSMutableAttributedString(string: "Nhà sản xuất: " + dt + "\n")
                
                str.addAttribute(
                    NSAttributedStringKey.font,
                    value: UIFont(
                        name: "Arial-BoldMT",
                        size: 16)!,
                    range: NSRange(
                        location:0,
                        length:10))
                bodyString.append(str)
            }
            labelBody.attributedText = bodyString
            
            if let dt = movie?.ThoiLuong {
                let str = NSMutableAttributedString(string: "Thời lượng: " + dt + "\n")
                
                str.addAttribute(
                    NSAttributedStringKey.font,
                    value: UIFont(
                        name: "Arial-BoldMT",
                        size: 16)!,
                    range: NSRange(
                        location:0,
                        length:10))
                bodyString.append(str)
            }
            labelBody.attributedText = bodyString
            
            if let dt = movie?.Rate {
                if let i = Double(dt) {
                    ratingStar.rating = i
                }
            }
            
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let image = imageMovie.image
        let photo = FBSDKSharePhoto.init()
        photo.image = image
        photo.isUserGenerated = true
        let content = FBSDKSharePhotoContent.init()
        content.photos = [photo]
        buttonShare.shareContent = content
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
