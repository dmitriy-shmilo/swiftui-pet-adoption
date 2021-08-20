//
//  DetailsView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct DetailsView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

	var body: some View {
		ZStack {
			ScrollView {
				ZStack(alignment: .top) {
					Color.accentColor
					Image("DetailsBackground")
						.resizable()
						.scaledToFit()
					DetailsBodyView()
				}
			}
			.ignoresSafeArea()
			
			VStack {
				HStack {
					Button(action: {
						presentationMode.wrappedValue.dismiss()
					}) {
						Image(systemName: "chevron.left.circle.fill")
							.resizable()
							.foregroundColor(.white)
							.scaledToFit()
							.frame(width: 30, height: 30)
					}
					.padding()
					Spacer()
				}
				Spacer()
				Button(action: {}) {
					Text("Adopt Now")
						.font(.system(size: 18, weight: .bold, design: .rounded))
						.padding()
						.frame(maxWidth: .infinity)
				}
				.padding(.horizontal, 30)
				.buttonStyle(ActionButtonStyle())
			}
		}
		.navigationBarHidden(true)
	}
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
