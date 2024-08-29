//
//  SuperheroSearcher.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 29/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcher: View {
    @State var superheroName: String = ""
    @State var wrapper:APINetwork.Wrapper? = nil
    @State var loading:Bool = false
    var body: some View {
        VStack{
            TextField("", text: $superheroName, prompt:
                        Text("Search Here")
                .font(.title3)
                .foregroundColor(.gray))
            .foregroundColor(.white)
            .padding(16)
            .border(.purple, width: 1.5)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                loading = true
                print(superheroName)
                Task{
//                    permite ejecutar procesos asíncronos
                    do{
                       wrapper = try await APINetwork().getHeroesByQuery(query: superheroName)
                    } catch {
                        print("error")
                    }
                    loading=false
                }
            }
            if loading {
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in
                    ZStack {
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: SuperheroDetails(id: superhero.id)){EmptyView().opacity(0)}
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct SuperheroItem: View {
    let superhero: APINetwork.Superhero
    var body: some View {
        ZStack{
//            superhero.image.url
            Rectangle()
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack {
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(20)
    }
}

#Preview {
    SuperheroSearcher()
}
