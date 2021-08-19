//
//  ContentView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 19.08.2021.
//

import SwiftUI

extension Color {
	static var fontColor: Color {
		Color("FontColor")
	}
	
	static var secondaryFontColor: Color {
		Color("SecondaryFontColor")
	}
	
	static var panelBackgroundColor: Color {
		Color("PanelBackgroundColor")
	}
}

// https://stackoverflow.com/a/58606176
struct RoundedCorners: Shape {
	
	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners
	
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}

extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape(RoundedCorners(radius: radius, corners: corners) )
	}
}

struct CategoryButtonStyle: ButtonStyle {
	let isDisabled: Bool
	let isActive: Bool
	
	func makeBody(configuration: Self.Configuration) -> some View {
		let backgroundColor = isActive
			? Color.accentColor
			: Color.panelBackgroundColor
		let foreGroundColor = isActive
			? Color.white
			: Color.fontColor
		
		return configuration.label
			.font(.system(size: 11))
			.padding(8)
			.frame(width: 60, height:60)
			.background(isDisabled || configuration.isPressed
							? backgroundColor.opacity(0.3)
							: backgroundColor)
			.foregroundColor(isDisabled || configuration.isPressed
								? foreGroundColor.opacity(0.3)
								: foreGroundColor)
			.cornerRadius(15)
			.overlay(
				RoundedRectangle(cornerRadius: 15)
					.stroke(Color.white, lineWidth: 2)
			)
			.shadow(
				color: Color.accentColor.opacity(isActive ? 0.35 : 0),
				radius: 8, x: 0, y: 0)
			.padding(.vertical, 12)
	}
}

extension CategoryButtonStyle {
	init() {
		isActive = false
		isDisabled = false
	}
}

struct ContentView: View {
	var body: some View {
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
						.foregroundColor(Color.secondaryFontColor)
						.multilineTextAlignment(.leading)
						.frame(alignment:.leading)
					Spacer()
				}
				.padding(.horizontal, 70)
				.padding(.top, 10)
				
				HStack {
					Image(systemName:"location.circle.fill")
						.foregroundColor(Color(#colorLiteral(red: 0.9931250215, green: 0.562638998, blue: 0.6007267237, alpha: 1)))
						.font(.system(size: 30))
						.rotationEffect(Angle(degrees: 45))
					Text("California,")
						.font(.system(size: 40, weight: .semibold, design: .default))
						.foregroundColor(Color.fontColor)
					Text("US")
						.font(.system(size: 40, weight: .regular, design: .default))
						.foregroundColor(Color.fontColor)
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
				
				PetListItem(petImageName: "puppy1", mapColor: Color(#colorLiteral(red: 1, green: 0.8699016571, blue: 0.5112748742, alpha: 1)).opacity(0.3))
				PetListItem(petImageName: "puppy2", mapColor: Color(#colorLiteral(red: 0.9935080409, green: 0.646912992, blue: 0.6816377044, alpha: 1)).opacity(0.3))
			}
		}
		
	}
}

struct PetListItem: View {
	
	let petImageName: String
	let mapColor: Color
	
	var body: some View {
		ZStack(alignment: .bottomTrailing) {
			
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(Color.accentColor)
				.frame(width: 50, height: 50)
				.shadow(color: .accentColor, radius: 10, x: 0, y: 0)
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(Color.panelBackgroundColor)
				//.aspectRatio(16.0 / 9.0, contentMode: .fit)
				.padding(.top, 50)
			
			Image(systemName: "chevron.right")
				.frame(width: 50, height: 50)
				.foregroundColor(Color.white)
				.background(Color.accentColor)
				.cornerRadius(15, corners: [.topLeft, .bottomRight])
				.overlay(
					RoundedCorners(radius: 15, corners: [.topLeft, .bottomRight])
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

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
