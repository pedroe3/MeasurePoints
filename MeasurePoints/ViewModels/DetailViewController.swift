//
//  DetailViewController.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/26/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import UIKit
import Charts
import MBProgressHUD
import AlamofireImage

class DetailViewController: UIViewController{
    
    @IBOutlet weak var siteNameLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var reportingAgencyLabel: UILabel!
    @IBOutlet weak var lastDateLabel: UILabel!
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var imageViewDetail: UIImageView!
    
    let file = FileAccess()
    let appData = AppData.shared
    var detailMeasurePoint = MeasurePoint()
    let queryService = QueryService()
    let detailData = DetailData.shared
 
    override func viewDidLoad(){
        super.viewDidLoad()
        configureBackBarButton()
        setupBasicInfo()
        loadDataFromApi()
        setImage()
        prepareChart()
        setNavigationBar(detailMeasurePoint.isFavorite!)
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    
    func prepareChart() {
        
        let dataSets = dataSetEntry()
        lineChartView.data = LineChartData(dataSet: dataSets)
    }
    
    private func dataSetEntry() -> LineChartDataSet {
        guard let responseData = detailData.detailInfoMeasurePoint?.DataValue else { return returnEmptyDataSet() }
        if ((responseData.DetailInfo?.count)! > 1 ){
            guard let detailInfo = responseData.DetailInfo?[1] else { return returnEmptyDataSet() }
            guard let valuesM = detailInfo.ValuesM?[0] else { return returnEmptyDataSet() }
            guard let point = valuesM.Values else { return returnEmptyDataSet() }
            
            let values = (0..<point.count).map { (i) -> ChartDataEntry in
                let nsString = point[i].Value! as NSString
                let val = nsString.doubleValue
                return ChartDataEntry(x: Double(i), y: Double(val))
            }
            let set = LineChartDataSet(values: values, label: "Measure Readings")
            return set
        } else {
           return returnEmptyDataSet()
        }
    }
    
    
    func returnEmptyDataSet() -> LineChartDataSet {
        let values = (0..<10).map { (i) -> ChartDataEntry in
            let val = 0.0
            return ChartDataEntry(x: Double(i), y: Double(val))
        }
        let set = LineChartDataSet(values: values, label: "No Data Available")
        return set
    }

    private func setupBasicInfo(){
        siteNameLabel.text = detailMeasurePoint.SiteNumber
        siteNameLabel.textColor = .blue
        stationNameLabel.text = detailMeasurePoint.StationName
        reportingAgencyLabel.text = detailMeasurePoint.ReportingAgency
        lastDateLabel.text = detailMeasurePoint.LastDateReported
    }
    
    private func setNavigationBar(_ isFavorite: Bool){
        if(detailMeasurePoint.isFavorite!){
          navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "favorites_icon_29pt"), style: .plain, target: self, action: #selector(favoriteButtonPressed))
        } else {
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(favoriteButtonPressed))
        }
    }
    
    @objc private func favoriteButtonPressed(_ sender: UIBarButtonItem){
        if(detailMeasurePoint.isFavorite == false) {
            detailMeasurePoint.isFavorite = true
            appData.updateFavoriteList(with: detailMeasurePoint)
            self.file.saveToFavoritesFile()
            self.setNavigationBar(detailMeasurePoint.isFavorite!)
        } else {
            detailMeasurePoint.isFavorite = false
            appData.updateFavoriteList(with: detailMeasurePoint)
            self.file.saveToFavoritesFile()
            self.setNavigationBar(detailMeasurePoint.isFavorite!)
        }
    }
    
    private func setImage() {
        if let imageURL = URL(string: detailMeasurePoint.imageURL! + detailMeasurePoint.SiteNumber + ".jpg"  ?? ""){
            imageViewDetail.af_setImage(withURL: imageURL, completion: {( _ ) in
            })
        } else {
            imageViewDetail.image = nil
        }
    }
    
    private func loadDataFromApi(){
      MBProgressHUD.showAdded(to: self.view, animated: true);
        queryService.fetchDetailData(site: detailMeasurePoint.SiteNumber) { [weak self] (success, error) in
          self?.prepareChart()
           
        }
    }
}


