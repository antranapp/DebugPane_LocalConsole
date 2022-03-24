//
// Copyright © 2022 An Tran. All rights reserved.
//

import Combine
import Logging
import LocalConsole
import SwiftUI
import UIKit

final class ViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logger = Logger(label: "app.antran.debugpane.localconsole.log")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        let instructionLabel = UILabel()
        instructionLabel.text = "Swipe from the right edge to open the Debug Menu"
        instructionLabel.textAlignment = .center
        instructionLabel.numberOfLines = 0
        instructionLabel.font = .systemFont(ofSize: 12)
        
        let button = UIButton()
        button.setTitleColor(.tintColor, for: .normal)
        button.setTitle("LocalConsole print", for: .normal)
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)

        let logButton = UIButton()
        logButton.setTitleColor(.tintColor, for: .normal)
        logButton.setTitle("Add logs", for: .normal)
        logButton.addTarget(self, action: #selector(self.didTapLogButton), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [instructionLabel, button, logButton])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
        ])
    }
    
    @objc func didTapButton() {
        LCManager.shared.print("Button tapped")
    }

    @objc func didTapLogButton() {
        logger.info("New log message")
    }
}
