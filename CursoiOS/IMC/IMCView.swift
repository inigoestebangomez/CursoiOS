//
//  IMCView.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 28/8/24.
//

import SwiftUI

struct IMCView: View {
    
    @State var gender:Int = 0
    @State var height:Double = 170
    @State var age:Int = 18
    @State var weight:Int = 80
    
    var body: some View {
        VStack{
            HStack {
                ToggleButton(text: "Male", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Female", imageName: "heart.fill", gender: 1, selectedGender:  $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack{
                CounterButton(text: "Age", number: $age)
                CounterButton(text: "Weight", number: $weight)
            }
            IMCCalculateButton(userWeight: Double(weight), userHeight: height)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(.backgroundApp)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("IMC Calculator").foregroundColor(.white)
                }
            }
        //            .navigationBarBackButtonHidden()
        
        
    }
}

struct IMCCalculateButton:View {
    
    let userWeight:Double
    let userHeight:Double
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: {IMCResult(userWeight: userWeight, userHeight: userHeight)}){
                Text("Calculate").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.purple).frame(maxWidth: .infinity, maxHeight: 100).background(.backgorundComponent)
            }
        }
    }
}

struct ToggleButton:View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        
        let color = if(gender == selectedGender) {
            Color.backgroundComponentSelected
        } else {
            Color.backgorundComponent
        }
        Button(action: {
            selectedGender = gender
        }) {
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                InformationText(text: text)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(color)
        }
    }
}

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText: View {
    let text: String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight:Double
    var body: some View {
        VStack{
            TitleText(text: "Height")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 150...220, step: 1).accentColor(.purple).padding(.horizontal, 16)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgorundComponent)
    }
}

struct CounterButton:View {
    let text:String
    @Binding var number:Int
    var body: some View {
        VStack{
            TitleText(text: text)
            InformationText(text: String(number))
            HStack{
                Button(action:{
                    if(number < 120) {
                        number += 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                Button(action:{
                    if(number > 0){
                        number -= 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
            }
        } .frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgorundComponent)
    }
}

#Preview {
    //ToggleButton(text: "Prueba", imageName: "heart.fill", index: 0)
    IMCView()
}
