//
//  CategoryButtonStyle.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct CategoryButtonStyle: ButtonStyle {
	let isDisabled: Bool
	let isActive: Bool
	
	func makeBody(configuration: Self.Configuration) -> some View {
		let backgroundColor = isActive
			? Color.accentColor
			: Color.panelBackground
		let foreGroundColor = isActive
			? Color.white
			: Color.font
		
		return configuration.label
			.font(.system(size: 11))
			.padding(8)
			.frame(width: 60, height:60)
			.background(isDisabled || configuration.isPressed
							? backgroundColor.opacity(0.3)
							: backgroundColor)
			.foregroundColor(isDisabled || configuration.isPressed
								? foreGroundColor.opacity(0.3)
								: foreGroundColor)
			.cornerRadius(15)
			.overlay(
				RoundedRectangle(cornerRadius: 15)
					.stroke(Color.white, lineWidth: 2)
			)
			.shadow(
				color: Color.accentColor.opacity(isActive ? 0.35 : 0),
				radius: 8, x: 0, y: 0)
			.padding(.vertical, 12)
	}
}

extension CategoryButtonStyle {
	init() {
		isActive = false
		isDisabled = false
	}
}
