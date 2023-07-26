//
//  MainTabView.swift
//  DunyaGezgini
//
//  Created by Çare C. on 3.07.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView (selection: $selectedIndex){
            
            ConversionView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    HStack {
                        Image(systemName: "thermometer")
                        Text("TAB_CONVERSION")
                    }
                }.tag(0)
  
            ConversionViewWithAnimation()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    HStack {
                        Image(systemName: "thermometer")
                        Text("TAB_CONVERSION_WITH_ANIMATION")
                    }
                }.tag(1)
            
            MapView()
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    HStack {
                        Image(systemName: "map")
                        Text("TAB_MAP")
                    }
                    
                }.tag(2)
            
        }
        .accentColor(.purple)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
