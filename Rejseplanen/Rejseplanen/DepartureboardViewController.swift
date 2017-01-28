//
//  FirstViewController.swift
//  Rejseplanen
//
//  Created by Niels Østman on 05/05/2016.
//  Copyright © 2016 Niels Østman. All rights reserved.
//

import UIKit

class DepartureboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout    {
    @IBOutlet weak var sentNotificationLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var departures = [ApiDeparture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(DepartureboardViewController.downloadDepartureData), name: NSNotification.Name(rawValue: mySpecialNotificationKey), object: nil)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        downloadDepartureData()
    }
    func downloadDepartureData () {
        ApiService.sharedInstance.getDepartureboards {JSON, NSError in
            if NSError != nil {
                print(NSError!.debugDescription)
            }
            else {
                let apiDepartureboard = ApiDepartureboard(fromJson: JSON)
                self.departures = apiDepartureboard.departures
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DepartureCell", for: indexPath) as? DepartureCell {
            
            let departure = self.departures[indexPath.row]
            cell.configureCell(departure)
            
            return cell
        }
        else {
            return DepartureCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return departures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 260, height: 430)
    }
}

