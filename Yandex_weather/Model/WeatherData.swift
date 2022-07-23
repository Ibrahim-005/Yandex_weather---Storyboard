//
//  WeatherData.swift
//  Yandex_weather
//
//  Created by cloud_vfx on 18/07/22.
//

import Foundation

struct WeatherData: Decodable {
    
    let info : Info
    let fact : Fact
    let forecasts: [Forecast]
}

struct Info: Decodable {
    let url: String
}

struct Fact : Decodable {
    let temp: Double
    let icon : String
    let condition: String
    let windSpeed: Double
    let pressureMm: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case icon
        case condition
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
    }
}

struct Forecast: Decodable {
    let parts : Parts
}

struct Parts: Decodable {
    let day : Day
}

struct Day: Decodable {
    let tempMin : Int?
    let tempMax : Int?
    
    enum Codingkeys: String , CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
