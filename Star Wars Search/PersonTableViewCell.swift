//
//  PersonTableViewCell.swift
//  Star Wars Search
//
//  Created by Ilgar Ilyasov on 11/26/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    private func updateView() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        birthYearLabel.text = person.birthYear
        heightLabel.text = "\(person.height/100)"
        eyeColorLabel.text = person.eyeColor
    }
    
    @objc var person: IIIPerson? {
        didSet { updateView() }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
}
