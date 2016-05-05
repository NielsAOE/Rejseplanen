//
//  Stop.swift
//  Rejseplanen
//
//  Created by Niels Østman on 05/05/2016.
//  Copyright © 2016 Niels Østman. All rights reserved.
//

import Foundation

struct Stop: Equatable {

    // MARK: Properties
    
    let id: String
    
    let name: String
    
    let xCor: Int

    let yCor: Int
    
    var identifier: String {
        return "\(id).\(name)"
    }
}

// MARK: Equatable

func ==(lhs: Stop, rhs: Stop)-> Bool {
    // Two `DataItem`s are considered equal if their identifiers and titles match.
    return lhs.identifier == rhs.identifier && lhs.id == rhs.id
}
