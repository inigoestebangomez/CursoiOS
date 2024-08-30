//
//  CustomDIalog.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 30/8/24.
//

import SwiftUI

struct CustomDIalog<Content:View>: View {
    
    let closeDialog:() -> Void
    let onDismissOutside:Bool
    let content: Content
    
    var body: some View {
        ZStack{
            Rectangle().fill(.gray.opacity(0.6))
                .ignoresSafeArea()
                .onTapGesture {
                    if onDismissOutside{
                        withAnimation{
                            closeDialog()
                        }
                    }
                }
            
            content.frame(
                width: UIScreen.main.bounds.size.width-100,
                height: 280)
            .padding()
            .background(.white)
            .cornerRadius(16)
            .overlay(alignment: .topTrailing){
                Button(action: {
                    withAnimation{
                        closeDialog()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                }).foregroundColor(.gray).padding(16)
            }
        }.ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.size.width,
                   height: UIScreen.main.bounds.size.height,
                   alignment: .center)
    }
}
