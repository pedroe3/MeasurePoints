//
//  AppData.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/19/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

//the use of this is to request the data only 1 time,  and share with all the views.  

final class AppData {
    
    static let shared = AppData()
    private init() {}
    
    private var measurePoint: [MeasurePoint] = []
}

// MAKR: - Public getters
extension AppData { //getter to access the data,   //protec from manipulation as a struc
    var measurePointList: [MeasurePoint] {
        return measurePoint
    }
}

// MARK: - Mutationg functions
extension AppData {
    func updateMeasurePointList(with measurePointResponse: [MeasurePoint]?){
        guard let response = measurePointResponse else { return }
        self.measurePoint.append(contentsOf: response)
    }
}
