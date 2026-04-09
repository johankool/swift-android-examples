//
//  ContentView.swift
//  WeatherApp
//
//  Created by Thomas Krajacic on 09.04.26.
//

import SwiftUI
import WeatherLibrary

struct ContentView: View {
    
    @State var viewModel: WeatherViewModel = .init()
    
    var body: some View {
        Button("Fetch Weather") {
            Task {
                do {
                    try await viewModel.fetchWeather()
                } catch {
                    print(error)
                }
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
        
        Grid(horizontalSpacing: 0) {
            GridRow {
                Text("Temperature:")
                    .padding(.trailing, 20)
                    .gridColumnAlignment(.trailing)
                Text("\(viewModel.weatherData?.temperature.formatted(), default: "-")")
                    .gridColumnAlignment(.trailing)
                Text("° C")
                    .gridColumnAlignment(.leading)
            }
            GridRow {
                Text("Wind Speed:")
                    .padding(.trailing, 20)
                Text("\(viewModel.weatherData?.windSpeed.formatted(), default: "-")")
                Text(" km/h")
            }
            GridRow {
                Text("Wind Direction:")
                    .padding(.trailing, 20)
                Text("\(viewModel.weatherData?.windDirection.formatted(), default: "-")")
                Text("°")
            }
        }
    }
}

#Preview {
    ContentView()
}
