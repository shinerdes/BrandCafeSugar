

import SwiftUI

struct SugarTitleView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
    }
}

struct SugarTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SugarTitleView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
