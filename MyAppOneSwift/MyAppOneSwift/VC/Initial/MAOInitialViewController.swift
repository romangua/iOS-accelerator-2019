//
//  MAODetailViewController.swift
//  MyAppOneSwift
//
//  Created by Roman Guarino on 25/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import UIKit

class MAOInitialViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var resultIcon: UIImageView!
    var arrayModels: Array<MAOListViewControllerModel> = []
    
    enum OrderType {
        case TRACK_ID
        case RELEASE_DATE
    }
    
    struct Result : Decodable {
        let resultCount: Int
        let results: [MAOListViewControllerModel]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.hidesWhenStopped = true
    }

    @IBAction func onClickSelection(_ sender: UIButton) {
        
        self.activityIndicator.startAnimating()
        MARequestService.fetchData(url: "https://itunes.apple.com/search?term=jack+johnson", success: {(data) in
            self.activityIndicator.stopAnimating()
            if let data = try? JSONDecoder().decode(Result.self, from: data!) {
                self.arrayModels = data.results
            } else {
                self.showDialog(title: "Error", message: "Se produjo un error al procesar los datos")
            }
        }) {(error) in
            self.activityIndicator.stopAnimating()
            print("Error al obtener los datos: \(error.localizedDescription)")
            self.showDialog(title: "Error", message: "Se produjo un error al obtener los datos")
        }
    }
    
    @IBAction func btnShowByReleaseTrackAsc(_ sender: UIButton) {
        self.goToList(showDesc: false, orderByType: OrderType.RELEASE_DATE)
    }
    
    @IBAction func btnShowByReleaseTrackDesc(_ sender: UIButton) {
        self.goToList(showDesc: true, orderByType: OrderType.RELEASE_DATE)
    }
    
    @IBAction func btnShowByTrackIdAsc(_ sender: UIButton) {
        self.goToList(showDesc: false, orderByType: OrderType.TRACK_ID)
       
    }
    
    @IBAction func btnShowByTrackIdDesc(_ sender: UIButton) {
        self.goToList(showDesc: true, orderByType: OrderType.TRACK_ID)
    }
    
    func goToList(showDesc: Bool, orderByType: OrderType) {
        if(arrayModels.count != 0) {
            let nav = UINavigationController(rootViewController: self)
            UIApplication.shared.keyWindow?.rootViewController = nav
            let vc = MAOListViewController()
            vc.arrayModels = arrayModels
            nav.pushViewController(vc, animated: true)
        } else {
            showDialog(title: "Atención", message: "Primero debes cargar los datos")
        }
    }
    
    func showDialog(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
