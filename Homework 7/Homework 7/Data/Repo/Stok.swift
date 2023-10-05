//
//  Stok.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//

import Foundation


class Stok {
    
    var urun_id: Int?
    var urun_ad: String?
    var urun_stok: String?
    
    init() {
    }
    
    init(urun_id: Int, urun_ad: String, urun_stok: String) {
        self.urun_id = urun_id
        self.urun_ad = urun_ad
        self.urun_stok = urun_stok
    }
}
