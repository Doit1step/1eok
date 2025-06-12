import SwiftUI

@main
struct _eokApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            WindowView()
                .environment(appModel)
        }
        
        WindowGroup(id: "HologramMatrix") {
            HologramMatrixView()
                .environment(appModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.5, in: .meters)
        
    }
}
