//
//  MeasurePoint.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/19/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import Foundation

struct MeasurePoint: Codable {
    var SiteNumber: String = ""
    var ReportingAgency: String = ""
    var LastDateReported: String = ""
    var StationName: String = ""
    var Latitude: String = ""
    var Longitude: String = ""
    var InventoryDate: String = ""
    var WellDepth: String = ""
    
    var imageURL: String? = "https://waterdata.usgs.gov/nwisweb/local/state/pr/text/pics/"
    
    var detailData: RootObject?
    
    var isFavorite: Bool? = false
    
    private enum CodingKeys: String, CodingKey {
        case SiteNumber = "site_no"
        case ReportingAgency = "agency_cd"
        case LastDateReported = "last_date"
        case StationName = "station_nm"
        case Latitude = "dec_lat_va"
        case Longitude = "dec_long_va"
        case InventoryDate = "inventory_dt"
        case WellDepth = "well_depth_va"
    }
}
