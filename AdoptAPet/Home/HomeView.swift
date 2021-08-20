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
						Button(action: {}) {
							Image("Profile")
								.resizable()
								.frame(width: 40, height: 40)
								.overlay(
									RadialGradient(
										gradient: Gradient(
											colors: [
												.black.opacity(0), .black.opacity(0.3)
											]),
										center: .center,
										startRadius: 10,
										endRadius: 25
									)
								)
								.clipShape(Circle())
						}
						Spacer()
						Button(action: {}) {
							Image(systemName:"square.grid.2x2")
								.foregroundColor(Color.accentColor)
								.font(.system(size: 20))
						}
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
					
					ScrollView (.horizontal, showsIndicators: false) {
						HStack(spacing: 25) {
							Button(action: {}) {
								Image(systemName: "slider.horizontal.3")
									.foregroundColor(Color.accentColor)
									.font(.system(size: 20))
							}
							
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
						PetListItemView(petImageName: "Puppy1", mapColor: .yellowBackground.opacity(0.5))
					}
					
					NavigationLink(destination:DetailsView()) {
						PetListItemView(petImageName: "Puppy2", mapColor: .pinkBackground.opacity(0.5))
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
