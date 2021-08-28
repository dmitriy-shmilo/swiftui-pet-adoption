//
//  HomeView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 19.08.2021.
//

import SwiftUI

struct HomeView: View {
	@State private var selectedSpecies = Species.dog
	
	var body: some View {
		NavigationView {
			ScrollView {
				VStack {
					ToolbarView()
					
					LocationHeaderView()
					
					ScrollView (.horizontal, showsIndicators: false) {
						FiltersView(selectedSpecies: $selectedSpecies)
					}
					
					let data = ModelData.getPets(species: selectedSpecies)
					if data.count > 0 {
						ForEach(data.indices) { i in
							let pet = data[i]
							NavigationLink(destination:DetailsView(pet: pet)) {
								PetListItemView(
									petImageName: pet.picture,
									mapColor: (i.isMultiple(of: 2)
												? Color.yellowBackground
												: Color.pinkBackground).opacity(0.5))
							}
						}
					}
					else
					{
						Text("No pets found around your location. Please try updating your search criteria.")
							.foregroundColor(.secondaryFont)
							.font(.system(size: 18))
							.multilineTextAlignment(.center)
							.frame(height: 100) // TODO: find out why this text collapses to a single line unless given a frame
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
