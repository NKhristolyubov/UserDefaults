//
//  NewContactViewController.swift
//  UserDefaults
//
//  Created by Nikolai Khristoliubov on 08.01.23.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    var delegate: NewContactProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        saveNewContact()
        dismiss(animated: true)
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    private func saveNewContact() {
        
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        let newContact = Contact(firstName: firstName, lastName: lastName)
        StoregeManager.shared.saveContact(contact: newContact)
        delegate.saveContact(contact: newContact)
        
    }
    
}
 
