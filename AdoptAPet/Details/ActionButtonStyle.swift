//
//  ActionButtonStyle.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
	let isDisabled: Bool
	
	func makeBody(configuration: Self.Configuration) -> some View {
		let backgroundColor = Color.accentColor
		let foreGroundColor = Color.white
		
		return configuration.label
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
				color: Color.accentColor.opacity(0.35),
				radius: 8, x: 0, y: 0)
			.padding(.vertical, 12)
	}
}

extension ActionButtonStyle {
	init() {
		isDisabled = false
	}
}
