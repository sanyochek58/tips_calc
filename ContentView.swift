//
//  ContentView.swift
//  Calc_money
//
//  Created by Александр Бураев on 24.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0,5,10,15,20]
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount/100*tipSelection
        
        let grandtotal = orderAmount + tipValue
        let amountPerson = grandtotal/peopleCount
        
        return amountPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount ", text: $checkAmount)
                    Picker("number of people" , selection: $numberOfPeople){
                        ForEach(2..<10){
                            Text("\($0) people")
                        }
                    }
                }
                Section(header : Text("Сколько чаевых вы хотите оставить ?")){
                    Picker("Tip percentage",selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("\(totalPerPerson , specifier: "%.2f")")
                }
            }.navigationBarTitle("Калькулятор чаевых" , displayMode: .inline)
        }
    }
}

#Preview {
    ContentView()
}
