//
//  ContentView.swift
//  SwiftPublisherSampleApp
//
//  Created by Anupansh Aggarwal on 23/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var seconds = 1
    var timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Simulate Temperature") {
                var sensor = TemperatureSensor()
                let subscriber = sensor.temperatureUpdates.sink { temperature in
                    print("Temperature updated: \(temperature) degrees Celsius")
                }
                sensor.simulateTemperatureChange()
                sensor.simulateTemperatureChange()
                sensor.simulateTemperatureChange()
            }
            Text("Timer simulated at seconds :\(seconds)")
                .onReceive(timer, perform: { _ in
                    seconds += 1
                })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
