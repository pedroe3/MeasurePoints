//
//  DetailViewController.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/26/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import Foundation
import UIKit
import Charts
import MBProgressHUD
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var siteNameLabel: UILabel! {
        didSet {
            siteNameLabel.textColor = UIColor.bondi
        }
    }
    @IBOutlet weak var stationNameLabel: UILabel!{
        didSet {
            stationNameLabel.textColor = UIColor.marina
        }
    }
    @IBOutlet weak var reportingAgencyLabel: UILabel!{
        didSet {
            reportingAgencyLabel.textColor = UIColor.marina
        }
    }
    @IBOutlet weak var lastDateLabel: UILabel!{
        didSet {
            lastDateLabel.textColor = UIColor.marina
        }
    }
    
    
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var imageViewDetail: UIImageView!
    
    @IBOutlet weak var favButton: UIButton! {
        didSet {
           favButton.apply(ButtonStyle.standard, with: "Add")
        }
    }
    
    
    let file = FileAccess()
    let appData = AppData.shared
    var detailMeasurePoint = MeasurePoint()
    let queryService = QueryService()
    let detailData = DetailData.shared
 
    override func viewDidLoad(){
        super.viewDidLoad()
        configureColor()
        //configureBackBarButton()
        setupBasicInfo()
        loadDataFromApi()
        setImage()
        prepareChart()
        setFavoriteButton(detailMeasurePoint.isFavorite!)
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
            set.circleColors = [UIColor.bondi]
            set.setColor(UIColor.marina)
             set.circleRadius = 3
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
        set.circleColors = [UIColor.marina]
        set.setColor(UIColor.marina)
        set.circleRadius = 1
        return set
    }

    private func setupBasicInfo(){
        siteNameLabel.text = detailMeasurePoint.SiteNumber
        stationNameLabel.text = detailMeasurePoint.StationName
        reportingAgencyLabel.text = "Reporting Agency: \(detailMeasurePoint.ReportingAgency)"
        
        
        //let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US")
        //dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
        //dateFormatter.dateFormat = "'yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ'"
        //let date = dateFormatter.date(from: detailMeasurePoint.LastDateReported)
       
        lastDateLabel.text = ""
    }
    
    private func setFavoriteButton(_ isFavorite: Bool) {
        if(detailMeasurePoint.isFavorite!){
            favButton.apply(ButtonStyle.standard, with: "Favorite")
           // navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "favorites_icon_29pt"), style: .plain, target: self, action: #selector(favoriteButtonPressed))
        } else {
            favButton.apply(ButtonStyle.standard, with: "Add")
           // navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(favoriteButtonPressed))
        }
    }
    
    private func setNavigationBar(_ isFavorite: Bool){
        if(detailMeasurePoint.isFavorite!){
          navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "favorites_icon_29pt"), style: .plain, target: self, action: #selector(favoriteButtonPressed))
        } else {
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(favoriteButtonPressed))
        }
    }
    
    
    @IBAction func favButtonPressed(_ sender: Any) {
         if(detailMeasurePoint.isFavorite == false) {
             detailMeasurePoint.isFavorite = true
            favButton.apply(ButtonStyle.standard, with: "Favorite")
            appData.updateFavoriteList(with: detailMeasurePoint)
            self.file.saveToFavoritesFile()
             } else {
            detailMeasurePoint.isFavorite = false
            appData.updateFavoriteList(with: detailMeasurePoint)
            self.file.saveToFavoritesFile()
            favButton.apply(ButtonStyle.standard, with: "Add")
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
        if let imageURL = URL(string: detailMeasurePoint.imageURL! + detailMeasurePoint.SiteNumber + ".jpg"){
            imageViewDetail.af_setImage(withURL: imageURL, completion: {( _ ) in
            })
        } else {
            print("problem downloading image")
            imageViewDetail.image = UIImage(named: "NoImageAvailable.jpeg")
            
        }
    }
    
    private func loadDataFromApi(){
      MBProgressHUD.showAdded(to: self.view, animated: true);
        queryService.fetchDetailData(site: detailMeasurePoint.SiteNumber) { [weak self] (success, error) in
          self?.prepareChart()
            MBProgressHUD.hide(for: (self?.view)!, animated: true)
        }
      
    }
}


