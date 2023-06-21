//
//  DetailVM.swift
//  KTuin-Empleados
//
//  Created by Julio César Fernández Muñoz on 21/6/23.
//

import SwiftUI

final class DetailVM: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var address = ""
    @Published var zipcode = ""
    @Published var department: Department = .accounting
    @Published var gender: Gender = .male
    @Published var username = ""
    
    var id: Int = 0
    var avatar: URL?
    
    @Published var showAlert = false
    @Published var message = ""
    
    func initData(empleado: Empleado) {
        firstName = empleado.firstName
        lastName = empleado.lastName
        email = empleado.email
        address = empleado.address
        zipcode = empleado.zipcode ?? ""
        department = empleado.department
        gender = empleado.gender
        username = empleado.username
        id = empleado.id
        avatar = empleado.avatar
    }
    
    func save() -> Empleado? {
        guard !firstName.isEmpty, !lastName.isEmpty, !username.isEmpty,
              !email.isEmpty, !address.isEmpty, let avatar else {
            message = "Los nombres, usuario, email y dirección no pueden estar vacíos."
            showAlert.toggle()
            return nil
        }
        return Empleado(id: id,
                        username: username,
                        firstName: firstName,
                        lastName: lastName,
                        gender: gender,
                        email: email,
                        department: department,
                        address: address,
                        avatar: avatar,
                        zipcode: zipcode)
    }
}
