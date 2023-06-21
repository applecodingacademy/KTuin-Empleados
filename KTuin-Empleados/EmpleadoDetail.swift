//
//  EmpleadoDetail.swift
//  KTuin-Empleados
//
//  Created by Julio César Fernández Muñoz on 17/6/23.
//

import SwiftUI

struct EmpleadoDetail: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm:EmpleadosVM
    @ObservedObject var detailVM = DetailVM()
    let empleado: Empleado
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    Text("Nombre")
                        .bold()
                    TextField("Introduzca nombre", text: $detailVM.firstName)
                        .textContentType(.name)
                }
                VStack(alignment: .leading) {
                    Text("Last name")
                        .bold()
                    TextField("Introduzca apellido", text: $detailVM.lastName)
                        .textContentType(.familyName)
                }
                VStack(alignment: .leading) {
                    Text("Email")
                        .bold()
                    TextField("Introduzca email", text: $detailVM.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textCase(.lowercase)
                }
                Picker(selection: $detailVM.gender) {
                    ForEach(Gender.allCases) { gender in
                        Text(gender.rawValue)
                            .tag(gender)
                    }
                } label: {
                    Text("Género")
                }
                VStack(alignment: .leading) {
                    Text("Dirección")
                        .bold()
                    TextField("Introduzca dirección", text: $detailVM.address)
                        .textContentType(.fullStreetAddress)
                }
                VStack(alignment: .leading) {
                    Text("Código postal")
                        .bold()
                    TextField("Introduzca código postal", text: $detailVM.zipcode)
                        .textContentType(.postalCode)
                }
            } header: {
                Text("Datos personales")
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("Usuario")
                        .bold()
                    TextField("Introduzca usuario", text: $detailVM.username)
                        .textContentType(.username)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                }
                Picker(selection: $detailVM.department) {
                    ForEach(Department.allCases) { dpto in
                        Text(dpto.rawValue)
                            .tag(dpto)
                    }
                } label: {
                    Text("Department")
                }
            } header: {
                Text("Datos de la empresa")
            }
        }
        .navigationTitle("Detalle de empleado")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    if let save = detailVM.save() {
                        vm.update(empleado: save)
                        dismiss()
                    }
                } label: {
                    Text("Grabar")
                }
            }
        }
        .alert("Alerta de datos",
               isPresented: $detailVM.showAlert) {
            Button {} label: {
                Text("OK")
            }
        } message: {
            Text(detailVM.message)
        }
        .onAppear {
            detailVM.initData(empleado: empleado)
        }
    }
}

struct EmpleadoDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EmpleadoDetail(empleado: .test)
                .environmentObject(EmpleadosVM())
        }
    }
}
