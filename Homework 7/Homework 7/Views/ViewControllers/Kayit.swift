//
//  Kayit.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//

import UIKit

class Kayit: UIViewController {
    
    
    @IBOutlet weak var labelAd: UITextField!
    @IBOutlet weak var labelStok: UITextField!
    @IBOutlet weak var buttonkayit: UIButton!
    
    var viewModel = KayitVM()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonkayit(_ sender: Any) {
        if let ad = labelAd.text, let stok = labelStok.text {
            viewModel.kayit(urun_ad: ad, urun_stok: stok)
        }
        
    }
    
}

