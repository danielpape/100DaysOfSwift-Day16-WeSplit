//
//  ContentView.swift
//  WeSplit
//
//  Created by Daniel Pape on 11/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalForCheck: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal
        
        return amountPerPerson
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter your amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of People",selection: $numberOfPeople){
                        ForEach(2 ..< 99){
                            Text("\($0) people")
                        }
                    }
                }
                Section(header:Text("How much tip would you like to leave?")){
                    Picker("Tip percentage",selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:Text("Total amount including tip")){
                    Text("$\(totalForCheck, specifier: "%.2f")")
                }
                Section(header:Text("Amount per person including tip")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                    .previewDisplayName("iPhone 12")
            
    }
}
