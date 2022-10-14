//
//  TestCoreLocationApp.swift
//  TestCoreLocation
//
//  Created by Elliot Knight on 11/10/2022.
//

import SwiftUI

@main
struct TestCoreLocationApp: App {
	@StateObject var locationValuesConverterVM = LocationValuesConverterViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(locationValuesConverterVM)
        }
    }
}
