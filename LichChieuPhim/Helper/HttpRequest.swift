//
//  HttpRequest.swift
//  LichChieuPhim
//
//  Created by Thanh Tu on 10/25/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import Foundation
import Alamofire

class HttpRequest {
    let u = "https://dvmaytinh.com/LichChieuPhim/"
    
    func getNowShowing(completionHandler: @escaping (_ movies: [Movie]) -> Void) {
        Alamofire.request(u + "phimdangchieu/phim_dang_chieu.php").response { response in
            guard let data = response.data else { return }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completionHandler(movies)
            } catch let jsonErr {
                print("Json Err: ", jsonErr)
            }
        }
    }
    
    func getComingSoon(completionHandler: @escaping (_ movies: [Movie]) -> Void) {
        Alamofire.request(u + "phimsapchieu/phim_sap_chieu.php").response { response in
            guard let data = response.data else { return }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completionHandler(movies)
            } catch let jsonErr {
                print("Json Err: ", jsonErr)
            }
        }
    }
    
    func getComming(idPhim: String ,completionHandler: @escaping (_ movies: [Comment]) -> Void) {
        Alamofire.request(u + "phimdangchieu/comment.php?id=" + idPhim).response { response in
            guard let data = response.data else { return }
            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                completionHandler(comments)
            } catch let jsonErr {
                print("Json Err: ", jsonErr)
            }
        }
    }
    
    func postComment(comment: String, email: String, name: String, rating: Double, completionHandler: @escaping (_ str: String) -> Void) {
        guard let tenPhim = Luu.movie?.TenPhim else {
            return
        }
        
        let parameters: Parameters = [
            "id": tenPhim,
            "Name": name,
            "Email": email,
            "Comment": comment,
            "Rate": rating
        ]
        
        Alamofire.request(u + "phimdangchieu/comment_POST.php", method: .post, parameters: parameters).response { response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                completionHandler(utf8Text)
                
            }
        }
        ///phimdangchieu/comment_POST.php
    }
}
