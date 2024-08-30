//
//  FavPlaces.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 30/8/24.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    
    @State var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.29087739524189, longitude: 5.355565308361441), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
    
    @State var places: [Place] = []
//    @State var showPopUp:Bool = false
    @State var showPopUp:CLLocationCoordinate2D? = nil
    @State var name:String = ""
    @State var fav:Bool = false

    var body: some View {
        ZStack{
            MapReader{ proxy in
                Map(position: $position){
                    ForEach(places){ place in
                        Annotation(place.name, coordinate: place.coordinates){
                            let color = if place.fav {Color.yellow} else {Color.black}
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(coord, from: .local){
                            showPopUp = coordinates
                        }
                }
            }
            
            if showPopUp != nil {
                let view = VStack{
                    Text("Add Location").font(.title2).bold()
                    Spacer()
                    TextField("Name", text: $name).padding(.bottom, 8)
                    Toggle("Is a fav place?", isOn: $fav)
                    Spacer()
                    Button("Save"){
                        savePlace(name:name, fav:fav, coordinates: showPopUp!)
                        clearForm()
                    }
                }
                withAnimation{
                CustomDIalog(closeDialog: {
                    showPopUp = nil
                }, onDismissOutside: true, content: view)
                }
            }
        }
    }
    func savePlace(name:String, fav:Bool, coordinates: CLLocationCoordinate2D){
        let place = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(place)
    }
    
    func clearForm(){
        name = ""
        fav = false
        showPopUp = nil
    }
}

#Preview {
    FavPlaces()
}
