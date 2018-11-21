//
//  ViewController.swift
//  SiriTest
//
//  Created by Giuseppe Travasoni on 15/11/2018.
//  Copyright © 2018 Travasoni. All rights reserved.
//

import UIKit
import IntentsUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let button = INUIAddVoiceShortcutButton(style: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        button.center = view.center
        let userActivity = NSUserActivity(activityType: "Example NSUserActivity")
        userActivity.suggestedInvocationPhrase = "This is just an example"
        button.shortcut = INShortcut(userActivity: userActivity)
        button.delegate = self
    }
}

extension ViewController: INUIAddVoiceShortcutButtonDelegate {
    
    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

extension ViewController: INUIAddVoiceShortcutViewControllerDelegate, INUIEditVoiceShortcutViewControllerDelegate {
    
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
