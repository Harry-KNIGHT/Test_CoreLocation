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
}
