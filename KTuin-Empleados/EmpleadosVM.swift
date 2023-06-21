//
//  EmpleadosVM.swift
//  KTuin-Empleados
//
//  Created by Julio César Fernández Muñoz on 17/6/23.
//

import SwiftUI

final class EmpleadosVM: ObservableObject {
    let persistence = Persistence.shared
    
    @Published var empleados: [Empleado] = [] {
        didSet {
            Task { await saveEmpleados() }
        }
    }
    
    @Published var showAlert = false
    @Published var message = ""
    
    init() {
        Task { await getEmpleados() }
    }
    
    @MainActor func getEmpleados() async {
        do {
            empleados = try await persistence.loadEmpleados()
        } catch {
            message = error.localizedDescription
            showAlert.toggle()
        }
    }
    
    func saveEmpleados() async {
        do {
            try await persistence.saveEmpleados(empleados: empleados)
        } catch {
            message = error.localizedDescription
            showAlert.toggle()
        }
    }
    
    func update(empleado: Empleado) {
        if let index = empleados.firstIndex(where: { $0.id == empleado.id }) {
            empleados[index] = empleado
        }
    }
}

