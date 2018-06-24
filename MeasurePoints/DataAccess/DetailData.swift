//
//  detailData.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/9/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

final class DetailData {
    
    static let shared = DetailData()
    private init() {}
    private var detailMeasurePoint: RootObject?
    
}

// MAKR: - Public getters
extension DetailData { //getter to access the data,   //protec from manipulation as a struc
    var detailInfoMeasurePoint: RootObject? {
        return detailMeasurePoint
    }
}

// MARK: - Mutationg functions
extension DetailData {
    func updateMeasurePointList(with detailMeasurePointResponse: RootObject?){
        guard let response = detailMeasurePointResponse else { return }
        self.detailMeasurePoint = response
    }
}
