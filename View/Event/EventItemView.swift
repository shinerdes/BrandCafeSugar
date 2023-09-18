
import SwiftUI

struct EventItemView: View {
    
    let event: Event
    
    var body: some View {
        
        Link(destination: URL(string: event.link)!, label: {
            Image(event.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(height: 200)
            
        })
    }
}

struct EventItemView_Previews: PreviewProvider {
    static var previews: some View {
        EventItemView(event: events[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
