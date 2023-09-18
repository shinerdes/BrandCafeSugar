
import SwiftUI

let drinks: [Drink] = Bundle.main.decode("drink.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let events: [Event] = Bundle.main.decode("event.json")
let sugars: [Sugar] = Bundle.main.decode("sugar.json")

let sampleBrand: Brand = brands[0]


let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

var gridLayout2: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1)
}


let feedback = UIImpactFeedbackGenerator(style: .medium)
