import Combine
import SwiftUI

struct PeopleView: View {
    
    // Variables
    @ObservedObject var peopleModel: PeopleViewModel = PeopleViewModel()
    @State var name: String = ""
    @State var surname: String = ""
    
    
    // View body
    var body: some View {
        VStack(alignment: .center, spacing: 25){
            Text("Hello, enter a contact")
                .padding(.bottom, 50)
            HStack(alignment: .center, spacing: 2){
                VStack{
                    Text("New name: ")
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                VStack{
                    TextField("Name", text: $name)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            HStack(alignment: .center, spacing: 2){
                VStack{
                    Text("New surname: ")
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                VStack{
                    TextField("Surname", text: $surname)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            // Triggers the publisher
            Button(action: {
                self.peopleModel.people.append(Person(name: self.name, surname: self.surname))
            }) {
                Text("Update")
            }
            // Once this button is pressed, publisher won't work anymore
            Button(action: {
                self.peopleModel.subscriptions.removeAll()
            }) {
                Text("Cancel subscriptions")
            }
        }
    }
}

