
import Foundation

struct Drink: Codable, Identifiable {
    let id: Int // 식별
    let brand: String
    let menu: String
    let menuImage: String
    let size: String // 사이즈 tall (355ml)
    let sugar: Int
    let kcal: Int
    
    init(id: Int, brand: String, menu: String, menuImage: String, size: String, sugar: Int, kcal: Int) {
        self.id = id
        self.brand = brand
        self.menu = menu
        self.menuImage = menuImage
        self.size = size
        self.sugar = sugar
        self.kcal = kcal
    }
}

