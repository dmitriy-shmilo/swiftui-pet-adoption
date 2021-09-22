//
//  LocationHeaderView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct LocationHeaderView: View {
	var body: some View {
		HStack {
			Text("Location")
				.font(.headline)
				.foregroundColor(Color.secondaryFont)
				.multilineTextAlignment(.leading)
				.frame(alignment:.leading)
			Spacer()
		}
		.padding(.horizontal, 70)
		.padding(.top, 10)
		
		HStack {
			Image("Location")
				.resizable()
				.scaledToFit()
				.foregroundColor(.pinkBackground)
				.frame(width: 30, height: 30)
			Text("Odesa,")
				.font(.system(size: 40, weight: .semibold, design: .default))
				.foregroundColor(Color.font)
			Text("Ukraine")
				.font(.system(size: 40, weight: .regular, design: .default))
				.foregroundColor(Color.font)
			Spacer()
		}
		.padding(.horizontal, 25)
		.padding(.bottom, 20)
	}
}

struct LocationHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		LocationHeaderView()
	}
}
