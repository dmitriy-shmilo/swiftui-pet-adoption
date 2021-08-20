//
//  FiltersView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct FiltersView: View {
	var body: some View {
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
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
