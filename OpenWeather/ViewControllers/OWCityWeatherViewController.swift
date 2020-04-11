//
//  OWCityWeatherViewController.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWCityWeatherViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var mainWeatherIcon: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var cityModel: OWCityModel?
    var currentWeather: OWCurrentWeatherModel?
    var dailyWeather: [OWDailyWeatherModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        currentWeather = cityModel?.weather?.currentWeather
        dailyWeather = cityModel?.weather?.dailyWeather ?? []
        
        backgroundImage.image = UIImage(named: cityModel?.name ?? "")
        addBlurEffectToBackground()
        setUpUI()
    }
    
    func setUpUI() {
        tempLabel.text = OWCityWeatherViewModel.getMainTempFrom(temp: currentWeather?.temp ?? OWConstants.kDefaultDoubleValue)
        dateLabel.text = OWCityWeatherViewModel.getFullTimeFrom(unix: currentWeather?.time ?? NSDate().timeIntervalSince1970)
        descriptionLabel.text = OWCityWeatherViewModel.getWeatherDescription(array: currentWeather?.weatherDescription ?? [])
        mainWeatherIcon.loadImageFrom(url: OWCityWeatherViewModel.getImageURL(array: currentWeather?.weatherDescription ?? []))
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
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImage.addSubview(blurEffectView)
    }
    
    func setCityWeatherModel(city: OWCityModel) {
        cityModel = city
    }

}

extension OWCityWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell") as? OWExtendedForecastTableViewCell
        
//        let city = citiesArray[indexPath.row]
        cell?.dayLabel.text = "Saturday"
        
        return cell!
    }
    
}

extension OWCityWeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
}

//extension UIImageView {
//    func loadImageFrom(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
