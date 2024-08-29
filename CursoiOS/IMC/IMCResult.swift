//
//  IMCResult.swift
//  CursoiOS
//
//  Created by Iñigo Esteban Gómez on 28/8/24.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("Your result").font(.title).bold().foregroundColor(.white)
            let result = calculateIMC(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

func calculateIMC(weight:Double, height:Double) -> Double{
    let result = weight/((height/100)*(height/100))
    return result
}

struct InformationView: View {
    let result:Double
    var body: some View {
        
        let information = getIMCResult(result: result)
        
        VStack{
            Text(information.0).foregroundColor(information.2).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            Text("\(result, specifier: "%.2f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Text(information.1).font(.title2).foregroundColor(.white).padding(.horizontal, 8)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgorundComponent).cornerRadius(16)
    }
}

func getIMCResult (result:Double) -> (String, String, Color) {
    let title: String
    let description:String
    let color:Color
    
    switch result{
    case 0.00...19.99:
        title = "Underweight"
        description = "You are underweight according to the recommended BMI weight"
        color = Color.red
    case 20.00...24.99:
        title = "Normal Weight"
        description = "You are at the recommended BMI weight"
        color = Color.red
    case 25.00...29.99:
        title = "Overweight"
        description = "You are above the recommended BMI weight."
        color = Color.red
    case 30.00...100:
        title = "Obesity"
        description = "You are well above the recommended BMI weight."
        color = Color.red
    default:
        title = "ERROR"
        description = "An error has occured"
        color = Color.red
    }
    
    return (title, description, color)
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 190)
}
