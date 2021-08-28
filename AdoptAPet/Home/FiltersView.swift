//
//  FiltersView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct FiltersView: View {
	@Binding var selectedSpecies:Species
	
	var body: some View {
		HStack(spacing: 25) {
			Button(action: {}) {
				Image(systemName: "slider.horizontal.3")
					.foregroundColor(Color.accentColor)
					.font(.system(size: 20))
			}
			
			Toggle(isOn: .constant(selectedSpecies == .cat), label: {
				Text("Cats")
			})
			.toggleStyle(CategoryToggleStyle{
				selectedSpecies = .cat
			})
			
			Toggle(isOn: .constant(selectedSpecies == .dog), label: {
				Text("Dogs")
			})
			.toggleStyle(CategoryToggleStyle{
				selectedSpecies = .dog
			})
			
			Toggle(isOn: .constant(selectedSpecies == .bird), label: {
				Text("Birds")
			})
			.toggleStyle(CategoryToggleStyle{
				selectedSpecies = .bird
			})
			
			Toggle(isOn: .constant(selectedSpecies == .other), label: {
				Text("Other")
			})
			.toggleStyle(CategoryToggleStyle{
				selectedSpecies = .other
			})
		}
		.padding(.leading, 25)
	}
}

struct FiltersView_Previews: PreviewProvider {
	static var previews: some View {
		FiltersView(selectedSpecies: .constant(.dog))
	}
}
