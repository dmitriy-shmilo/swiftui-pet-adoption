//
//  CategoryButtonStyle.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct CategoryToggleStyle: ToggleStyle {
	let isDisabled: Bool
	let onTap: (() -> Void)?
	
	func makeBody(configuration: Self.Configuration) -> some View {
		let backgroundColor = configuration.isOn
			? Color.accentColor
			: Color.panelBackground
		let foreGroundColor = configuration.isOn
			? Color.white
			: Color.font
		
		return configuration.label
			.font(.system(size: 11))
			.padding(8)
			.frame(width: 60, height:60)
			.background(isDisabled
							? backgroundColor.opacity(0.3)
							: backgroundColor)
			.foregroundColor(isDisabled
								? foreGroundColor.opacity(0.3)
								: foreGroundColor)
			.cornerRadius(15)
			.overlay(
				RoundedRectangle(cornerRadius: 15)
					.stroke(Color.white, lineWidth: 2)
			)
			.shadow(
				color: Color.accentColor.opacity(configuration.isOn ? 0.35 : 0),
				radius: 8, x: 0, y: 0)
			.padding(.vertical, 12)
			.onTapGesture {
				if !isDisabled {
					if let onTap = onTap {
						onTap()
					} else {
						configuration.isOn.toggle()
					}
				}
			}
			.animation(.easeIn.speed(2.0))
	}
}

extension CategoryToggleStyle {
	init() {
		isDisabled = false
		onTap = nil
	}
	
	init(onTap: @escaping () -> Void) {
		isDisabled = false
		self.onTap = onTap
	}
}
