//
//  MessageComposer.swift
//  conse
//
//  Created by Felipe Zamudio on 22/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation
import MessageUI


class MessageComposer: NSObject, MFMessageComposeViewControllerDelegate {
    
    var messageBody = nullString
    var textMessageRecipients: [String] = []// for pre-populating the recipients list
    weak var sendAlertDelegate: SendAlertProtocol?
    
    // A wrapper function to indicate whether or not a text message can be sent from the user's device
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    // Functions for set recipients
    func messageRecipientes(message: String, contactList: Array<String>, sendDelegate: SendAlertProtocol) {
        messageBody = message
        sendAlertDelegate = sendDelegate
        textMessageRecipients = contactList
    }
    
    // Configures and returns a MFMessageComposeViewController instance
    func configuredMessageComposeViewController() -> MFMessageComposeViewController {
        let messageComposeVC = MFMessageComposeViewController()
        messageComposeVC.messageComposeDelegate = self  //  Make sure to set this property to self, so that the controller can be dismissed!
        printDebugMessage(tag: "list \(textMessageRecipients)")
        messageComposeVC.recipients = textMessageRecipients
        messageComposeVC.body = messageBody
        return messageComposeVC
    }
    
    // MFMessageComposeViewControllerDelegate callback - dismisses the view controller when the user is finished with it
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: {

            switch result.rawValue {
            case MessageComposeResult.cancelled.rawValue:
                self.sendAlertDelegate?.dismissPopup(message: ErrorStrings.userCancelled)
            case MessageComposeResult.failed.rawValue:
                self.sendAlertDelegate?.dismissPopup(message: ErrorStrings.sendSMSFailed)
            case MessageComposeResult.sent.rawValue:
                self.sendAlertDelegate?.dismissPopup(message: ErrorStrings.sendSMSSucced)
            default:
                self.sendAlertDelegate?.dismissPopup(message: nil)
            }
        })
    }
}
