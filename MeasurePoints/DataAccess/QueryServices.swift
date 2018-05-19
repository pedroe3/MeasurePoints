//
//  QueryServices.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/19/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import Foundation
import Alamofire

enum APIResourceURL: String {
    case base
    
    static let baseURL = "https://data.pr.gov/resource/s7x7-xywe.json"
    
    var url: String {
        return APIResourceURL.baseURL
    }
}

class QueryService {
    
    typealias SuccessResult = (Bool, String) -> ()
    
    let appData = AppData.shared
    
    var errorMessage = ""
    
    var url: String {
        return APIResourceURL.base.url
    }
    
    let headers: HTTPHeaders = [
        "X-App-Token": "d37dWkcYcV89V3RnCjITOlNLH",
        "Accept": "application/json"
    ]
}

extension QueryService {
    func fetchData(completion: @escaping SuccessResult) {
        print(url)
        Alamofire.request(url, headers: self.headers).responseJSON { (response) in
            let didUpdateMeasurePointData = self.updateMeasurePointResult(response)
            completion(didUpdateMeasurePointData, self.errorMessage)
        }
    }
}

extension QueryService {
    
    private func updateMeasurePointResult(_ response: DataResponse<Any>) -> Bool {
        guard let data = response.data else { return false }
        let decoder = JSONDecoder()
        
        do {
            let decodedMeasurePoints = try decoder.decode([MeasurePoint].self, from: data)
            appData.updateMeasurePointList(with: decodedMeasurePoints)
            return true
        } catch let error {
            errorMessage = error.localizedDescription
            print(errorMessage)
            return false
        }
    }
}
