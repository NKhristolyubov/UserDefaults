//
//  ContactModel.swift
//  UserDefaults
//
//  Created by Nikolai Khristoliubov on 08.01.23.
//

import Foundation

struct Contact: Codable {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
