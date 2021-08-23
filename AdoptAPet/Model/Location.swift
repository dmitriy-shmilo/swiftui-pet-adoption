//
//  Location.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import Foundation

struct Location: Hashable {
	let lat: Double
	let lon: Double
}

extension Location {
	func distance(to: Location) -> Double {
		let lat1 = lat
		let lat2 = to.lat
		let lon1 = lon
		let lon2 = to.lon
		let p = Double.pi / 180.0
		let a = 0.5 - cos((lat2 - lat1) * p) / 2 + cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2
		return 12742 * asin(sqrt(a))
	}
}
