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
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        movie = Luu.movie
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 44.0;
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(alertComment(_:)), name: Notification.Name.init(rawValue: "alertComment"), object: nil)

    }
    
    
    @objc func alertComment(_ notification: Notification) {
        let message = notification.object as! String
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    /////////////
    //TableView//
    /////////////
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "row1", for: indexPath) as! Row1NowShowingTableViewCell
            cell.movie = movie
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "row2", for: indexPath) as! Row2NowShowingTableViewCell
            cell.movie = movie
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "row3", for: indexPath) as! Row3NowShowingTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "row4", for: indexPath) as! Row4NowShowingTableViewCell
            
            return cell
        }
    }
    
    
    
    
    func showScheduleGalaxy(view: UIViewController) {
        
        view.performSegue(withIdentifier: "ScheduleGalaxy", sender: nil)
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
