//
//  ContentView.swift
//  KTuin-Empleados
//
//  Created by Julio César Fernández Muñoz on 17/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm:EmpleadosVM
    
    var body: some View {
        NavigationStack {
            List(vm.empleados) { empleado in
                NavigationLink(value: empleado) {
                    EmpleadoCell(empleado: empleado)
                }
            }
            .navigationDestination(for: Empleado.self) { empleado in
                EmpleadoDetail(empleado: empleado)
            }
            .alert("Error de empleados",
                   isPresented: $vm.showAlert) {
                Button {} label: {
                    Text("OK")
                }
            } message: {
                Text(vm.message)
            }
            .navigationTitle("Empleados")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EmpleadosVM())
    }
}
