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
					ToolbarView()
					
					LocationHeaderView()
					
					ScrollView (.horizontal, showsIndicators: false) {
						FiltersView()
					}
					
					ForEach(ModelData.pets.indices) { i in
						let pet = ModelData.pets[i]
						NavigationLink(destination:DetailsView(pet: pet)) {
							PetListItemView(
								petImageName: pet.picture,
								mapColor: (i.isMultiple(of: 2)
								? Color.yellowBackground
								: Color.pinkBackground).opacity(0.5))
						}
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
