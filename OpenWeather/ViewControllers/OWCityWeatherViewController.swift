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
    @IBOutlet var windImg: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.clear

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        backgroundImage.image = UIImage(named: "Vienna")
        
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImage.addSubview(blurEffectView)

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
