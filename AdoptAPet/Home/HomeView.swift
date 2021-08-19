//
//  HomeView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 19.08.2021.
//

import SwiftUI

struct HomeView: View {
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
				
				PetListItemView(petImageName: "puppy1", mapColor: Color(#colorLiteral(red: 1, green: 0.8699016571, blue: 0.5112748742, alpha: 1)).opacity(0.3))
				PetListItemView(petImageName: "puppy2", mapColor: Color(#colorLiteral(red: 0.9935080409, green: 0.646912992, blue: 0.6816377044, alpha: 1)).opacity(0.3))
			}
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
