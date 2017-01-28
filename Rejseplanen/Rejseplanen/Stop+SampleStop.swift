//
//  Stop+SampleStop.swift
//  Rejseplanen
//
//  Created by Niels Østman on 05/05/2016.
//  Copyright © 2016 Niels Østman. All rights reserved.
//

import Foundation
extension Stop {
    /// A static sample set of `DataItem`s.
    static var sampleStops: [Stop] = {
        return [
            Stop(id: "8600718", name: "Vipperød St.", xCor: 672250, yCor: 6172400),
            Stop(id: "8600798", name: "Høje Taastrup St.", xCor: 672250, yCor: 6172400),
            Stop(id: "8600719", name: "Holbæk St.", xCor: 672250, yCor: 6172400),
            Stop(id: "8600716", name: "Hvalsø St.", xCor: 672250, yCor: 6172400),
            Stop(id: "8600555", name: "Svendborg Vest St.", xCor: 672250, yCor: 6172400),
            Stop(id: "8600551", name: "Svendborg St.", xCor: 672250, yCor: 6172400),
            Stop(id: "8600717", name: "Tølløse St.", xCor: 672250, yCor: 6172400)
            
        ]
    }()
    static var selectedStop = "8600718"
}
