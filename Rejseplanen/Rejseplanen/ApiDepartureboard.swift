//
//  ApiTVResult.swift
//  PopularTVShows
//
//  Created by Niels Østman on 04/05/2016.
//  Copyright © 2016 Niels Østman. All rights reserved.
//

import Foundation

class ApiDepartureboard {
    
    var noNamespaceSchemaLocation : String!
    var departures : [ApiDeparture]!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        departures = [ApiDeparture]()
        noNamespaceSchemaLocation = json["DepartureBoard"]["noNamespaceSchemaLocation"].stringValue
        let departuresArray = json["DepartureBoard"]["Departure"].arrayValue
        for departuresJson in departuresArray{
            let value = ApiDeparture(fromJson: departuresJson)
            departures.append(value)
        }
    }
    
}