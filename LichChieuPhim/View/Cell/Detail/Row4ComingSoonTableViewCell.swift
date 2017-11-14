//
//  Row4NowShowingTableViewCell.swift
//  LichChieuPhim
//
//  Created by ThanhTu on 11/13/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import UIKit
import Cosmos

class Row4ComingSoonTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var buttonSend: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightOfTableView: NSLayoutConstraint!
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textComment: UITextView!
    @IBOutlet weak var rating: CosmosView!
    
    @IBAction func actionSend(_ sender: Any) {
        guard let name = textName.text, let email = textEmail.text, let comment = textComment.text else {
            return
        }
        
        if name.count < 2 || name.count > 30 || email.count < 3 || email.count > 40 || rating.rating <= 0 || rating.rating > 5 || comment.count < 2 || comment.count > 200 {
            return
        }
        
        HttpRequest().postCommentComingSoon(comment: comment, email: email, name: name, rating: rating.rating) { (data) in
            NotificationCenter.default.post(name: Notification.Name.init(rawValue: "alertCommentComingSoon"), object: data as String)
            DispatchQueue.main.async {
                self.textEmail.text = ""
                self.textName.text = ""
                self.textComment.text = ""
            }
            
        }
    }
    
    var comments: [Comment] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
        
        
    }
    
    
    ////////////
    //Function//
    ////////////
    func setupView() {
        buttonSend.clipsToBounds = true
        buttonSend.layer.borderWidth = 1
        buttonSend.layer.cornerRadius = 7
        buttonSend.layer.borderColor = #colorLiteral(red: 0.008156814612, green: 0.474562645, blue: 0.9896933436, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if let idPhim = Luu.movie?.id {
            HttpRequest().getCommentComingSoon(idPhim: idPhim) { (data) in
                self.comments = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    if data.count > 5 {
                        self.heightOfTableView.constant = 400
                    } else {
                        self.heightOfTableView.constant = CGFloat(80 * data.count)
                    }
                }
            }
        }
    }
    
    
    
    
    
    /////////////
    //TableView//
    /////////////
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CommentTableViewCell", owner: self, options: nil)?.first as! CommentTableViewCell
        cell.comment = comments[indexPath.row]
        
        return cell
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

