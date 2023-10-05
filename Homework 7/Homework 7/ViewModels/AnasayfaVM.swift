//
//  AnasayfaVM.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//


import Foundation
import RxSwift


class AnasayfaVM {
    
    var sRepo = StokRepository()
    var stokArray = BehaviorSubject<[Stok]>(value: [Stok]())
    
    
    
    init() {
        
        sRepo.veritabaniKopyala()
        stokArray = sRepo.stokArray
        
    }
    
    func search(searchName: String) {
        sRepo.searchStok(search_name: searchName)
    }
    
    func delete(stok_id:Int) {
        sRepo.deleteStok(student_id: stok_id)
        sRepo.loadStok()
    }
    
    func loadStok() {
        sRepo.loadStok()
    }
    
    
    
    
}

