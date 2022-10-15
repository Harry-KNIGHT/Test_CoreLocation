//
//  ContentView.swift
//  TestCoreLocation
//
//  Created by Elliot Knight on 11/10/2022.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
	@ObservedObject var locationManager = LocationManager.shared
	@ObservedObject var locationValueConverterVM = LocationValuesConverterViewModel()
	@StateObject var weatherVM = WeatherKitViewModel()
    var body: some View {
		VStack(alignment: .leading) {
			if locationManager.userLocation == nil {
				LocationRequestView()
			} else if let location = locationManager.userLocation {
				VStack(alignment: .leading) {
					Text("Lat: \(String(location.coordinate.latitude))")
					Text("Long: \(String(location.coordinate.longitude))")
					Text("Speed: \(String(location.speed))")
					Text("Speed Accuracy: \(String(location.speedAccuracy))")
					Text("TimeStamp: \(location.timestamp)")
					Text("Altitude \(String(format: "%.2tf", location.altitude))m upper sea level")
					Text("Km/h: \(String(format: "%.2f", locationValueConverterVM.convertMeterInSecondsToKm(speed: location.speed)))")
					Text("\(String(location.distance(from: CLLocation(latitude: 48.85826, longitude: 2.294499))))m away from Eiffeil Tower")

					Text("\( locationValueConverterVM.convertMetersInKilometer(distanceInMeter: location.distance(from:  CLLocation(latitude: 48.85826, longitude: 2.294499))))KM away from Eiffeil Tower")

					if let weather = weatherVM.weather {
						HStack {
							Text(String(weather.currentWeather.temperature.description))
							Image(systemName: weather.currentWeather.symbolName)
							Text(String(weather.currentWeather.date.description))
						}
						.padding()
						.background(.thinMaterial)
						.cornerRadius(10)
					}
				}
			}
		}
		.padding()
		.task {
			if let location = locationManager.userLocation {
				
				await weatherVM.getWeather(lat: location.coordinate.latitude, long: 	location.coordinate.longitude)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(LocationValuesConverterViewModel())
			.environmentObject(WeatherKitViewModel())
    }
}
