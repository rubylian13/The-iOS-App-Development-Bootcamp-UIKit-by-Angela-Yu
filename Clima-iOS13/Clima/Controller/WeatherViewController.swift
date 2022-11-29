//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}

    //    @IBAction func searchPressed(_ sender: UIButton) {
    //        searchTextField.endEditing(true)
    //
    //        print(searchTextField.text!)
    //    }
    //
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        searchTextField.endEditing(true)
    //        print(searchTextField.text!)
    //        return true
    //    }
    //
    //    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    //        if textField.text != "" {
    //            return true
    //        } else {
    //            textField.placeholder = "try something"
    //            return false
    //        }
    //    }
    //
    //    func textFieldDidEndEditing(_ textField: UITextField) {
    //        // use searchTextField.text to get the weather for that city
    //
    //        if let city = searchTextField.text {
    //            weatherManager.fetchWeather(cityName: city)
    //        }
    //
    //        searchTextField.text = "" // from string to empty string
    //
    //    }
    
//        // 資料回傳從 WeatherManager 至 WeatherViewController
//        func updateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
//            DispatchQueue.main.async {
//                // update temperature number
//                self.temperatureLabel.text = weather.temperatureString
//                // update weather image
//                self.conditionImageView.image = UIImage.init(systemName: weather.conditionName)
//            }
//    //        print(weather.temperature)
//        }
//
//        func didFailWithError(error: Error) {
//            print(error)
//        }
//    }
    
//MARK: - UITextFieldDelegate

    extension WeatherViewController: UITextFieldDelegate {
        
        @IBAction func searchPressed(_ sender: UIButton) {
            searchTextField.endEditing(true)
            
            print(searchTextField.text!)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchTextField.endEditing(true)
            print(searchTextField.text!)
            return true
        }
        
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            if textField.text != "" {
                return true
            } else {
                textField.placeholder = "try something"
                return false
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            // use searchTextField.text to get the weather for that city
            
            if let city = searchTextField.text {
                weatherManager.fetchWeather(cityName: city)
            }
            
            searchTextField.text = "" // from string to empty string
            
        }
    }
    
//MARK: - WeatherManagerDelegate
    
    extension WeatherViewController: WeatherManagerDelegate {
        
        // 資料回傳從 WeatherManager 至 WeatherViewController
        func updateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
            DispatchQueue.main.async {
                // update temperature number
                self.temperatureLabel.text = weather.temperatureString
                // update weather image
                self.conditionImageView.image = UIImage.init(systemName: weather.conditionName)
                self.cityLabel.text = weather.cityName
            }
            //        print(weather.temperature)
        }
        
        func didFailWithError(error: Error) {
            print(error)
        }
    }

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("Got location data")
        
        //經緯度
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
//            print(lat)
//            print(lon)
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
