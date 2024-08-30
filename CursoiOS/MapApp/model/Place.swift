//
//  Place.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 30/8/24.
//

import Foundation
import MapKit

struct Place:Identifiable{
    let id = UUID()
    
    var name:String
    var coordinates: CLLocationCoordinate2D
    var fav:Bool
}
