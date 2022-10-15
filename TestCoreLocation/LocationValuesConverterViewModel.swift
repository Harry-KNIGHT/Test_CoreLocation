//
//  LocationValuesConverterViewModel.swift
//  TestCoreLocation
//
//  Created by Elliot Knight on 14/10/2022.
//

import Foundation

class LocationValuesConverterViewModel: ObservableObject {

	func convertMeterInSecondsToKm(speed: Double) -> Double {
		return (speed * 3.6)
	}

	func convertMetersInKilometer(distanceInMeter: Double) -> String {
		let distanceInKm = (distanceInMeter < 1_000 ? distanceInMeter : (distanceInMeter / 1_000))

		return String(format: "%.2tf", distanceInKm)
	}
}
