//
//  FiltersView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct FiltersView: View {
	@State var test = false
	var body: some View {
		HStack(spacing: 25) {
			Button(action: {}) {
				Image(systemName: "slider.horizontal.3")
					.foregroundColor(Color.accentColor)
					.font(.system(size: 20))
			}
			
			Toggle(isOn: .constant(false), label: {
				Text("Cats")
			})
			.toggleStyle(CategoryToggleStyle())
			
			Toggle(isOn: .constant(true), label: {
				Text("Dogs")
			})
			.toggleStyle(CategoryToggleStyle())
			
			Toggle(isOn: .constant(false), label: {
				Text("Birds")
			})
			.toggleStyle(CategoryToggleStyle())
			
			Toggle(isOn: .constant(false), label: {
				Text("Other")
			})
			.toggleStyle(CategoryToggleStyle())
		}
		.padding(.leading, 25)
	}
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
