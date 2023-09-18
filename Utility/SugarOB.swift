
import Foundation

class SugarOB: ObservableObject {
  @Published var openSugarPage: Bool = false
  @Published var selectedSugar: Sugar? //= nil
  @Published var indexSugar: Int = 0 // 0 ~ 3
}
