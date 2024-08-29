//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 28/8/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola") {
           print("Holiwi")
        }
        Button(action: {print("Holiwi")}, label: {
            Text("Hola")
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
        })
        
    }
}

struct Counter: View {
    
    @State var subscribersNumber = 0
    
    var body: some View {
        Button(action: { subscribersNumber += 1}, label: {
            Text("Subscribe: \(subscribersNumber)")
                .bold()
                .frame( height: 40)
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(15)
        })
    }
}

#Preview {
    Counter()
}
