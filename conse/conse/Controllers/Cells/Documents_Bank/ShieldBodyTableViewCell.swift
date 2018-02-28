//
//  ShieldBodyTableViewswift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import MessageUI

class ShieldBodyTableViewCell: UITableViewCell, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var img_address: UIImageView!
    @IBOutlet weak var img_email: UIImageView!
    @IBOutlet weak var img_mobile: UIImageView!
    @IBOutlet weak var img_phone: UIImageView!
    @IBOutlet weak var img_twitter: UIImageView!
    
    @IBOutlet weak var lbl_address: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_mobile: UILabel!
    @IBOutlet weak var lbl_phone: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_twitter: UILabel!
    
    @IBOutlet weak var view_address: UIView!
    @IBOutlet weak var view_email: UIView!
    @IBOutlet weak var view_mobile: UIView!
    @IBOutlet weak var view_phone: UIView!
    @IBOutlet weak var view_twitter: UIView!

    @IBOutlet weak var constraint_telephone: NSLayoutConstraint!
    @IBOutlet weak var constraint_address: NSLayoutConstraint!
    @IBOutlet weak var constraint_mobile: NSLayoutConstraint!
    @IBOutlet weak var constraint_email: NSLayoutConstraint!
    @IBOutlet weak var constraint_twitter: NSLayoutConstraint!
    
    // MARK: - Properties
    private var corporateItem: CorporatePhoneBook!
    private var emailTag = 0
    private var mobileTag = 1
    private var telephoneTag = 2
    
    let heigthConstraint: CGFloat = 42
    let noHeigthConstraint: CGFloat = 0
    var parentView: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(item: CorporatePhoneBook) {
        corporateItem = item
        
        // NAME
        if item.name != nil, !item.name.isEmpty {
            lbl_title.text = item.name
        }
        else {
            lbl_title.text = nullString
        }
        
        // PHONE
        if (item.phone != nil && !item.phone.isEmpty) {
            constraint_telephone.constant = heigthConstraint
            lbl_phone.text = item.phone
            view_phone.isHidden = false
            
            let phoneTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedView))
            view_phone.tag = telephoneTag
            view_phone.addGestureRecognizer(phoneTap)
        }
        else {
            constraint_telephone.constant = noHeigthConstraint
            view_phone.isHidden = true
        }
        
        // ADDRESS
        if (item.address != nil && !item.address.isEmpty) {
            constraint_address.constant = heigthConstraint
            lbl_address.text = item.address
            view_address.isHidden = false
        }
        else {
            constraint_address.constant = noHeigthConstraint
            view_address.isHidden = true
        }
        
        // MOBILE PHONE
        if (item.mobile_phone != nil && !item.mobile_phone.isEmpty) {
            constraint_mobile.constant = heigthConstraint
            lbl_mobile.text = item.mobile_phone
            view_mobile.isHidden = false
            
            let mobileTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedView))
            view_mobile.tag = mobileTag
            view_mobile.addGestureRecognizer(mobileTap)
        }
        else {
            constraint_mobile.constant = noHeigthConstraint
            view_mobile.isHidden = true
        }
        
        // EMAIL
        if (item.email != nil && !item.email.isEmpty) {
            constraint_email.constant = heigthConstraint
            lbl_email.text = item.email
            view_email.isHidden = false
            
            let emailTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedView))
            view_email.tag = emailTag
            view_email.addGestureRecognizer(emailTap)
        }
        else {
            constraint_email.constant = noHeigthConstraint
            view_email.isHidden = true
        }
        
        // TWITTER
        if (item.twitter != nil && !item.twitter.isEmpty) {
            constraint_twitter.constant = heigthConstraint
            lbl_twitter.text = item.twitter
            view_twitter.isHidden = false
        }
        else {
            constraint_twitter.constant = noHeigthConstraint
            view_twitter.isHidden = true
        }
    }
    
    // MARK: Actions
    @objc func tappedView (sender: UITapGestureRecognizer) {
        
        let senderView = sender.view!
        let senderTag = senderView.tag
        
        switch senderTag {
            
        case emailTag:
            
            if MFMailComposeViewController.canSendMail() {
                
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([corporateItem.email])
                
                parentView?.present(mail, animated: true, completion: nil)
            } else {
                // show failure alert
            }
            
            break
            
        case mobileTag:
            parentView?.makeCall(forNumber: corporateItem.mobile_phone)
            break
            
        case telephoneTag:
            parentView?.makeCall(forNumber: corporateItem.phone)
            break
            
        default:
            break
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

}
