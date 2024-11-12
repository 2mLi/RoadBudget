import SwiftUI

struct ContentView: View {
    @State private var mileage: String = ""
    @State private var mpg: String = ""
    @State private var pricePerLitre: String = ""
    @State private var totalCost: Double = 0.0
    
    private let litresPerGallon = 4.54609
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Details")) {
                    TextField("Mileage (miles)", text: $mileage)
                        .keyboardType(.decimalPad)
                    
                    TextField("Miles per Gallon (MPG)", text: $mpg)
                        .keyboardType(.decimalPad)
                    
                    TextField("Price per Litre (pence)", text: $pricePerLitre)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button("Calculate Cost") {
                        calculateCost()
                    }
                }
                
                Section(header: Text("Result")) {
                    Text("Total Cost: £\(String(format: "%.2f", totalCost))")
                        .bold()
                }
            }
            .navigationTitle("Fuel Calculator")
        }
    }
    
    private func calculateCost() {
        guard let mileageValue = Double(mileage),
              let mpgValue = Double(mpg),
              let priceValue = Double(pricePerLitre) else {
            return
        }
        
        let gallonsUsed = mileageValue / mpgValue
        let litresUsed = gallonsUsed * litresPerGallon
        totalCost = (litresUsed * priceValue) / 100.0
    }
} 