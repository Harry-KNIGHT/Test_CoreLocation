//
//  ContentView.swift
//  TestCoreLocation
//
//  Created by Elliot Knight on 11/10/2022.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var locationManager = LocationManager.shared
    var body: some View {
		Group {
			if locationManager.userLocation == nil {
				LocationRequestView()
			} else if let location = locationManager.userLocation {
				Text("\(location)")
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
