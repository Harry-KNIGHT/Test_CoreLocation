//
//  WeatherViewModel.swift
//  TestCoreLocation
//
//  Created by Elliot Knight on 14/10/2022.
//

import Foundation
import CoreLocation
import WeatherKit

class WeatherKitViewModel: ObservableObject {
	@Published public var weather: Weather?


	@MainActor func getWeather(lat: Double, long: Double) async {
		do {
			weather = try await WeatherService.shared.weather(for: CLLocation(latitude: lat, longitude: long))
		} catch {
			print(error)
		}
	}
}
