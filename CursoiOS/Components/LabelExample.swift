//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 28/8/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label(
            title: { Text("Label") },
            icon: { Image("Image")
                    .resizable()
                    .scaledToFit()
                .frame(height: 250) }
        )
    }
}

#Preview {
    LabelExample()
}
