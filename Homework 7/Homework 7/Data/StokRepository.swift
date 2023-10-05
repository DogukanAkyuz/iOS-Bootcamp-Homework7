//
//  StokRepository.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//

import Foundation
import RxSwift

class StokRepository {
    
    var stokArray = BehaviorSubject<[Stok]>(value: [Stok]())
    
    let db:FMDatabase?
    
    init() {
        
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databeseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("StokDB.db")
        
        db = FMDatabase(path: databeseURL.path)
        
    }
    
    
    func saveStok(urun_ad: String, urun_stok: String) {
        
        db?.open()
        
        do {
            
            try db!.executeUpdate("INSERT INTO STOK (urun_ad,urun_stok) VALUES (?,?)", values: [urun_ad,urun_stok])
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func updateStok(urun_id: Int,urun_ad: String, urun_stok: String) {
        
        
        db?.open()
        
        do {
            
            try db!.executeUpdate("UPDATE STOK SET urun_ad=?, urun_stok=? WHERE urun_id=?", values: [urun_ad,urun_stok,urun_id])
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func searchStok(search_name: String) {
        
        db?.open()
        var array = [Stok]()
        do {
            let rs = try db!.executeQuery("SELECT * FROM STOK WHERE urun_ad like '%\(search_name)%'", values: nil)
            
            while rs.next() {
                let urun_id = Int(rs.string(forColumn: "urun_id"))!
                let urun_ad = rs.string(forColumn: "urun_ad")!
                let urun_stok = rs.string(forColumn: "urun_stok")!
                
                let urun = Stok(urun_id: urun_id, urun_ad: urun_ad, urun_stok: urun_stok)
                
                array.append(urun)
            }
            stokArray.onNext(array)
            
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func deleteStok(student_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM STOK WHERE urun_id=?", values: nil)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func loadStok() {
        db?.open()
        var array = [Stok]()
        do {
            let rs = try db!.executeQuery("SELECT * FROM STOK", values: nil)
            
            while rs.next() {
                let urun_id = Int(rs.string(forColumn: "urun_id"))!
                let urun_ad = rs.string(forColumn: "urun_ad")!
                let urun_stok = rs.string(forColumn: "urun_stok")!
                
                let urun = Stok(urun_id: urun_id, urun_ad: urun_ad , urun_stok: urun_stok )
                
                array.append(urun)
            }
            
            stokArray.onNext(array)
            
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
    func veritabaniKopyala(){
            let bundleYolu = Bundle.main.path(forResource: "Homework 7", ofType: ".db")
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("StokDB.db")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: kopyalanacakYer.path){
                print("Veritabanı zaten var")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                }catch{}
            }
        }
    
    
    
    
    
}

