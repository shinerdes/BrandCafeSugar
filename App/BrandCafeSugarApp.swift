

import SwiftUI

@main
struct BrandCafeSugarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BrandOB())
                .environmentObject(SugarOB())
        }
    }
}
