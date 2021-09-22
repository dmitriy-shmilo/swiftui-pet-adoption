//
//  PetListItemView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 19.08.2021.
//

import SwiftUI

struct PetListItemView: View {
	
	let petImageName: String
	let mapColor: Color
	
	var body: some View {
		ZStack(alignment: .bottomTrailing) {
			
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(Color.accentColor)
				.frame(width: 50, height: 50)
				.shadow(color: .accentColor, radius: 10, x: 0, y: 0)
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(Color.panelBackground)
				.padding(.top, 50)
			
			Image(systemName: "chevron.right")
				.frame(width: 50, height: 50)
				.foregroundColor(Color.white)
				.background(Color.accentColor)
				.cornerRadius(15, corners: [.topLeft, .bottomRight])
				.overlay(
					RoundedCornersShape(radius: 15, corners: [.topLeft, .bottomRight])
						.stroke(Color.white, lineWidth: 2)
				)
			GeometryReader { geo in
				Image("map")
					.resizable()
					.scaledToFill()
					.overlay(mapColor)
					.frame(width: geo.size.width / 2, height: geo.size.height - 50.0)
					.clipShape(RoundedRectangle(cornerRadius: 15))
					.offset(x: 0, y: 50)
			}
			Image(petImageName)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.padding(.trailing, 45)
			
		}
		.frame(height: 300)
		.padding()
	}
}

struct PetListItemView_Previews: PreviewProvider {
	static var previews: some View {
		PetListItemView(petImageName:"puppy1", mapColor: Color.red.opacity(0.3))
	}
}
