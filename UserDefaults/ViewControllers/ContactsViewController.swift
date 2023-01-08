//
//  ContactsViewController.swift
//  UserDefaults
//
//  Created by Nikolai Khristoliubov on 08.01.23.
//

import UIKit

protocol NewContactProtocol {
    func saveContact(contact: Contact)
}

class ContactsViewController: UITableViewController {
    
    let reuseIdentifier = "contactCell"
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = StoregeManager.shared.fetchContact()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newContactVC = segue.destination as? NewContactViewController else { return }
        newContactVC.delegate = self
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.fullName
        cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deletAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            StoregeManager.shared.deletContact(at: indexPath.row)
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return UISwipeActionsConfiguration(actions: [deletAction])
    }

}

extension ContactsViewController: NewContactProtocol {
    func saveContact(contact: Contact) {
        self.contacts.append(contact)
        
        tableView.reloadData()
    }
    
}
