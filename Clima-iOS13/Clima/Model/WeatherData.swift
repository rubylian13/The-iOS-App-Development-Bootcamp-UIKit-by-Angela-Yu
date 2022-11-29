//
//  WeatherData.swift
//  Clima
//
//  Created by Ruby Lien on 2022/11/18.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable { // Codable = Decodable + Encodable
    let name: String // location
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
//    let description: String
    let id: Int
}

