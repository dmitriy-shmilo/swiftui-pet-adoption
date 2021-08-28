//
//  Pet.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 23.08.2021.
//

import Foundation

struct Pet: Hashable, Identifiable {
	let id: Int
	let name: String
	let species: Species
	let breed: String
	let gender: Gender
	let location: Location
	let locationDescription: String
	let description: String
	let picture: String
	let pictures: [String]
}
