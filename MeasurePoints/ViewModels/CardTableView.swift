//
//  CardTableView.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/26/18.
//  Copyright © 2018 madcrow. All rights reserved.
//


import UIKit

class CardTableView: UITableViewController {
    
    let queryService = QueryService()
    let appData = AppData.shared
    let file = FileAccess()
    
    var measurePointList: [MeasurePoint] {
        return appData.measurePointList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.backgroundColor = UIColor.marina
        loadDataFromApi()
        title = "Water Levels Points"
        configureBackBarButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       tableView.reloadData()
    }
    
    private func loadDataFromApi(){
        if appData.measurePointList.count == 0 { //only fetch data if no data is available.   the api downloads all data in one zap.
            queryService.fetchData { [weak self](_, _) in
                self?.file.loadFromFavoritesFile()
                self?.tableView.reloadData()
            }
        }
    }
}

extension CardTableView {
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return measurePointList.count
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "measurePointCell", for: indexPath) as! MeasurePointTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableCell", for: indexPath) as! CardTableViewCell
        
        let measurePoint = measurePointList[indexPath.row]
        cell.selectedBackgroundView?.backgroundColor = UIColor.glass
        cell.configureCell(with: measurePoint)
        cell.configureMap(with: measurePoint)
        
        return cell
    }
    
    
}

extension CardTableView {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let measurePoint  = measurePointList[indexPath.row]
        
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
