//
//  DetailNowShowingViewController.swift
//  LichChieuPhim
//
//  Created by ThanhTu on 11/7/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import UIKit

class DetailNowShowingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var movie:Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let userDefault = UserDefaults()
//        movie = userDefault.object(forKey: "MovieSelected") as? Movie
        movie = Luu.movie
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
    }
    
    
    
    
    
    
    
    /////////////
    //TableView//
    /////////////
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "row1", for: indexPath) as! Row1NowShowingTableViewCell
            cell.movie = movie
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "row2", for: indexPath) as! Row2NowShowingTableViewCell
            cell.movie = movie
            return cell
        }
    }
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
