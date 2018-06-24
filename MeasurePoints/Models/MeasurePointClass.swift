//
//  MeasurePointClass.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/26/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import MapKit

class MeasurePointClass: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}

