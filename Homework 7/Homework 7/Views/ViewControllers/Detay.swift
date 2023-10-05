//
//  Detay.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//

import UIKit

class Detay: UIViewController {
    
    @IBOutlet weak var labelUrunAd: UITextField!
    @IBOutlet weak var labelUrunStok: UITextField!
    @IBOutlet weak var buttonUpdate: UIButton!
    
    var urun: Stok?
    
    
    var viewModel = DetayVM()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let s = urun {
            
            labelUrunAd.text = s.urun_ad
            labelUrunStok.text = s.urun_stok
        }
        
        
        
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        
        if let ad = labelUrunAd.text, let stok = labelUrunStok.text, let u = urun {
            viewModel.update(urun_id: u.urun_id!, urun_ad: ad, urun_stok: stok)
        }
        
        
        
    }
    
    

}

