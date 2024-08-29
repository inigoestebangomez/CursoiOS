//
//  ContentView.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 27/8/24.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            } .frame( height: 100)
            
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.orange)
            HStack {
                Circle()
                    .foregroundColor(.mint)
                Rectangle()
                Circle()
                    .foregroundColor(.indigo)
            } .frame(height: 250)
            
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.orange)
            
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                
                    .foregroundColor(.orange)
                Rectangle()
                
                    .foregroundColor(.yellow)
            } .frame( height: 100)
            
        }
        .background(.red)
    }
}


#Preview {
    Exercise1()
}

