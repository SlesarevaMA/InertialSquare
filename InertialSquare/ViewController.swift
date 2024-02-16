//
//  ViewController.swift
//  InertialSquare
//
//  Created by Margarita Slesareva on 16.02.2024.
//

import UIKit

private enum Metrics {
    static let squareHeight: CGFloat = 100
    static let cornerRaius: CGFloat = 10
}

final class ViewController: UIViewController {
    
    private var animator: UIDynamicAnimator?
    private var collision: UICollisionBehavior?
    private var snap: UISnapBehavior?
    
    private let squareView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureAnimator()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let locationPoint = touch.location(in: view)
        moveSquare(point: locationPoint)
    }
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(squareView)
        
        squareView.backgroundColor = .systemBlue
        
        let x = (view.frame.width - Metrics.squareHeight) / 2
        let y = (view.frame.height - Metrics.squareHeight) / 2

        squareView.frame = CGRect(x: x, y: y, width: Metrics.squareHeight, height: Metrics.squareHeight)
        squareView.layer.cornerRadius = 10
    }
    
    private func configureAnimator() {
        animator = UIDynamicAnimator(referenceView: view)
        
        collision = UICollisionBehavior(items: [squareView])
        collision?.translatesReferenceBoundsIntoBoundary = true
        
        if let collision {
            animator?.addBehavior(collision)
        }
    }
    
    private func moveSquare(point: CGPoint) {
        if let snap {
            animator?.removeBehavior(snap)
        }
        
        snap = UISnapBehavior(item: squareView, snapTo: point)
        
        if let snap {
            animator?.addBehavior(snap)
        }
    }
}
