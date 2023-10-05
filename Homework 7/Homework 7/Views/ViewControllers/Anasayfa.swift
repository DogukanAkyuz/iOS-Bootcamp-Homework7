//
//  ViewController.swift
//  Homework 7
//
//  Created by Doğukan Akyüz on 5.10.2023.
//

import UIKit
import RxSwift

class Anasayfa: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var stokArray = [Stok]()
    
    var viewModel = AnasayfaVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        tableView.register(StokCell.self, forCellReuseIdentifier: StokCell.identifier)
        
        _ = viewModel.stokArray.subscribe( onNext: { results in
            self.stokArray = results
            self.tableView.reloadData()
        }
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadStok()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let stok = sender as? Stok {
                let detay = segue.destination as! Detay
                detay.urun = stok
            }
        }
    }
    

    
    


}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stokArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StokCell.identifier, for: indexPath) as? StokCell else {
            return UITableViewCell()
        }
        let model = stokArray[indexPath.row]
        cell.configure(ad: model.urun_ad ?? "", stok: model.urun_stok ?? "")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = stokArray[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: student)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ contextualAction,view,bool in
            let urun = self.stokArray[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Ürün?", message: "\(urun) silinsi mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.viewModel.delete(stok_id: urun.urun_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    
    
    
}

extension Anasayfa: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchName: searchText)
    }
    
}



