//
//  LocationRequestView.swift
//  TestCoreLocation
//
//  Created by Elliot Knight on 11/10/2022.
//

import SwiftUI

struct LocationRequestView: View {
    var body: some View {
		ZStack {
			Color.cyan.ignoresSafeArea()

			VStack {
				Spacer()
				Image(systemName: "paperplane.circle.fill")
					.resizable()
					.scaledToFit()
					.frame(height: 150)
					.padding(.bottom, 32)



				Text("Would you like to run with your session metrics informations ?")
					.font(.system(.title2, weight: .semibold))
					.multilineTextAlignment(.center)
					.padding()
				Text("Start sharing your location with us for enjoy all app features.")
					.frame(width: 220)
					.multilineTextAlignment(.center)
					.padding()

				Spacer()

				VStack {
					Button(action: {
						LocationManager.shared.requestLocation()
 					}, label: {
						Text("Allow location")
							.padding()
							.font(.headline)
							.foregroundColor(.blue)
					})
					.frame(width: UIScreen.main.bounds.width)
					.padding(.horizontal, -50)
					.background(.white)
					.clipShape(Capsule())
					.padding()
				}
				.padding(.bottom, 32)
			}
			.foregroundColor(.white)

		}
    }
}

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
