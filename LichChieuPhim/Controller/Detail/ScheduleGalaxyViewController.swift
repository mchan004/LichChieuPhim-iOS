//
//  ScheduleGalaxyViewController.swift
//  LichChieuPhim
//
//  Created by ThanhTu on 11/13/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import UIKit

class ScheduleGalaxyViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.delegate = self
        indicator.hidesWhenStopped = true
        if let linkGalaxy = Luu.movie?.Galaxy {
            if linkGalaxy != "null" {
                let uR = URLRequest(url: URL(string: HttpRequest().u + "phimdangchieu/lich_chieu_galaxy.php?link=" + linkGalaxy)!)
                webView.loadRequest(uR)
            } else {
                let alert = UIAlertController(title: nil, message: "Không có suất chiếu tại rạp này!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        indicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if navigationType == .linkClicked {
            
            guard let url = request.url else { return true }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return false
        }
        return true
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
