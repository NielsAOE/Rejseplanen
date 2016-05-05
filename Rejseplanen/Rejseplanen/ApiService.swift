//
//  ApiService.swift
//  PopularTVShows
//
//  Created by Niels Østman on 04/05/2016.
//  Copyright © 2016 Niels Østman. All rights reserved.
//

import Foundation

let API_DEPARTUREBOARD_URL = "http://xmlopen.rejseplanen.dk/bin/rest.exe/departureBoard?id=8600626&format=json"
class ApiService {
    
    static let sharedInstance = ApiService()
    
    func apiGetRequest(path: String, onCompletion: (JSON, NSError?) -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data!)
            onCompletion(json, error)
        })
        task.resume()
    }
    
    func getDepartureboards(onCompletion: (JSON, NSError?) -> Void) {
        apiGetRequest(API_DEPARTUREBOARD_URL, onCompletion: { json, err in
            onCompletion(json as JSON, err as NSError?)
        })
    }
    
}