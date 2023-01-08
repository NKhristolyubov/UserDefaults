//
//  StorageManager.swift
//  UserDefaults
//
//  Created by Nikolai Khristoliubov on 08.01.23.
//

import Foundation

class StoregeManager {
    
    static let shared = StoregeManager()
    
    private let userDefaults = UserDefaults.standard
    private let contactKey = "contacts"
    
    private init() {}
    
    func saveContact(contact: Contact) {
        var contacts = fetchContact()
        contacts.append(contact)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactKey)
    }
    
    func fetchContact() -> [Contact] {
        
        guard let data = userDefaults.object(forKey: contactKey) as? Data else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func deletContact(at index: Int) {
        var contacts = fetchContact()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: contactKey)
        
    }
    
}
