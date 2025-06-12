//
//  WindowView.swift
//  1eok
//
//  Created by T_Y on 6/10/25.
//

import SwiftUI

struct WindowView: View {
    var body: some View {
        TabView {
            CalendarTab()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }

            HologramMatrixTab()
                .tabItem {
                    Label("Hologram", systemImage: "arkit")
                }

            SettingsTab()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview(windowStyle: .automatic) {
    WindowView()
        .environment(AppModel())
}
