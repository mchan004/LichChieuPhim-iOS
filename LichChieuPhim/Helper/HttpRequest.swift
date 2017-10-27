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
}
