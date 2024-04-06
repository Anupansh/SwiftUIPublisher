//
//  TemperatureSensor.swift
//  SwiftPublisherSampleApp
//
//  Created by Anupansh Aggarwal on 23/03/24.
//

import Combine


class TemperatureSensor {
    
    private let temperaturePublisher = PassthroughSubject<Double, Never>()
    
    var temperatureUpdates: AnyPublisher<Double, Never> {
        return temperaturePublisher.eraseToAnyPublisher()
    }
    
    func simulateTemperatureChange() {
        let newTemperature = Double.random(in: 0.0...100.0)
        temperaturePublisher.send(newTemperature)
    }
}

