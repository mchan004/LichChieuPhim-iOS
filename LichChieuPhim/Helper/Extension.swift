//
//  Extension.swift
//  LichChieuPhim
//
//  Created by Thanh Tu on 10/26/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import Foundation


extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: range.lowerBound)
        let idx2 = index(startIndex, offsetBy: range.upperBound)
        return String(self[idx1..<idx2])
    }
    var count: Int { return characters.count }
}       

