//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 28/8/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("Image")
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 450)
        Image(systemName: "figure.walk")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    ImageExample()
}
