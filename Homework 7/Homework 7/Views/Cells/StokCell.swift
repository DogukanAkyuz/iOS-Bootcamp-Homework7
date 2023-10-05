//
//  StokCell.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//

import UIKit

class StokCell: UITableViewCell {

    static let identifier = "StokCell"
    
    private let urunAd: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Klavye"
        label.textColor = .label
        return label
    }()
    
    private let urunStok: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.text = "43"
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(urunAd)
        contentView.addSubview(urunStok)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = contentView.frame.width
        let height = contentView.frame.height
        
        urunAd.frame = CGRect(x: width/25, y: height/5, width: width/3, height: height/2)
        urunStok.frame = CGRect(x: width-width/10-width/25, y: height/5, width: width/10, height: height/2)
    }
    
    public func configure(ad: String, stok: String  ) {
        urunAd.text = ad
        urunStok.text = stok
    }

}

