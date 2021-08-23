//
//  DetailsBodyView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct DetailsBodyView: View {
	let pet: Pet
	
	var body: some View {
		let currentLocation = Location(lat: 10.01, lon: 10.0)

		VStack {
			HStack(alignment:.top) {
				Text(pet.name)
					.font(.system(size: 40, weight: .bold, design: .rounded))
					.foregroundColor(.white)
					.padding(.top, 120)
				Image(pet.picture)
					.resizable()
					.offset(x: 60, y: 50)
					.scaledToFit()
					.frame(height:360)
					.padding(.leading, -60)
			}
			.padding(.bottom, 50)
			
			HStack {
				Image("Location")
					.resizable()
					.scaledToFit()
					.foregroundColor(.pinkBackground)
					.frame(width: 25, height:25)
					.padding(.leading, 30)
				
				let distance = currentLocation.distance(to: pet.location)
				Text("\(pet.locationDescription), \(String(format:"%.2f", distance))km away")
					.font(.system(size: 16))
					.foregroundColor(.secondaryFont)
				Spacer()
			}
			
			HStack(spacing: 30) {
				VStack (alignment: .leading) {
					HStack {
						Image("Breed")
							.resizable()
							.renderingMode(.template)
							.foregroundColor(.yellowForeground)
							.frame(width: 16, height: 16)
							.padding(7)
							.background(
								RoundedRectangle(cornerRadius: 5)
									.foregroundColor(.yellowBackground.opacity(0.3))
							)
						Text("Breed")
							.foregroundColor(.font)
							.font(
								.system(size: 20, weight: .medium, design: .rounded)
							)
					}
					Text(pet.breed)
						.foregroundColor(.font)
						.font(
							.system(size: 16, weight: .regular, design: .rounded)
						)
						.padding(.top, 5)
				}
				.padding(.leading, 30)
				
				VStack (alignment: .leading) {
					HStack {
						Image("Gender")
							.resizable()
							.renderingMode(.template)
							.foregroundColor(.pinkForeground)
							.frame(width: 16, height: 16)
							.padding(7)
							.background(
								RoundedRectangle(cornerRadius: 5)
									.foregroundColor(.pinkBackground.opacity(0.3))
							)
						Text("Gender")
							.foregroundColor(.font)
							.font(
								.system(size: 20, weight: .medium, design: .rounded)
							)
					}
					Text(pet.gender.rawValue)
						.foregroundColor(.font)
						.font(
							.system(size: 16, weight: .regular, design: .rounded)
						)
						.padding(.top, 5)
				}
				Spacer()
			}
			
			Text(pet.description)
				.foregroundColor(.secondaryFont)
				.font(
					.system(size: 16, weight: .regular, design: .rounded)
				)
				.padding(.horizontal, 30)
				.padding(.top)
			HStack(spacing: 10) {
				ForEach(pet.pictures, id: \.self) { picture in
					Image(picture)
						.resizable()
						.scaledToFill()
						.frame(width: 50, height: 50)
						.clipShape(RoundedRectangle(cornerRadius: 15))
				}
				Spacer()
			}
			.padding(.leading, 30)
			.padding(.top, 20)
		}
		.background(
			RoundedRectangle(cornerRadius: 25)
				.foregroundColor(.white)
				.offset(x: 0, y: 360)
		)
	}
}
