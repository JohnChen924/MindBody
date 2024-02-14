//
//  dateclick.swift
//  Test
//
//  Created by John Chen on 2/12/24.
//

import UIKit

class DateDetailViewController: UIViewController {
    var date: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // Set the background color for visibility

        setupUI()
    }

    private func setupUI() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // Use Auto Layout
        view.addSubview(label) // Add the label to the view hierarchy

        // Set up constraints for the label to center it in the view
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        // Configure the label's appearance and text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)

        // Format and display the date in the label
        if let dateToShow = date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            label.text = dateFormatter.string(from: dateToShow)
        } else {
            label.text = "No date selected"
        }
    }
}



