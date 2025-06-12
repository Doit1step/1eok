//
//  HologramMatrixTab.swift
//  1eok
//
//  Created by T_Y on 6/10/25.
//

import SwiftUI

struct HologramMatrixTab: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack{
            Text("Welcome to Hologram Matrix Tab")
            
            Button("Hologram Matrix") {
                    openWindow(id: "HologramMatrix")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}


#Preview(windowStyle: .automatic) {
    HologramMatrixTab()
        .environment(AppModel())
}
