//
//  TextExample.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 28/8/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text("Hello, World!").font(.headline)
            Text("Custom").font(.system(size: 40, weight: .light, design: .monospaced)).italic().bold().underline()
                .background(.red)
        }
    }
}

#Preview {
    TextExample()
}
