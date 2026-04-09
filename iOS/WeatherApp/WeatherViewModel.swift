//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Thomas Krajacic on 09.04.26.
//

import WeatherLibrary
import Observation

@MainActor @Observable
final class WeatherViewModel {
    var weatherData: WeatherData? = nil

    func fetchWeather() async throws {
        let locationService = AppleParkWeatherFetcher()
        let weatherClient = WeatherClient(locationFetcher: locationService)
        weatherData = try await weatherClient.getWeather()
    }
}

struct AppleParkWeatherFetcher: LocationFetcher {
    func currentLocation() -> WeatherLibrary.Location {
        .init(latitude: 37.3349, longitude: -122.009)
    }
}
