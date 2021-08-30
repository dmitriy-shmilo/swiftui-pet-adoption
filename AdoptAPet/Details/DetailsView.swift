//
//  DetailsView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct DetailsView: View {
	let pet: Pet
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State var isEmttingConfetti = false
	@State var isShowingConfirmation = false
	@State var isSharing = false
	
	func backgroundHeight(proxy: GeometryProxy) -> CGFloat {
		return max(0, 400 + proxy.frame(in: .global).minY)
	}
	
	func backgroundOffset(proxy: GeometryProxy) -> CGFloat {
		return -proxy.frame(in: .global).minY
	}
	
	var body: some View {
		ZStack {
			ScrollView {
				VStack(alignment: .center) {
					GeometryReader { proxy in
						Image("DetailsBackground")
							.resizable()
							.scaledToFill()
							.frame(
								width: proxy.size.width + 2,
								height: backgroundHeight(proxy: proxy)
							)
							.offset(x: -1, y: backgroundOffset(proxy: proxy))
					}
					DetailsBodyView(pet: pet)
						.padding(.top, -40)
				}
			}
			.background(Color.accentColor.ignoresSafeArea())
			
			VStack {
				Spacer()
					ParticleEmitterView(isEmitting: $isEmttingConfetti)
						.frame(width: 100, height: 30)
			}
			
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
					Button(action: {
						isSharing.toggle()
					}) {
						Image(systemName: "square.and.arrow.up.fill")
							.resizable()
							.foregroundColor(.white)
							.scaledToFit()
							.frame(width: 30, height: 30)
					}
					.padding()
					.sheet(isPresented: $isSharing) {
						ActivityView(title: pet.name, url: "https://github.com/dmitriy-shmilo/swiftui-pet-adoption", image: UIImage(named: pet.picture))
					}
				}
				Spacer()
				Button(action: {
					isEmttingConfetti = true
					isShowingConfirmation = true
					DispatchQueue.main.asyncAfter(
						deadline: .now() + 0.5) {
						isEmttingConfetti = false
					}
				}) {
					Text("Adopt Now")
						.font(.system(size: 18, weight: .bold, design: .rounded))
						.padding()
						.frame(maxWidth: .infinity)
				}
				.padding(.horizontal, 30)
				.buttonStyle(ActionButtonStyle())
			}
		}
		.alert(isPresented: $isShowingConfirmation) {
			Alert(title: Text("Thank you!"),
				  message: Text("\(pet.name) is on \(pet.gender == .female ? "her" : "his") way!"))
		}
		.navigationBarHidden(true)
	}
}

struct DetailsView_Previews: PreviewProvider {
	static var previews: some View {
		DetailsView(pet: ModelData.pets[0])
	}
}
