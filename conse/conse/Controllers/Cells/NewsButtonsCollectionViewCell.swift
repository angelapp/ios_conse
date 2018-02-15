//
//  NewsButtonsCollectionViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 14/02/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class NewsButtonsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var tab_button: UIButton!
    
    // MARK: - Properties
    var newsDelegate: NewsProtocol?
    
    // MARK: - Functions
    func setButtonTitle(title: String) {
        tab_button.setTitle(title, for: .normal)
        tab_button.setTitle(title, for: .highlighted)
        tab_button.setTitle(title, for: .selected)
    }
    
    // MARK: - Actions
    @IBAction func actionButton(_ sender: UIButton){
        newsDelegate?.changeCitySelected(inPosition: tab_button.tag)
    }
}
