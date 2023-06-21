//
//  KTuin_EmpleadosApp.swift
//  KTuin-Empleados
//
//  Created by Julio César Fernández Muñoz on 17/6/23.
//

import SwiftUI

@main
struct KTuin_EmpleadosApp: App {
    @StateObject var vm = EmpleadosVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
