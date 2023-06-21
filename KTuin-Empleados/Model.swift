//
//  Model.swift
//  KTuin-Empleados
//
//  Created by Julio César Fernández Muñoz on 17/6/23.
//

import Foundation

// MARK: - Empleado
struct Empleado: Codable, Identifiable, Hashable {
    let id: Int
    let username, firstName, lastName: String
    let gender: Gender
    let email: String
    let department: Department
    let address: String
    let avatar: URL
    let zipcode: String?

    enum CodingKeys: String, CodingKey {
        case id, username
        case firstName = "first_name"
        case lastName = "last_name"
        case gender, email, department, address, avatar, zipcode
    }
}

enum Department: String, Codable, Identifiable, CaseIterable {
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
    
    var id: Self { self }
}

enum Gender: String, Codable, Identifiable, CaseIterable {
    case female = "Female"
    case male = "Male"
    
    var id: Self { self }
}

extension Empleado {
    static let test = Empleado(id: 1, username: "jcfmunoz", firstName: "Julio César", lastName: "Fernández Muñoz", gender: .male, email: "jcfmunoz@icloud.com", department: .engineering, address: "", avatar: URL(string: "https://pbs.twimg.com/profile_images/1017076264644022272/tetffw3o_400x400.jpg")!, zipcode: nil)
}
