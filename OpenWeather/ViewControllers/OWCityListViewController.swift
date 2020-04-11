//
//  ViewController.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWCityListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var citiesArray: [OWCityModel] = []
    var cityModel: OWCityModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hardcoded list of cities
        let vienna = OWCityModel(withName: "Vienna", latitude: 48.2203445, longitude: 16.09988)
        let berlin = OWCityModel(withName: "Berlin", latitude: 52.5069312, longitude: 13.1445498)
        let london = OWCityModel(withName: "London", latitude: 51.5287718, longitude: -0.2416823)
        citiesArray = [vienna, berlin, london]
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier?.isEqual(OWConstants.kListToWeatherSegue) ?? false {
            let weatherVC = segue.destination as? OWCityWeatherViewController
            weatherVC?.setCityWeatherModel(city: cityModel)
        }
    }

}

extension OWCityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell")
        
        let city = citiesArray[indexPath.row]
        cell?.textLabel?.text = city.name
        
        return cell!
    }
    
}

extension OWCityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showSpinner()
        tableView.deselectRow(at: indexPath, animated: true)

        cityModel = citiesArray[indexPath.row]
        let cityModelMgr = OWCityWeatherModelManager()
        let connectionMgr = OWConnectionManager()
        
        connectionMgr.getDataForCity(city: cityModel, modelManager: cityModelMgr) { [weak self] (value, error) in
            if value != nil {
                self?.cityModel.weather = value as? OWWeatherModel
                DispatchQueue.main.async {
                    self?.hideSpinner()
                    self?.performSegue(withIdentifier: OWConstants.kListToWeatherSegue, sender: nil)
                }
            } else {
                //TODO - Error alert
            }
        }
        
        
    }
}
