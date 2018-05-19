//
//  FirstViewController.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/19/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    let queryService = QueryService()
    
    let appData = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadDataFromApi()
        print(appData.measurePointList.count)
    }
    
    private func loadDataFromApi(){
        if appData.measurePointList.count == 0 { //only fetch data if no data is available.   the api downloads all data in one zap.
            queryService.fetchData { [weak self](_, _) in
                print(self?.appData.measurePointList)
            }
        }
       
    }
}
