

import Foundation

class BrandOB: ObservableObject {
  @Published var openBrandPage: Bool = false
  @Published var selectedBrand: Brand? //= nil
  @Published var indexBrand: Int = 0
}
