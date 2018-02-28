//
//  ProtectionRouteTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 31/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class ProtectionRouteTableViewCell: UITableViewCell {

    // MARK: Outltes
    @IBOutlet weak var routeImage: UIImageView!
    
    // MARK: Properties
    weak var vbgRouteDelegate: VBGRouteProtocol?
    weak var leadersRouteOneDelegate: LeadersRouteOneProtocol?
    weak var leadersRouteTwoDelegate: LeadersRouteTwoProtocol?
    var mainDelegate: MainProtocol? = AplicationRuntime.sharedManager.mainDelegate
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Acciones de navegación
    @IBAction func previousPage(_ sender: UIButton) {
        vbgRouteDelegate?.previusPage()
        leadersRouteOneDelegate?.previusPage()
        leadersRouteTwoDelegate?.previusPage()
    }
    
    @IBAction func nextPage(_ sender: UIButton?) {
        vbgRouteDelegate?.nextPage()
        leadersRouteOneDelegate?.nextPage()
        leadersRouteTwoDelegate?.nextPage()
    }

    @IBAction func endRoute(_ sender: UIButton?) {
        mainDelegate?.addToContainer(viewControllerID: .myCourses)
    }
}
