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
                NavigationLink(destination: SuperheroSearcher()){
                    Text("SuperHero Searcher")
                }
                NavigationLink(destination: FavPlaces()){
                    Text("Map App")
                }
            }
        }
    }
}
#Preview {
    MenuView()
}
