//
//  ContentView.swift
//  TestCoreLocation
//
//  Created by Elliot Knight on 11/10/2022.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var locationManager = LocationManager.shared
	@ObservedObject var locationValueConverterVM = LocationValuesConverterViewModel()
    var body: some View {
		VStack(alignment: .leading) {
			if locationManager.userLocation == nil {
				LocationRequestView()
			} else if let location = locationManager.userLocation {
				Text("Lat: \(String(location.coordinate.latitude))")
				Text("Long: \(String(location.coordinate.longitude))")
				Text("Speed: \(String(location.speed))")
				Text("Speed Accuracy: \(String(location.speedAccuracy))")
				Text("TimeStamp: \(location.timestamp)")
				Text("Altitude \(String(location.altitude))")
				Text("Km/h: \(String(format: "%.2f", locationValueConverterVM.convertMeterInSecondsToKm(speed: location.speed)))")

			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(LocationValuesConverterViewModel())
    }
}
