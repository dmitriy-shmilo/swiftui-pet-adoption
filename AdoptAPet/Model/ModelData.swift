//
//  ModelData.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import Foundation

struct ModelData {
	static var pets: [Pet] = [
		.init(
			id: 1,
			name: "Boots",
			species: .dog,
			breed: "Probably Maltese",
			gender: .male,
			location: Location(lat:10.0, lon: 10.0),
			locationDescription: "Odesa, Ukraine",
			description: "Boots is probably a maltese or australian shepherd, at least that's what online dog breed recognition tool told me. Named after Boots from \"Thy Servant a Dog\" by Rudyard Kipling.",
			picture: "Puppy1",
			pictures: ["Puppy1-1", "Puppy1-2", "Puppy1-3"]
		),
		.init(
			id: 2,
			name: "Peach",
			species: .dog,
			breed: "No Idea",
			gender: .female,
			location: Location(lat:10.0, lon: 10.0),
			locationDescription: "Odesa, Ukraine",
			description: "Peach is a playful and kind girl. Loves her toys. Allergic to cats.",
			picture: "Puppy2",
			pictures: []
		),
	]
	
	static func getPets(species: Species) -> [Pet] {
		pets.filter { $0.species == species }
	}
}
