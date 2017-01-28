//
//  DepartureCell.swift
//  Rejseplanen
//
//  Created by Niels Østman on 04/05/2016.
//  Copyright © 2016 Niels Østman. All rights reserved.
//

import Foundation
import UIKit

class DepartureCell: UICollectionViewCell {
    
    @IBOutlet weak var departureImg: UIImageView!
    @IBOutlet weak var departureName: UILabel!
    @IBOutlet weak var departureTime: UILabel!
    @IBOutlet weak var departureFrom: UILabel!
    @IBOutlet weak var departureTo: UILabel!
    
    func configureCell(_ departure: ApiDeparture) {
        
        if let name = departure.name{
            departureName.text = name
        }
        
        if let time = departure.time{
            departureTime.text = "Afgang: " + time
        }
        
        if let from = departure.stop{
            departureFrom.text = "Fra: " + from
        }
        
        if let to = departure.direction{
            departureTo.text = "Til: " + to
        }
    }
}
