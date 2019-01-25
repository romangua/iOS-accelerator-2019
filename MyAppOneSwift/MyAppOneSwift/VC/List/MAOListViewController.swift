//
//  MAOListViewController.swift
//  MyAppOneSwift
//
//  Created by Roman Guarino on 25/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import UIKit

class MAOListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var resultTable: UITableView!
    var arrayModels: Array<MAOListViewControllerModel> = []
    let cellReuseIdentifier = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTable.register(UINib(nibName: "MAOListTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        resultTable.delegate = self
        resultTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MAOListTableViewCell = self.resultTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MAOListTableViewCell
    
        let data = arrayModels[indexPath.row]
        
        cell.lblTrackName?.text = data.trackName!
        cell.lblAlbumName?.text = data.collectionName!
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL.init(string: data.artworkUrl100!)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.imgAlbum.image = image
                    }
                }
            }
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let nav = UINavigationController(rootViewController: self)
        UIApplication.shared.keyWindow?.rootViewController = nav
        let vc = TravelDetailViewController()
        vc.place = places[indexPath.row]
        nav.pushViewController(vc, animated: true)*/
    }

}
