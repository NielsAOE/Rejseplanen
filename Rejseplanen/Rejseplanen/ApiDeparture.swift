//
//  ApiResults.swift
//  PopularTVShows
//
//  Created by Niels Østman on 04/05/2016.
//  Copyright © 2016 Niels Østman. All rights reserved.
//

import Foundation

class ApiDeparture {
    
    var name : String!
    var type : String!
    var stop : String!
    var time : String!
    var date : String!
    var messages : String!
    var track : String!
    var rtTrack : String!
    var finalStop : String!
    var direction : String!
    var journeyDetail : String!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        name = json["name"].stringValue
        type = json["type"].stringValue
        stop = json["stop"].stringValue
        time = json["time"].stringValue
        date = json["date"].stringValue
        messages = json["messages"].stringValue
        track = json["track"].stringValue
        rtTrack = json["rtTrack"].stringValue
        finalStop = json["finalStop"].stringValue
        direction = json["direction"].stringValue
        journeyDetail = json["JourneyDetailRef"]["ref"].stringValue
    }
    
}