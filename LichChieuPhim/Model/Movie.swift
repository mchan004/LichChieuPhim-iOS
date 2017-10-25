//
//  Movie.swift
//  LichChieuPhim
//
//  Created by Thanh Tu on 10/25/17.
//  Copyright © 2017 Thanh Tu. All rights reserved.
//

import Foundation

class Movie {
    
    var id, TenPhim, TheLoai, DaoDien, NhaSanXuat, DienVien, ThoiLuong, KhoiChieu, NoiDung, Rate, HinhAnh, Trailer, Galaxy, CGV, Lotte: String?
    
    init(id: String, TenPhim: String, TheLoai: String?, DaoDien: String?, NhaSanXuat: String?, DienVien: String?, ThoiLuong: String?, KhoiChieu: String?, NoiDung: String?, Rate: String?, HinhAnh: String?, Trailer: String?, Galaxy: String?, CGV: String?, Lotte: String?) {
        self.id = id
        self.TenPhim = TenPhim
        self.TheLoai = TheLoai
        self.DaoDien = DaoDien
        self.NhaSanXuat = NhaSanXuat
        self.DienVien = DienVien
        self.ThoiLuong = ThoiLuong
        self.KhoiChieu = KhoiChieu
        self.NoiDung = NoiDung
        self.Rate = Rate
        self.HinhAnh = HinhAnh
        self.Trailer = Trailer
        self.Galaxy = Galaxy
        self.CGV = CGV
        self.Lotte =  Lotte
    }
}