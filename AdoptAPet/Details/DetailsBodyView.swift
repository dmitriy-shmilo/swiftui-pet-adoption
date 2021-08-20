//
//  DetailsBodyView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct DetailsBodyView: View {
	var body: some View {
		VStack {
			HStack(alignment:.top) {
				Text("Boots")
					.font(.system(size: 40, weight: .bold, design: .rounded))
					.foregroundColor(.white)
					.padding(.top, 120)
				Image("Puppy1")
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
				
				Text("Odesa, Ukraine, 1.5km away")
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
					Text("Probably Maltese")
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
					Text("Male")
						.foregroundColor(.font)
						.font(
							.system(size: 16, weight: .regular, design: .rounded)
						)
						.padding(.top, 5)
				}
				Spacer()
			}
			
			Text("Boots is probably a maltese or australian shepherd, at least that's what online dog breed recognition tool told me. Named after Boots from \"Thy Servant a Dog\" by Rudyard Kipling.")
				.foregroundColor(.secondaryFont)
				.font(
					.system(size: 16, weight: .regular, design: .rounded)
				)
				.padding(.horizontal, 30)
				.padding(.top)
			HStack(spacing: 10) {
				Image("Puppy1-1")
					.resizable()
					.scaledToFill()
					.frame(width: 50, height: 50)
					.clipShape(RoundedRectangle(cornerRadius: 15))
				Image("Puppy1-2")
					.resizable()
					.scaledToFill()
					.frame(width: 50, height: 50)
					.clipShape(RoundedRectangle(cornerRadius: 15))
				Image("Puppy1-3")
					.resizable()
					.scaledToFill()
					.frame(width: 50, height: 50)
					.clipShape(RoundedRectangle(cornerRadius: 15))
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
