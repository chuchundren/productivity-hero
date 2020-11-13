//
//  ViewController.swift
//  productivity hero
//
//  Created by Дарья on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var defenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var manaLabel: UILabel!
    
    @IBOutlet weak var healthImageView: UIImageView!
    @IBOutlet weak var defenceImageView: UIImageView!
    @IBOutlet weak var strengthImageView: UIImageView!
    @IBOutlet weak var manaImageView: UIImageView!
    
    
    
    var hero = Hero(health: 1.0, defence: 1.0, strength: 1.0, mana: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }

    func configureLabels() {
    
        healthLabel.text = "Health: \(hero.health.round(to: 1))"
        defenceLabel.text = "Defence: \(hero.defence.round(to: 1))"
        strengthLabel.text = "Strenght: \(hero.strength.round(to: 1))"
        manaLabel.text = "Mana: \(hero.mana.round(to: 1))"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? TasksTableViewController {
            nextVC.heroVC = self
        }
    }

}

extension Float {
    func round(to digits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = digits
        formatter.minimumFractionDigits = digits
        guard let formattedString = formatter.string(for: self) else { return "" }
        return formattedString
    }
}
