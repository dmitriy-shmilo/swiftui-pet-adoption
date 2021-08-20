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
