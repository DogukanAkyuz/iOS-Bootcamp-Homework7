//
//  DetayVM.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//

import Foundation

class DetayVM {
    
    var sRepo = StokRepository()
    
    func update(urun_id:Int, urun_ad:String, urun_stok:String) {
        sRepo.updateStok(urun_id: urun_id, urun_ad: urun_ad, urun_stok: urun_stok)
    }
    
}
