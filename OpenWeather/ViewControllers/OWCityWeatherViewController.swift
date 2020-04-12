//
//  OWCityWeatherViewController.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWCityWeatherViewController: UIViewController {

    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var mainWeatherIcon: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var windLabel: UILabel!
    @IBOutlet var rainLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    var cityModel: OWCityModel?
    var currentWeather: OWCurrentWeatherModel?
    var dailyWeather: [OWDailyWeatherModel] = []
    let kRowHeight: CGFloat = 25
    let kBlurValue = 7
    let kDegreeUnit = "º"
    let kKmphUnit = "km/h"
    let kMmUnit = "mm"
    let kPercentage = "%"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        currentWeather = cityModel?.weather?.currentWeather
        dailyWeather = cityModel?.weather?.dailyWeather ?? []
        
        backgroundImage.image = UIImage(named: cityModel?.name ?? "") ?? UIImage(named: OWConstants.kDefaultBackgroundImage)
        addBlurEffectToBackground()
        setUpUI()
    }
    
    func setUpUI() {
        cityNameLabel.text = cityModel?.name
        tempLabel.text = OWCityWeatherViewModel.getStringFromDouble(value: currentWeather?.temp ?? OWConstants.kDefaultDoubleValue)+kDegreeUnit
        dateLabel.text = OWCityWeatherViewModel.getDateFrom(unix: currentWeather?.time ?? NSDate().timeIntervalSince1970, style: OWConstants.kStyleFull)
        descriptionLabel.text = OWCityWeatherViewModel.getWeatherDescription(array: currentWeather?.weatherDescription ?? [])
        mainWeatherIcon.loadImageFrom(url: OWCityWeatherViewModel.getImageURL(array: currentWeather?.weatherDescription ?? []))
        windLabel.text = OWCityWeatherViewModel.getStringFromDouble(value: currentWeather?.wind ?? OWConstants.kDefaultDoubleValue)+kKmphUnit
        rainLabel.text = OWCityWeatherViewModel.getStringFromDouble(value: currentWeather?.rain?.rain ?? OWConstants.kDefaultDoubleValue)+kMmUnit
        humidityLabel.text = OWCityWeatherViewModel.getStringFromDouble(value: currentWeather?.humidity ?? OWConstants.kDefaultDoubleValue)+kPercentage
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.clear
    }
    
    func setUpNavigationController() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func addBlurEffectToBackground() {
        let blurEffect = (NSClassFromString("_UICustomBlurEffect") as! UIBlurEffect.Type).init()
        
        let blurView = UIVisualEffectView(frame: backgroundImage.bounds)
        blurEffect.setValue(kBlurValue, forKey: "blurRadius")
        blurView.effect = blurEffect
        backgroundImage.addSubview(blurView)
    }
    
    func setCityWeatherModel(city: OWCityModel) {
        cityModel = city
    }

}

extension OWCityWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OWConstants.kForecastCellIdentifier) as? OWExtendedForecastTableViewCell
        
        let dayWeather = dailyWeather[indexPath.row]
        cell?.dayLabel.text = OWCityWeatherViewModel.getDateFrom(unix: dayWeather.day, style: OWConstants.kStyleDay)
        cell?.weatherImg.loadImageFrom(url: OWCityWeatherViewModel.getImageURL(array: dayWeather.weatherDescription))
        cell?.maxTempLabel.text = OWCityWeatherViewModel.getStringFromDouble(value: dayWeather.tempModel.max)
        cell?.minTempLabel.text = OWCityWeatherViewModel.getStringFromDouble(value: dayWeather.tempModel.min)
        
        return cell!
    }
    
}

extension OWCityWeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kRowHeight
    }
}
