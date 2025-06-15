//
//  HologramMatrixView.swift
//  1eok
//
//  Created by T_Y on 6/12/25.
//

import SwiftUI
import simd
import RealityKit
import _RealityKit_SwiftUI

struct HologramMatrixView: View {
    @State private var desiredOrientation: simd_quatf?
    @State private var didUpdateSubscription: EventSubscription?
    @State private var previousCollidedCubeName: String? = nil
    
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
            red: 255.0/255.0,
            green:  255.0/255.0,
            blue: 255.0/255.0,
            alpha:   0.1
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
            
            //*** Generate Date Planes ***//
            let meshDatePlane = mesh_datePlane
            let materialsDatePlane = [material_datePlane_1, material_datePlane_2]
            for i in 0..<10 {
                let material = materialsDatePlane[i % 2]
                let datePlane = ModelEntity(mesh: meshDatePlane, materials: [material])
                let xPos = -0.225 + Float(i) * 0.05
                datePlane.position = SIMD3<Float>(xPos, -0.25, 0.25)
                root.addChild(datePlane)
            }
            //*** End ***//
            
            //*** Generate Main Task Frame Cubes ***//
            let main_task_cubeMesh = mesh_taskFrameCube
            let main_task_cubeMaterial = material_taskFrameCube
            for col in 0..<10 {
                let xPos = -0.225 + Float(col) * 0.05
                for row in 0..<8 {
                    let zPos = 0.225 - Float(row) * 0.05
                    for pile in 0..<4 {
                        let yPos = -0.225 + Float(pile) * 0.05
                        
                        let cube = ModelEntity(mesh: main_task_cubeMesh, materials: [main_task_cubeMaterial])
                        
                        cube.position = SIMD3<Float>(xPos, yPos, zPos)
                        
                        cube.name = "main_\(col)_\(row)_\(pile)"
                        
                        cube.isEnabled = false;
                        
                        root.addChild(cube)
                    }
                }
            }
            //*** End ***//
            
            //*** Generate Routine Task Frame Cubes ***//
            let routine_task_cubeMesh = mesh_taskFrameCube
            let routine_task_cubeMaterial = material_taskFrameCube
            for col in 0..<10 {
                let xPos = -0.225 + Float(col) * 0.05
                for row in 0..<1 {
                    let zPos = -0.175 - Float(row) * 0.05
                    for pile in 0..<3 {
                        let yPos = -0.025 + Float(pile) * 0.05
                        
                        let cube = ModelEntity(mesh: routine_task_cubeMesh, materials: [routine_task_cubeMaterial])
                        
                        cube.position = SIMD3<Float>(xPos, yPos, zPos)
                        
                        cube.name = "routine_\(col)_\(row)_\(pile)"
                        cube.isEnabled = false;
                        
                        root.addChild(cube)
                    }
                }
            }
            //*** End ***//
            
            //*** Generate on Hold Task Frame Cubes ***//
            let onHold_task_cubeMesh = mesh_taskFrameCube
            let onHold_task_cubeMaterial = material_taskFrameCube
            for col in 0..<10 {
                let xPos = -0.225 + Float(col) * 0.05
                for row in 0..<1 {
                    let zPos = -0.225 - Float(row) * 0.05
                    for pile in 0..<3 {
                        let yPos = 0.125 + Float(pile) * 0.05
                        
                        let cube = ModelEntity(mesh: onHold_task_cubeMesh, materials: [onHold_task_cubeMaterial])
                        
                        cube.position = SIMD3<Float>(xPos, yPos, zPos)
                        
                        cube.name = "onHold_\(col)_\(row)_\(pile)"
                        cube.isEnabled = false;
                        
                        root.addChild(cube)
                    }
                }
            }
            //*** End ***//
            
            //*** Generate Test Task Sphere ***//
            let sphere = buildSphere(radius: 0.01)
            sphere.position = [0, 0, 0]
            
            if #available(visionOS 26.0, *) {
                ManipulationComponent.configureEntity(sphere)
                var manipulationComponent = ManipulationComponent()
                manipulationComponent.releaseBehavior = .stay
                sphere.components.set(manipulationComponent)
            } else {
                // Fallback on earlier versions
            }
            
            root.addChild(sphere)
            //*** End ***//

            if #available(visionOS 26.0, *) {
                didUpdateSubscription = content.subscribe(to: ManipulationEvents.DidUpdateTransform.self) { event in
                    guard event.entity == sphere else { return }
                    
                    // sphere의 월드 좌표 계산
                    let worldMatrix = sphere.transformMatrix(relativeTo: nil)
                    let spherePos   = SIMD3<Float>(worldMatrix.columns.3.x,
                                                   worldMatrix.columns.3.y,
                                                   worldMatrix.columns.3.z)

                    // Determine current collided cube
                    var currentCube: ModelEntity? = nil
                    for child in root.children {
                        guard let cube = child as? ModelEntity,
                              (cube.name.hasPrefix("main_") || cube.name.hasPrefix("routine_") || cube.name.hasPrefix("onHold_"))
                        else { continue }
                        let bounds = cube.visualBounds(relativeTo: nil)
                        if bounds.contains(spherePos) {
                            currentCube = cube
                            break
                        }
                    }
                    // Update states if collision occurred and cube is different
                    if let cube = currentCube, cube.name != previousCollidedCubeName {
                        // Disable previous cube
                        if let prevName = previousCollidedCubeName,
                           let prevCube = root.findEntity(named: prevName) as? ModelEntity {
                            prevCube.isEnabled = false
                            prevCube.model?.materials = [material_taskFrameCube]
                        }
                        // Enable current cube
                        cube.isEnabled = true
                        cube.model?.materials = [material_taskFrameCube]
                        previousCollidedCubeName = cube.name
                    }
                }
            } else {
                // Fallback on earlier versions
            }

            if #available(visionOS 26.0, *) {
                content.subscribe(to: ManipulationEvents.WillEnd.self) { event in
                    guard event.entity == sphere,
                          let prevName = previousCollidedCubeName,
                          let targetCube = root.findEntity(named: prevName) as? ModelEntity
                    else { return }
                    
                    // Move sphere to the last collided cube's position over 0.3s
                    let targetPosition = targetCube.transform.translation
                    sphere.move(
                        to: Transform(
                            scale: sphere.transform.scale,
                            rotation: sphere.transform.rotation,
                            translation: targetPosition
                        ),
                        relativeTo: root,
                        duration: 0.3,
                        timingFunction: .easeInOut
                    )
                }
            } else {
                // Fallback on earlier versions
            }

            content.add(root)
            
        }
    }
}

private func buildBox(size: SIMD3<Float>, color: UIColor) -> ModelEntity {
    let mesh = MeshResource.generateBox(size: size)
    let mat  = SimpleMaterial(color: color, isMetallic: false)
    return ModelEntity(mesh: mesh, materials: [mat])
}

private func buildSphere(radius: Float) -> ModelEntity {
    let mesh = MeshResource.generateSphere(radius: radius)
    let mat  = SimpleMaterial(color: .red, isMetallic: false)
    return ModelEntity(mesh: mesh, materials: [mat])
}

#Preview {
    HologramMatrixView()
}
