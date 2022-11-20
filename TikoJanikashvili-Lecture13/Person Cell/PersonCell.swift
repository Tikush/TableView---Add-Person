//
//  PersonCell.swift
//  TikoJanikashvili-Lecture13
//
//  Created by Tiko Janikashvili on 20.11.22.
//

import UIKit

class PersonCell: UITableViewCell {

    // MARK: - Private IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    // MARK: Set cell items
    
    func configure(with item: Person) {
        nameLabel.text = item.name
        surnameLabel.text = item.surname
        ageLabel.text = "\(item.age)"
    }
}

