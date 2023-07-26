//
//  MapView.swift
//  DunyaGezgini
//
//  Created by Çare C. on 3.07.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    static var region: [MKCoordinateRegion] = [
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.015137, longitude: 28.979530),
            span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)),
        
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.509865, longitude: -0.118092),
            span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4))
    ]
    
    @State private var selectedIndex = 0
    
    @State var region: MKCoordinateRegion = region[0]
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.top)
            .overlay(
                VStack {
                    Picker("Picker", selection: $selectedIndex, content: {
                        Text("MAP_CITY_ISTANBUL").tag(0)
                        Text("MAP_CITY_LONDON").tag(1)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of: selectedIndex) { Value in
                        self.region = MapView.region[selectedIndex]
                    }
                    Spacer()
                }
                
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
