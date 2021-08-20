//
//  HomeView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 19.08.2021.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		NavigationView {
			ScrollView {
				VStack {
					HStack {
						Image(systemName:"person.circle.fill")
							.foregroundColor(.yellow)
							.font(.system(size: 40))
						Spacer()
						Image(systemName:"square.grid.2x2")
							.foregroundColor(Color.accentColor)
							.font(.system(size: 20))
					}
					.padding(.horizontal, 25)
					
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
						Text("California,")
							.font(.system(size: 40, weight: .semibold, design: .default))
							.foregroundColor(Color.font)
						Text("US")
							.font(.system(size: 40, weight: .regular, design: .default))
							.foregroundColor(Color.font)
						Spacer()
					}
					.padding(.horizontal, 25)
					.padding(.bottom, 20)
					
					ScrollView (.horizontal, showsIndicators: false) {
						HStack(spacing: 25) {
							Image(systemName: "slider.horizontal.3")
								.foregroundColor(Color.accentColor)
								.font(.system(size: 20))
							
							
							Button(action: {}) {
								Text("Cats")
							}
							.buttonStyle(CategoryButtonStyle())
							
							Button(action: {}) {
								Text("Dogs")
							}
							.buttonStyle(
								CategoryButtonStyle(
									isDisabled: false, isActive: true
								)
							)
							
							Button(action: {}) {
								Text("Birds")
							}
							.buttonStyle(CategoryButtonStyle())
							
							Button(action: {}) {
								Text("Other").font(.system(size: 10))
							}
							.buttonStyle(CategoryButtonStyle())
						}
						.padding(.leading, 25)
					}
					
					NavigationLink(destination:DetailsView()) {
						PetListItemView(petImageName: "Puppy1", mapColor: .yellowBackground.opacity(0.3))
					}
					
					NavigationLink(destination:DetailsView()) {
						PetListItemView(petImageName: "Puppy2", mapColor: .pinkBackground.opacity(0.3))
					}
				}
			}
			.navigationBarHidden(true)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
