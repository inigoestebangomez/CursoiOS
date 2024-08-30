//
//  MapExample.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 30/8/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    //    este estado proporciona una posición inicial que pasamos luego como argumento en Map()
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.29087739527605, longitude:5.355565308365444 ),
            span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    )
    
    var body: some View {
        ZStack{
            MapReader{ proxy in
                
                Map(position: $position) {
//                    Marker normal:
//                    Marker("Home", coordinate: CLLocationCoordinate2D(latitude: 43.29087739527605, longitude:5.355565308365444 ))
//                    Marker personalizado:
                    Annotation("Home", coordinate: CLLocationCoordinate2D(latitude: 43.29087739527605, longitude:5.355565308365444)){
                        Circle().frame(height: 50).foregroundColor(.green)
                    }.annotationTitles(.automatic)
                }
                    .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                //                    si queremos que nos de la posición exacta al mover la ubicación del mapa
                //                .onMapCameraChange { context in
                //                    print("We´re in: \(context.region)")
                
                //                    si queremos que nos de las localizaciones constantemente:
                    .onMapCameraChange(frequency: .continuous) { context in
                        print("We´re in: \(context.region)")
                    }
                    .onTapGesture { ubication in
                        if let coordinates = proxy.convert(ubication, from: .local){
                            withAnimation{
                                position = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                                )
                            }
                        }
                    }
            }
            VStack{
                Spacer()
                HStack{
                    Button("Go to Barcelona"){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 41.405352973568796, longitude: 2.1800164721774618),
                                    span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                            )
                        }
                    }.padding(8).background(.white).padding()
                    Button("Go to Bilbao"){
                        withAnimation{
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 43.26186731827223, longitude: -2.9432338862582617),
                                    span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                            )
                        }
                    }.padding(8).background(.white).padding()
                }
            }
        }
    }
}

#Preview {
    MapExample()
}
