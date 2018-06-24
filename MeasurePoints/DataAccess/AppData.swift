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
extension AppData { //getter to access the data,   //protec from manipulation as a struc
    var measurePointFavoriteList: [MeasurePoint] {
        return measurePoint.filter { $0.isFavorite == true}
    }
}

// MARK: - Mutationg functions
extension AppData {
    func updateMeasurePointList(with measurePointResponse: [MeasurePoint]?){
        guard let response = measurePointResponse else { return }
        self.measurePoint.append(contentsOf: response)
    }
}

extension AppData {
    func addFavoriteToList(with measurePointResponse: MeasurePoint?){
        guard let response = measurePointResponse else { return }
        self.measurePoint.append(response)
    }
    
    func updateFavoriteList(with measurePointResponse: MeasurePoint?){
        guard let response = measurePointResponse else { return }
        if let row = self.measurePoint.index(where: {$0.SiteNumber == response.SiteNumber}) {
            measurePoint[row] = response
        }
    }
}
