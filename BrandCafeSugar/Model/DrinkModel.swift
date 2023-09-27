
import Foundation

struct Drink: Codable, Identifiable {
    let id: Int // 식별
    let brand: String
    let menu: String
    let menuImage: String
    let size: String // 사이즈 tall (355ml)
    let sugar: Int
    let kcal: Int
}

