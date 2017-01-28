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
    
    func apiGetRequest(_ path: String, onCompletion: @escaping (JSON, NSError?) -> Void) {
        
        let request = URLRequest(url: URL(string: path)!)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data!)
            onCompletion(json, error as NSError?)
        })
        task.resume()
    }
    
    func getDepartureboards(_ onCompletion: @escaping (JSON, NSError?) -> Void) {
        let URL = "http://xmlopen.rejseplanen.dk/bin/rest.exe/departureBoard?id=\(Stop.selectedStop)&format=json"
        apiGetRequest(URL, onCompletion: { json, err in
            onCompletion(json as JSON, err as NSError?)
        })
    }
    
}
