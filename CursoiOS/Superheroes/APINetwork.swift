//
//  APINetwork.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 29/8/24.
//

import Foundation

class APINetwork{
    
    //Para que sea PARSEable ponemos codable
    struct Wrapper:Codable{
        let response:String
        let results:[Superhero]
    }
    
    struct Superhero:Codable, Identifiable{
        let id:String
        let name:String
        let image:ImageSuperhero
    }
    
    struct ImageSuperhero:Codable{
        let url:String
    }
    
    struct SuperheroCompleted: Codable{
        let id:String
        let name:String
        let image:ImageSuperhero
        let powerstats: PowerStats
        let biography: Biography
    }
    
    struct PowerStats: Codable{
        let intelligence:String
        let strength:String
        let speed:String
        let durability:String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable{
        let alignment:String
        let publisher:String
        let aliases:[String]
        let fullName:String
        
        enum CodingKeys:String, CodingKey{
            case fullName = "full-name"
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }
    
    func getHeroesByQuery(query:String) async throws -> Wrapper{
        //        throws envía el error.
        let url = URL(string: "https://superheroapi.com/api/d3db86630499d4b5140dbb02a9992ee9/search/\(query)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        //        como no usamos el segundo valor, ponemos _ pero podría ser patata
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    func getHeroById(id:String) async throws -> SuperheroCompleted {
        let url = URL (string: "https://superheroapi.com/api/d3db86630499d4b5140dbb02a9992ee9/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(SuperheroCompleted.self, from: data)
    }
}
