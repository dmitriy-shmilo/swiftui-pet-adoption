//
//  ParticleEmitterView.swift
//  AdoptAPet
//
//  Created by Dmitriy Shmilo on 27.08.2021.
//

import SwiftUI

struct ParticleEmitterView: UIViewRepresentable {
	@Binding var isEmitting:Bool
	
	init(isEmitting: Binding<Bool>) {
		_isEmitting = isEmitting
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		(uiView as! InternalParticleEmitterView).toggleLayer(isAttached: isEmitting)
	}
	
	func makeUIView(context: Context) -> some UIView {
		InternalParticleEmitterView.init()
	}
	
	private class InternalParticleEmitterView: UIView {
		private var emitterLayer: CAEmitterLayer!
		
		init() {
			super.init(frame: CGRect.zero)
			
			emitterLayer = CAEmitterLayer()
			emitterLayer.emitterShape = .circle
			emitterLayer.emitterSize = CGSize(width: 100.0, height: 100.0)
			emitterLayer.emitterCells = makeParticles()
			emitterLayer.lifetime = 1.0
			emitterLayer.birthRate = 0
		}
		
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
		
		override func layoutSubviews() {
			emitterLayer.emitterPosition = self.center
			layer.addSublayer(emitterLayer)
		}
		
		func toggleLayer(isAttached: Bool) {
			emitterLayer.birthRate = isAttached ? 1.0 : 0.0
			
			if isAttached {
				emitterLayer.emitterCells?.forEach {
					$0.beginTime = CACurrentMediaTime()
				}
			}
		}
		
		private func makeParticles() -> [CAEmitterCell] {
			(1...9).map { i in
				let cell = CAEmitterCell()
				cell.contents = UIImage(named:"particle\(i)")?.cgImage
				cell.birthRate = 150.0
				cell.lifetime = 40
				cell.lifetimeRange = 20.0
				cell.velocity = 800.0
				cell.velocityRange = 100
				cell.emissionRange = 0.6
				cell.scaleRange = 0.0
				cell.emissionLongitude = -CGFloat.pi / 2
				cell.yAcceleration = 400
				
				cell.scale = 0.2
				cell.spin = CGFloat.pi * 2
				cell.spinRange = CGFloat.pi
				return cell
			}
		}
	}
}

struct ParticleEmitterView_Previews: PreviewProvider {
	static var previews: some View {
		ParticleEmitterView(isEmitting: .constant(false))
	}
}
