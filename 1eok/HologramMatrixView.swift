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
        let size_routine_baseFloorPlane = SIMD3<Float>(0.5, 0.2, 0.05)
        
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
        let size_onHold_baseFloorPlane = SIMD3<Float>(0.5, 0.35, 0.05)
        
        let mesh_onHold_baseFloorPlane = MeshResource.generateBox(size: size_onHold_baseFloorPlane)
        
        let color_onHold_baseFloorPlane = UIColor(
            red: 255.0/255.0,
            green:  0.0/255.0,
            blue: 0.0/255.0,
            alpha:   1.0
        )
        
        let material_onHold_baseFloorPlane = SimpleMaterial(color: color_onHold_baseFloorPlane, isMetallic: false)
        //*** End ***//
        
        //*** For the Date Plane ***//
        let size_datePlane = SIMD3<Float>(0.05, 0.02, 0.001)
        
        let mesh_datePlane = MeshResource.generateBox(size: size_datePlane)
        
        let color_datePlane_1 = UIColor(
            red: 0.0/255.0,
            green:  100.0/255.0,
            blue: 100.0/255.0,
            alpha:   1.0
        )
        
        let color_datePlane_2 = UIColor(
            red: 255.0/255.0,
            green:  255.0/255.0,
            blue: 255.0/255.0,
            alpha:   1.0
        )
        
        let material_datePlane_1 = SimpleMaterial(color: color_datePlane_1, isMetallic: false)
        
        let material_datePlane_2 = SimpleMaterial(color: color_datePlane_2, isMetallic: false)
        //*** End ***//
        
        //*** For the Task Frame Cube ***//
        let size_taskFrameCube = SIMD3<Float>(0.05, 0.05, 0.05)
        
        let mesh_taskFrameCube = MeshResource.generateBox(size: size_taskFrameCube)
        
        let color_taskFrameCube = UIColor(
            red: 0.0/255.0,
            green:  20.0/255.0,
            blue: 123.0/255.0,
            alpha:   0.3
        )
        
        let material_taskFrameCube = SimpleMaterial(color: color_taskFrameCube, isMetallic: false)
        //*** End ***//
        
        RealityView { content in
            
            //*** Generate Root Entity ***//
            let root = Entity()
            //*** End ***//
            
            //*** Generate Volumetric Boundary Box ***//
            let volumetricBoundaryBox = buildBox(size: size_VolumetricBoundaryBox, color: color_VolumetricBoundaryBox)
            
            //root.addChild(volumetricBoundaryBox)
            //*** End ***//
            
            //*** Generate Main Base Floor Plane ***//
            let mainBaseFloorPlane = ModelEntity(mesh: mesh_main_baseFloorPlane, materials: [material_main_baseFloorPlane])
            
            mainBaseFloorPlane.position = SIMD3<Float>(0, -0.25, 0.05)
            
            root.addChild(mainBaseFloorPlane)
            //*** End ***//
            
            //*** Generate Routine Base Floor Plane ***//
            let routineBaseFloorPlane = ModelEntity(mesh: mesh_routine_baseFloorPlane, materials: [material_routine_baseFloorPlane])
            
            routineBaseFloorPlane.position = SIMD3<Float>(0, -0.15, -0.175)
            
            root.addChild(routineBaseFloorPlane)
            //*** End ***//
            
            //*** Generate OnHold Base Floor Plane ***//
            let onHoldBaseFloorPlane = ModelEntity(mesh: mesh_onHold_baseFloorPlane, materials: [material_onHold_baseFloorPlane])
            
            onHoldBaseFloorPlane.position = SIMD3<Float>(0, -0.075, -0.225)
            
            root.addChild(onHoldBaseFloorPlane)
            //*** End ***//
            
            //*** Generate Date Plane ***//
            let datePlane_1 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_1])
            
            datePlane_1.position = SIMD3<Float>(-0.225, -0.25, 0.25)
            
            root.addChild(datePlane_1)
            
            let datePlane_2 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_2])
            
            datePlane_2.position = SIMD3<Float>(-0.175, -0.25, 0.25)
            
            root.addChild(datePlane_2)
            
            let datePlane_3 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_1])
            
            datePlane_3.position = SIMD3<Float>(-0.125, -0.25, 0.25)
            
            root.addChild(datePlane_3)
            
            let datePlane_4 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_2])
            
            datePlane_4.position = SIMD3<Float>(-0.075, -0.25, 0.25)
            
            root.addChild(datePlane_4)
            
            let datePlane_5 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_1])
            
            datePlane_5.position = SIMD3<Float>(-0.025, -0.25, 0.25)
        
            root.addChild(datePlane_5)
            
            let datePlane_6 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_2])
            
            datePlane_6.position = SIMD3<Float>(0.025, -0.25, 0.25)
            
            root.addChild(datePlane_6)
            
            let datePlane_7 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_1])
            
            datePlane_7.position = SIMD3<Float>(0.075, -0.25, 0.25)
            
            root.addChild(datePlane_7)
            
            let datePlane_8 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_2])
            
            datePlane_8.position = SIMD3<Float>(0.125, -0.25, 0.25)
            
            root.addChild(datePlane_8)
            
            let datePlane_9 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_1])
            
            datePlane_9.position = SIMD3<Float>(0.175, -0.25, 0.25)
            
            root.addChild(datePlane_9)
            
            let datePlane_10 = ModelEntity(mesh: mesh_datePlane, materials: [material_datePlane_2])
            
            datePlane_10.position = SIMD3<Float>(0.225, -0.25, 0.25)
            
            root.addChild(datePlane_10)
            //*** End ***//
            
            //*** Generate Task Frame Cube ***//
            let taskFrameCube_1_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_1_1.position = SIMD3<Float>(-0.225,-0.225,0.225)
            
            root.addChild(taskFrameCube_1_1)
            
            let taskFrameCube_1_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_1_2.position = SIMD3<Float>(-0.225,-0.225,0.175)
            
            root.addChild(taskFrameCube_1_2)
            
            let taskFrameCube_1_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_1_3.position = SIMD3<Float>(-0.225,-0.225,0.125)
            
            root.addChild(taskFrameCube_1_3)
            
            let taskFrameCube_1_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_1_4.position = SIMD3<Float>(-0.225,-0.225,0.075)
            
            root.addChild(taskFrameCube_1_4)
            
            let taskFrameCube_1_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_1_5.position = SIMD3<Float>(-0.225,-0.225,0.025)
            
            root.addChild(taskFrameCube_1_5)
            
            let taskFrameCube_1_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_1_6.position = SIMD3<Float>(-0.225,-0.225,-0.025)
            
            root.addChild(taskFrameCube_1_6)
            
            let taskFrameCube_1_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_1_7.position = SIMD3<Float>(-0.225,-0.225,-0.075)
            
            root.addChild(taskFrameCube_1_7)
            
            let taskFrameCube_1_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_1_8.position = SIMD3<Float>(-0.225,-0.225,-0.125)
            
            root.addChild(taskFrameCube_1_8)
            
            //
            
            let taskFrameCube_2_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_2_1.position = SIMD3<Float>(-0.175,-0.225,0.225)
            
            root.addChild(taskFrameCube_2_1)
            
            let taskFrameCube_2_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_2_2.position = SIMD3<Float>(-0.175,-0.225,0.175)
            
            root.addChild(taskFrameCube_2_2)
            
            let taskFrameCube_2_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_2_3.position = SIMD3<Float>(-0.175,-0.225,0.125)
            
            root.addChild(taskFrameCube_2_3)
            
            let taskFrameCube_2_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_2_4.position = SIMD3<Float>(-0.175,-0.225,0.075)
            
            root.addChild(taskFrameCube_2_4)
            
            let taskFrameCube_2_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_2_5.position = SIMD3<Float>(-0.175,-0.225,0.025)
            
            root.addChild(taskFrameCube_2_5)
            
            let taskFrameCube_2_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_2_6.position = SIMD3<Float>(-0.175,-0.225,-0.025)
            
            root.addChild(taskFrameCube_2_6)
            
            let taskFrameCube_2_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_2_7.position = SIMD3<Float>(-0.175,-0.225,-0.075)
            
            root.addChild(taskFrameCube_2_7)
            
            let taskFrameCube_2_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_2_8.position = SIMD3<Float>(-0.175,-0.225,-0.125)
            
            root.addChild(taskFrameCube_2_8)
            
            //
            
            let taskFrameCube_3_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_3_1.position = SIMD3<Float>(-0.125,-0.225,0.225)
            
            root.addChild(taskFrameCube_3_1)
            
            let taskFrameCube_3_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_3_2.position = SIMD3<Float>(-0.125,-0.225,0.175)
            
            root.addChild(taskFrameCube_3_2)
            
            let taskFrameCube_3_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_3_3.position = SIMD3<Float>(-0.125,-0.225,0.125)
            
            root.addChild(taskFrameCube_3_3)
            
            let taskFrameCube_3_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_3_4.position = SIMD3<Float>(-0.125,-0.225,0.075)
            
            root.addChild(taskFrameCube_3_4)
            
            let taskFrameCube_3_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_3_5.position = SIMD3<Float>(-0.125,-0.225,0.025)
            
            root.addChild(taskFrameCube_3_5)
            
            let taskFrameCube_3_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_3_6.position = SIMD3<Float>(-0.125,-0.225,-0.025)
            
            root.addChild(taskFrameCube_3_6)
            
            let taskFrameCube_3_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_3_7.position = SIMD3<Float>(-0.125,-0.225,-0.075)
            
            root.addChild(taskFrameCube_3_7)
            
            let taskFrameCube_3_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_3_8.position = SIMD3<Float>(-0.125,-0.225,-0.125)
            
            root.addChild(taskFrameCube_3_8)
            
            //
            
            let taskFrameCube_4_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_4_1.position = SIMD3<Float>(-0.075,-0.225,0.225)
            
            root.addChild(taskFrameCube_4_1)
            
            let taskFrameCube_4_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_4_2.position = SIMD3<Float>(-0.075,-0.225,0.175)
            
            root.addChild(taskFrameCube_4_2)
            
            let taskFrameCube_4_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_4_3.position = SIMD3<Float>(-0.075,-0.225,0.125)
            
            root.addChild(taskFrameCube_4_3)
            
            let taskFrameCube_4_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_4_4.position = SIMD3<Float>(-0.075,-0.225,0.075)
            
            root.addChild(taskFrameCube_4_4)
            
            let taskFrameCube_4_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_4_5.position = SIMD3<Float>(-0.075,-0.225,0.025)
            
            root.addChild(taskFrameCube_4_5)
            
            let taskFrameCube_4_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_4_6.position = SIMD3<Float>(-0.075,-0.225,-0.025)
            
            root.addChild(taskFrameCube_4_6)
            
            let taskFrameCube_4_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_4_7.position = SIMD3<Float>(-0.075,-0.225,-0.075)
            
            root.addChild(taskFrameCube_4_7)
            
            let taskFrameCube_4_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_4_8.position = SIMD3<Float>(-0.075,-0.225,-0.125)
            
            root.addChild(taskFrameCube_4_8)
            
            //
            
            let taskFrameCube_5_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_5_1.position = SIMD3<Float>(-0.025,-0.225,0.225)
            
            root.addChild(taskFrameCube_5_1)
            
            let taskFrameCube_5_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_5_2.position = SIMD3<Float>(-0.025,-0.225,0.175)
            
            root.addChild(taskFrameCube_5_2)
            
            let taskFrameCube_5_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_5_3.position = SIMD3<Float>(-0.025,-0.225,0.125)
            
            root.addChild(taskFrameCube_5_3)
            
            let taskFrameCube_5_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_5_4.position = SIMD3<Float>(-0.025,-0.225,0.075)
            
            root.addChild(taskFrameCube_5_4)
            
            let taskFrameCube_5_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_5_5.position = SIMD3<Float>(-0.025,-0.225,0.025)
            
            root.addChild(taskFrameCube_5_5)
            
            let taskFrameCube_5_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_5_6.position = SIMD3<Float>(-0.025,-0.225,-0.025)
            
            root.addChild(taskFrameCube_5_6)
            
            let taskFrameCube_5_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_5_7.position = SIMD3<Float>(-0.025,-0.225,-0.075)
            
            root.addChild(taskFrameCube_5_7)
            
            let taskFrameCube_5_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_5_8.position = SIMD3<Float>(-0.025,-0.225,-0.125)
            
            root.addChild(taskFrameCube_5_8)
            
            //
            
            let taskFrameCube_6_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_6_1.position = SIMD3<Float>(0.025,-0.225,0.225)
            
            root.addChild(taskFrameCube_6_1)
            
            let taskFrameCube_6_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_6_2.position = SIMD3<Float>(0.025,-0.225,0.175)
            
            root.addChild(taskFrameCube_6_2)
            
            let taskFrameCube_6_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_6_3.position = SIMD3<Float>(0.025,-0.225,0.125)
            
            root.addChild(taskFrameCube_6_3)
            
            let taskFrameCube_6_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_6_4.position = SIMD3<Float>(0.025,-0.225,0.075)
            
            root.addChild(taskFrameCube_6_4)
            
            let taskFrameCube_6_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_6_5.position = SIMD3<Float>(0.025,-0.225,0.025)
            
            root.addChild(taskFrameCube_6_5)
            
            let taskFrameCube_6_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_6_6.position = SIMD3<Float>(0.025,-0.225,-0.025)
            
            root.addChild(taskFrameCube_6_6)
            
            let taskFrameCube_6_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_6_7.position = SIMD3<Float>(0.025,-0.225,-0.075)
            
            root.addChild(taskFrameCube_6_7)
            
            let taskFrameCube_6_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_6_8.position = SIMD3<Float>(0.025,-0.225,-0.125)
            
            root.addChild(taskFrameCube_6_8)
            
            //
            
            let taskFrameCube_7_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_7_1.position = SIMD3<Float>(0.075,-0.225,0.225)
            
            root.addChild(taskFrameCube_7_1)
            
            let taskFrameCube_7_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_7_2.position = SIMD3<Float>(0.075,-0.225,0.175)
            
            root.addChild(taskFrameCube_7_2)
            
            let taskFrameCube_7_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_7_3.position = SIMD3<Float>(0.075,-0.225,0.125)
            
            root.addChild(taskFrameCube_7_3)
            
            let taskFrameCube_7_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_7_4.position = SIMD3<Float>(0.075,-0.225,0.075)
            
            root.addChild(taskFrameCube_7_4)
            
            let taskFrameCube_7_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_7_5.position = SIMD3<Float>(0.075,-0.225,0.025)
            
            root.addChild(taskFrameCube_7_5)
            
            let taskFrameCube_7_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_7_6.position = SIMD3<Float>(0.075,-0.225,-0.025)
            
            root.addChild(taskFrameCube_7_6)
            
            let taskFrameCube_7_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_7_7.position = SIMD3<Float>(0.075,-0.225,-0.075)
            
            root.addChild(taskFrameCube_7_7)
            
            let taskFrameCube_7_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_7_8.position = SIMD3<Float>(0.075,-0.225,-0.125)
            
            root.addChild(taskFrameCube_7_8)
            
            //
            
            let taskFrameCube_8_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_8_1.position = SIMD3<Float>(0.125,-0.225,0.225)
            
            root.addChild(taskFrameCube_8_1)
            
            let taskFrameCube_8_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_8_2.position = SIMD3<Float>(0.125,-0.225,0.175)
            
            root.addChild(taskFrameCube_8_2)
            
            let taskFrameCube_8_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_8_3.position = SIMD3<Float>(0.125,-0.225,0.125)
            
            root.addChild(taskFrameCube_8_3)
            
            let taskFrameCube_8_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_8_4.position = SIMD3<Float>(0.125,-0.225,0.075)
            
            root.addChild(taskFrameCube_8_4)
            
            let taskFrameCube_8_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_8_5.position = SIMD3<Float>(0.125,-0.225,0.025)
            
            root.addChild(taskFrameCube_8_5)
            
            let taskFrameCube_8_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_8_6.position = SIMD3<Float>(0.125,-0.225,-0.025)
            
            root.addChild(taskFrameCube_8_6)
            
            let taskFrameCube_8_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_8_7.position = SIMD3<Float>(0.125,-0.225,-0.075)
            
            root.addChild(taskFrameCube_8_7)
            
            let taskFrameCube_8_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_8_8.position = SIMD3<Float>(0.125,-0.225,-0.125)
            
            root.addChild(taskFrameCube_8_8)
            
            //
            
            let taskFrameCube_9_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_9_1.position = SIMD3<Float>(0.175,-0.225,0.225)
            
            root.addChild(taskFrameCube_9_1)
            
            let taskFrameCube_9_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_9_2.position = SIMD3<Float>(0.175,-0.225,0.175)
            
            root.addChild(taskFrameCube_9_2)
            
            let taskFrameCube_9_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_9_3.position = SIMD3<Float>(0.175,-0.225,0.125)
            
            root.addChild(taskFrameCube_9_3)
            
            let taskFrameCube_9_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_9_4.position = SIMD3<Float>(0.175,-0.225,0.075)
            
            root.addChild(taskFrameCube_9_4)
            
            let taskFrameCube_9_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_9_5.position = SIMD3<Float>(0.175,-0.225,0.025)
            
            root.addChild(taskFrameCube_9_5)
            
            let taskFrameCube_9_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_9_6.position = SIMD3<Float>(0.175,-0.225,-0.025)
            
            root.addChild(taskFrameCube_9_6)
            
            let taskFrameCube_9_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_9_7.position = SIMD3<Float>(0.175,-0.225,-0.075)
            
            root.addChild(taskFrameCube_9_7)
            
            let taskFrameCube_9_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_9_8.position = SIMD3<Float>(0.175,-0.225,-0.125)
            
            root.addChild(taskFrameCube_9_8)
            
            //
            
            let taskFrameCube_10_1 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_10_1.position = SIMD3<Float>(0.225,-0.225,0.225)
            
            root.addChild(taskFrameCube_10_1)
            
            let taskFrameCube_10_2 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_10_2.position = SIMD3<Float>(0.225,-0.225,0.175)
            
            root.addChild(taskFrameCube_10_2)
            
            let taskFrameCube_10_3 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_10_3.position = SIMD3<Float>(0.225,-0.225,0.125)
            
            root.addChild(taskFrameCube_10_3)
            
            let taskFrameCube_10_4 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_10_4.position = SIMD3<Float>(0.225,-0.225,0.075)
            
            root.addChild(taskFrameCube_10_4)
            
            let taskFrameCube_10_5 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_10_5.position = SIMD3<Float>(0.225,-0.225,0.025)
            
            root.addChild(taskFrameCube_10_5)
            
            let taskFrameCube_10_6 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_10_6.position = SIMD3<Float>(0.225,-0.225,-0.025)
            
            root.addChild(taskFrameCube_10_6)
            
            let taskFrameCube_10_7 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_10_7.position = SIMD3<Float>(0.225,-0.225,-0.075)
            
            root.addChild(taskFrameCube_10_7)
            
            let taskFrameCube_10_8 = ModelEntity(mesh: mesh_taskFrameCube, materials: [material_taskFrameCube])
            
            taskFrameCube_10_8.position = SIMD3<Float>(0.225,-0.225,-0.125)
            
            root.addChild(taskFrameCube_10_8)
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
