//
//  TimeStamp.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/5/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import Foundation

struct MeasureReading: Codable {
    let Value: String?
    let ReadingDate: String?
    
    private enum CodingKeys: String, CodingKey {
        case Value = "value"
        case ReadingDate = "dateTime"
    }
}

struct MeasureInfo: Codable {
    let Values: [MeasureReading]?
    
    private enum CodingKeys: String, CodingKey {
        case Values = "value"
      
    }
}

struct RootObject: Codable {
    let DataValue: DataValue?
    private enum CodingKeys: String, CodingKey {
        case DataValue = "value"
    }
}

struct DataValue: Codable {
    let DetailInfo: [DetailInfo]?
    
    private enum CodingKeys: String, CodingKey {
        case DetailInfo = "timeSeries"
    }
}

struct DetailInfo : Codable {
    let ValuesM: [MeasureInfo]?
    let Name : String?
    
    private enum CodingKeys: String, CodingKey {
        case ValuesM = "values"
        case Name = "name"
    }
}
