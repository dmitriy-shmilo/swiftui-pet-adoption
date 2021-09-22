//
//  ContentView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 19.08.2021.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		HomeView()
			.preferredColorScheme(.light)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
