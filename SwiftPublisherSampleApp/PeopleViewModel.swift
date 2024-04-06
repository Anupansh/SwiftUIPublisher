import SwiftUI
import Combine

final class PeopleViewModel: ObservableObject {
    
    @Published var people = [Person]()
    var subscriptions = Set<AnyCancellable>()
    
    init(){
        $people
            .sink (receiveValue: {
                guard let last = $0.last else {return}
                print("Last recieved: \(String(describing: last.name)) \(String(describing: last.surname))")
            })
            .store(in: &subscriptions)
    }
    
}
