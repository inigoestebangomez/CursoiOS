//
//  ListExample.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 29/8/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmilion"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "AristiDevs")
]
var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Gabumon"),
    Digimon(name: "Garurumon")
    
]

struct ListExample: View {
    var body: some View {
        //        List{
        //            Text("Prueba")
        //            Text("Prueba")
        //            Text("Prueba")
        //        }
        
        //        List{
        //            ForEach(pokemons, id:\.name) { pokemon in
        //                /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
        //            }
        //        }
        
        //        List(digimons){ digimon in
        //            Text(digimon.name)
        //        }
        
        //        List{
        //            ForEach(digimons){digimon in
        //                Text(digimon.name)
        //
        //            }
        //        }
        
        List{
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id:\.name) { pokemon in
                    /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
                }
            }
            Section(header: Text("Digimons")) {
                ForEach(digimons){digimon in
                    Text(digimon.name)
                }
            }
        }.listStyle(.automatic)
        
    }
}

struct Pokemon{
    let name:String
}

struct Digimon: Identifiable{
//    el id lo ponemos aquí
    var id = UUID()
    let name:String
}

#Preview {
    ListExample()
}
