//
//  MenuView.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 28/8/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination:IMCView()){
                    Text("IMC Calculator")
                }
                Text("App 2")
                Text("App 3")
                Text("App 4")
            }
        }
    }
}
#Preview {
    MenuView()
}
