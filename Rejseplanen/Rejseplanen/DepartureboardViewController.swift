//
//  FirstViewController.swift
//  Rejseplanen
//
//  Created by Niels Østman on 05/05/2016.
//  Copyright © 2016 Niels Østman. All rights reserved.
//

import UIKit

class DepartureboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout    {
    @IBOutlet weak var collectionView: UICollectionView!
    var departures = [ApiDeparture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DepartureCell", forIndexPath: indexPath) as? DepartureCell {
            
            let departure = self.departures[indexPath.row]
            cell.configureCell(departure)
            
            return cell
        }
        else {
            return DepartureCell()
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return departures.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(260, 430)
    }
}

