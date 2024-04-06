//
//  PeopleVM.swift
//  SwiftPublisherSampleApp
//
//  Created by Anupansh Aggarwal on 25/03/24.
//

import Foundation
import SwiftUI


class CounterVM: ObservableObject {
    @Published var count = 0
    
    var body: some View {
        Text("Count Value is currently \(count)")
    }
    
    func increment() {
        count+=1
    }
}

struct CounterView: View {
    @StateObject var vm = CounterVM()
    
    var body: some View {
        VStack {
            Text("Count is: \(vm.count)")
            Button("Increment Button") {
                vm.increment()
            }
        }
    }
}

struct RandomView: View {
    @State var randomNumber = 0
    
    var body: some View {
        Text("Random Number is: \(randomNumber)")
        Button("Generate Random") {
            randomNumber = (0...16000).randomElement()!
        }.padding(.bottom)
        CounterView()
    }
}
