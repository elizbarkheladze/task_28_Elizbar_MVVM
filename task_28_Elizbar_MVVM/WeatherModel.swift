//
//  WeatherModel.swift
//  task_28_Elizbar_MVVM
//
//  Created by alta on 8/31/22.
//

import Foundation


import Foundation

// MARK: - Welcome
struct Root: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let name: String
}
// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Int
}
// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

