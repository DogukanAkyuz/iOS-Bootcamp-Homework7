//
//  KayitVM.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//


import Foundation


class KayitVM {
    
    var sRepo = StokRepository()
    
    func kayit(urun_ad: String, urun_stok: String) {
        sRepo.saveStok(urun_ad: urun_ad, urun_stok: urun_stok)
    }
    
    
    
}
import Foundation
