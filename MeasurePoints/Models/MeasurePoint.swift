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
    
    
    /*

     "agency_cd": "USGS",
    "alt_datum_cd": "NA",
    "alt_meth_cd": "NA",
    "aqfr_cd": "NA",
    "aqfr_type_cd": "NA",
    "basin_cd": "NA",
    "construction_dt": "NA",
    "contrib_drain_area_va": "NA",
    "coord_acy_cd": "S",
    "coord_datum_cd": "NAD27",
    "coord_meth_cd": "M",
    "country_cd": "US",
    "county_cd": "41",
    "dec_coord_datum_cd": "NAD83",
    "dec_lat_va": "18.17107",
    "dec_long_va": "-66.16544",
    "depth_src_cd": "NA",
    "district_cd": "72",
    "drain_area_va": "NA",
    "gw_file_cd": "NNNNNNNN",
    "hole_depth_va": "NA",
    "instruments_cd": "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNN",
    "inventory_dt": "NA",
    "land_net_ds": "NA",
    "last_date": "1988-01-25T00:00:00.000",
    "lat_va": "181023",
    "local_time_fg": "N",
    "location": {
        "type": "Point",
        "coordinates": [
                        -66.16544,
                        18.17107
                        ]
    },
    "map_nm": "NA",
    "map_scale_fc": "  20000",
    "nat_aqfr_cd": "NA",
    "project_no": "NA",
    "reliability_cd": "NA",
    "site_no": "181023066095700",
    "site_tp_cd": "FA-CS",
    "station_nm": "CIDRA SITE, CIDRA, PR",
    "topo_cd": "NA",
    "tz_cd": "AST",
    "well_depth_va": "NA"
 
 */
}
