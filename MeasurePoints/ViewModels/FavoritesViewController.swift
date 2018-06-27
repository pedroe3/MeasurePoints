//
//  FavoritesViewController.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/16/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import UIKit
import MapKit

class FavoritesViewController: UITableViewController {

    let appData = AppData.shared
    
    var measurePointList: [MeasurePoint] {
        return appData.measurePointFavoriteList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        self.tableView.backgroundColor = UIColor.glass
        configureColor()
        configureBackBarButton()
        title = "Favorites"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTable()
    }
    
    private func setupTable(){
        tableView.reloadData()
        if(appData.measurePointFavoriteList.count == 0){
            tableView.separatorStyle = .none
        } else {
            tableView.separatorStyle = .singleLine
        }
    }
}

extension FavoritesViewController {
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return measurePointList.count == 0 ? 1 : measurePointList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(measurePointList.count > 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "measurePointCell", for: indexPath) as! MeasurePointTableViewCell
            let measurePoint = measurePointList[indexPath.row]
            cell.configureCell(with: measurePoint)
            cell.configureMap(with: measurePoint)
            cell.contentView.backgroundColor = UIColor.glass
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteEmptyCell", for: indexPath) as! MeasurePointFavoriteEmptyCell
            return cell
        }
    }
}

extension FavoritesViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let measurePoint = measurePointList[indexPath.row]
        self.displayMeasurePointDetail(measurePoint)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func displayMeasurePointDetail(_ detail: MeasurePoint){
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        detailVC.detailMeasurePoint = detail
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let measurePoint  = measurePointList[indexPath.row]
        self.displayMeasurePointDetail(measurePoint)
    }
}
 

