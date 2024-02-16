//
//  ViewController.swift
//  InertialSquare
//
//  Created by Margarita Slesareva on 16.02.2024.
//

import UIKit

private enum Metrics {
    static let squareHeight: CGFloat = 100
}

final class ViewController: UIViewController {
    
    private let squareView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
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
}
