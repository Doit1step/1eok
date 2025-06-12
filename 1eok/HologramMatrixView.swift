//
//  HologramMatrixView.swift
//  1eok
//
//  Created by T_Y on 6/12/25.
//

import SwiftUI
import RealityFoundation
import _RealityKit_SwiftUI

struct HologramMatrixView: View {
    
    var body: some View {
        
        //*** For the Volumetric Boundary Box ***//
        let size_VolumetricBoundaryBox = SIMD3<Float>(0.5, 0.5, 0.5)
        
        let color_VolumetricBoundaryBox = UIColor(
            red: 255.0/255.0,
            green:  255.0/255.0,
            blue: 255.0/255.0,
            alpha:   0.1
        )
        //*** End ***//
        
        //*** For the Main Base Floor Plane ***//
        let size_main_baseFloorPlane = SIMD3<Float>(0.5, 0.002, 0.4)
        
        let mesh_main_baseFloorPlane = MeshResource.generateBox(size: size_main_baseFloorPlane)
        
        let color_main_baseFloorPlane = UIColor(
            red: 255.0/255.0,
            green:  255.0/255.0,
            blue: 255.0/255.0,
            alpha:   1.0
        )
        
        let material_main_baseFloorPlane = SimpleMaterial(color: color_main_baseFloorPlane, isMetallic: false)
        //*** End ***//
        
        //*** For the Routine Base Floor Plane ***//
        let size_routine_baseFloorPlane = SIMD3<Float>(0.5, 0.002, 0.05)
        
        let mesh_routine_baseFloorPlane = MeshResource.generateBox(size: size_routine_baseFloorPlane)
        
        let color_routine_baseFloorPlane = UIColor(
            red: 0.0/255.0,
            green:  255.0/255.0,
            blue: 255.0/255.0,
            alpha:   1.0
        )
        
        let material_routine_baseFloorPlane = SimpleMaterial(color: color_routine_baseFloorPlane, isMetallic: false)
        //*** End ***//
        
        //*** For the On Hold Base Floor Plane ***//
        let size_onHold_baseFloorPlane = SIMD3<Float>(0.5, 0.002, 0.05)
        
        let mesh_onHold_baseFloorPlane = MeshResource.generateBox(size: size_onHold_baseFloorPlane)
        
        let color_onHold_baseFloorPlane = UIColor(
            red: 255.0/255.0,
            green:  0.0/255.0,
            blue: 0.0/255.0,
            alpha:   1.0
        )
        
        let material_onHold_baseFloorPlane = SimpleMaterial(color: color_onHold_baseFloorPlane, isMetallic: false)
        //*** End ***//
        
        RealityView { content in
            
            //*** Generate Root Entity ***//
            let root = Entity()
            //*** End ***//
            
            //*** Generate Volumetric Boundary Box ***//
            let volumetricBoundaryBox = buildBox(size: size_VolumetricBoundaryBox, color: color_VolumetricBoundaryBox)
            
            root.addChild(volumetricBoundaryBox)
            //*** End ***//
            
            //*** Generate Main Base Floor Plane ***//
            let mainBaseFloorPlane = ModelEntity(mesh: mesh_main_baseFloorPlane, materials: [material_main_baseFloorPlane])
            
            mainBaseFloorPlane.position = SIMD3<Float>(0, -0.25, 0.05)
            
            root.addChild(mainBaseFloorPlane)
            //*** End ***//
            
            //*** Generate Routine Base Floor Plane ***//
            let routineBaseFloorPlane = ModelEntity(mesh: mesh_routine_baseFloorPlane, materials: [material_routine_baseFloorPlane])
            
            routineBaseFloorPlane.position = SIMD3<Float>(0, -0.25, -0.175)
            
            root.addChild(routineBaseFloorPlane)
            //*** End ***//
            
            //*** Generate OnHold Base Floor Plane ***//
            let onHoldBaseFloorPlane = ModelEntity(mesh: mesh_onHold_baseFloorPlane, materials: [material_onHold_baseFloorPlane])
            
            onHoldBaseFloorPlane.position = SIMD3<Float>(0, -0.25, -0.225)
            
            root.addChild(onHoldBaseFloorPlane)
            //*** End ***//
            
            
            content.add(root)
            
        }
    }
}

private func buildBox(size: SIMD3<Float>, color: UIColor) -> ModelEntity {
    let mesh = MeshResource.generateBox(size: size)
    let mat  = SimpleMaterial(color: color, isMetallic: false)
    return ModelEntity(mesh: mesh, materials: [mat])
}

#Preview {
    HologramMatrixView()
}
