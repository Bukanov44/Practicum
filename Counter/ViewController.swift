//
//  ViewController.swift
//  Counter Hard
//
//  Created by Sergey Bukanov on 09.08.2024.
//

import UIKit

class ViewController: UIViewController {
    private var counter: Int = 0
    private func timeToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.text = "История изменений:\n"
    }

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var resetBotton: UIButton!
    @IBOutlet weak var minusOneButton: UIButton!
    @IBOutlet weak var plusOneButton: UIButton!

    @IBAction func plusOneDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.text += "\(timeToString()): Значение изменено на +1\n"
    }

    @IBAction func minusOneDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            historyTextView.text += "\(timeToString()): Значение изменено на -1\n"
        } else {
            historyTextView.text += "\(timeToString()): Попытка уменьшить значение счётчика ниже 0\n"
        }
    }

    @IBAction func resetDidTap(_ sender: Any) {
        counter = 0
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.text += "\(timeToString()): Значение сброшено\n"
    }
}

