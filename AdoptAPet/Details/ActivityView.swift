//
//  ActivityView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 30.08.2021.
//

import SwiftUI


struct ActivityView: UIViewControllerRepresentable {
	typealias UIViewControllerType = UIActivityViewController
	
	let title: String
	let url: String
	let image: UIImage?
	
	func makeUIViewController(context: Context) -> UIActivityViewController {
		if let url = URL(string: url) {
			let activityViewController = UIActivityViewController(activityItems: [title, url, image ?? UIImage(named: "AppIcon")!] as [Any], applicationActivities: nil)
			activityViewController.excludedActivityTypes = [.addToReadingList, .airDrop, .assignToContact, .openInIBooks]
			//activityViewController.popoverPresentationController?.sourceView = sender
			return activityViewController
		}
		fatalError()
	}
	
	func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
		
	}
}

struct ActivityView_Previews: PreviewProvider {
	static var previews: some View {
		ActivityView(title: "Adopt A Pet", url: "http://example.com", image: UIImage(named: "Puppy1"))
	}
}
