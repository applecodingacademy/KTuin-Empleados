//
//  Persistence.swift
//  KTuin-Empleados
//
//  Created by Julio César Fernández Muñoz on 17/6/23.
//

import Foundation

final class Persistence {
    static let shared = Persistence()
    
    let url = URL(string: "https://acoding.academy/testData/EmpleadosData.json")!
    let docURL = URL.documentsDirectory.appending(path: "EmpleadosData.json")
    
    private init() {}
    
    func loadEmpleados() async throws -> [Empleado] {
        if !FileManager.default.fileExists(atPath: docURL.path()) {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError(.badURL) }
            return try JSONDecoder().decode([Empleado].self, from: data)
        } else {
            let data = try Data(contentsOf: docURL)
            return try JSONDecoder().decode([Empleado].self, from: data)
        }
    }
    
    func saveEmpleados(empleados: [Empleado]) async throws {
        let data = try JSONEncoder().encode(empleados)
        try data.write(to: docURL, options: .atomic)
    }
}


