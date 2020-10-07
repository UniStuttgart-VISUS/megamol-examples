mmCreateView("Project_1","GUIView","::GUIView1") 

mmCreateModule("View3D_2","::Project_1::View3D_21") 
mmCreateModule("vtkmDataSource","::Project_1::vtkmDataSource1") 
mmCreateModule("TableToADIOS","::Project_1::TableToADIOS1") 
mmCreateModule("CSVDataSource","::Project_1::CSVDataSource1") 
mmCreateModule("TableToADIOS","::Project_1::TableToADIOS2") 
mmCreateModule("CSVDataSource","::Project_1::CSVDataSource2") 
mmCreateModule("RenderMDIMesh","::Project_1::RenderMDIMesh1") 
mmCreateModule("vtkmStreamLines","::Project_1::vtkmStreamLines1") 
mmCreateModule("GPUMeshes","::Project_1::GPUMeshes1") 
mmCreateModule("MeshViewerRenderTasks","::Project_1::MeshViewerRenderTasks1") 
mmCreateModule("SimpleGPUMtlDataSource","::Project_1::SimpleGPUMtlDataSource1") 
mmCreateModule("BoundingBoxRenderer","::Project_1::BoundingBoxRenderer1") 

mmCreateCall("CallRenderView","::GUIView1::renderview","::Project_1::View3D_21::render")
mmCreateCall("CallRender3D_2","::Project_1::View3D_21::rendering","::Project_1::BoundingBoxRenderer1::rendering")
mmCreateCall("CallADIOSData","::Project_1::vtkmDataSource1::adiosNodeSlot","::Project_1::TableToADIOS1::adiosSlot")
mmCreateCall("CallADIOSData","::Project_1::vtkmDataSource1::adiosLabelSlot","::Project_1::TableToADIOS2::adiosSlot")
mmCreateCall("TableDataCall","::Project_1::TableToADIOS1::ftSlot","::Project_1::CSVDataSource1::getData")
mmCreateCall("TableDataCall","::Project_1::TableToADIOS2::ftSlot","::Project_1::CSVDataSource2::getData")
mmCreateCall("CallGPURenderTaskData","::Project_1::RenderMDIMesh1::getRenderTaskData","::Project_1::MeshViewerRenderTasks1::getData")
mmCreateCall("vtkmDataCall","::Project_1::vtkmStreamLines1::vtkCallerSlot","::Project_1::vtkmDataSource1::getdata")
mmCreateCall("CallMesh","::Project_1::GPUMeshes1::CallMeshes","::Project_1::vtkmStreamLines1::meshCalleeSlot")
mmCreateCall("CallGPUMaterialData","::Project_1::MeshViewerRenderTasks1::getMaterialData","::Project_1::SimpleGPUMtlDataSource1::getData")
mmCreateCall("CallGPUMeshData","::Project_1::MeshViewerRenderTasks1::getMeshData","::Project_1::GPUMeshes1::getData")
mmCreateCall("CallRender3D_2","::Project_1::BoundingBoxRenderer1::chainRendering","::Project_1::RenderMDIMesh1::rendering")

mmSetParamValue("::GUIView1::state",[=[{
  "Parameters": {
    "::GUIView1::autostart_configurator": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::GUIView1::configurator::state": {
      "gui_presentation_mode": 2,
      "gui_read-only": true,
      "gui_visibility": false
    },
    "::GUIView1::state": {
      "gui_presentation_mode": 2,
      "gui_read-only": true,
      "gui_visibility": false
    },
    "::GUIView1::style": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::BoundingBoxRenderer1::boundingBoxColor": {
      "gui_presentation_mode": 8,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::BoundingBoxRenderer1::enableBoundingBox": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::BoundingBoxRenderer1::enableViewCube": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::BoundingBoxRenderer1::smoothLines": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::BoundingBoxRenderer1::viewCubePosition": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::BoundingBoxRenderer1::viewCubeSize": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::clear": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::colSep": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::commentPrefix": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::decSep": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::filename": {
      "gui_presentation_mode": 16,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::headerNames": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::headerTypes": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::shuffle": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource1::skipPreface": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::clear": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::colSep": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::commentPrefix": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::decSep": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::filename": {
      "gui_presentation_mode": 16,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::headerNames": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::headerTypes": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::shuffle": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::CSVDataSource2::skipPreface": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::SimpleGPUMtlDataSource1::BTF filename": {
      "gui_presentation_mode": 16,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::anim::SpeedDown": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::anim::SpeedUp": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::anim::play": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::anim::speed": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::anim::time": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::anim::togglePlay": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::backCol": {
      "gui_presentation_mode": 8,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::cam::centeroffset": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::cam::convergenceplane": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::cam::halfapertureradians": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::cam::halfdisparity": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::cam::orientation": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::cam::position": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::cam::projectiontype": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::camstore::autoLoadSettings": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::camstore::autoSaveSettings": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::camstore::overrideSettings": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::camstore::restorecam": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::camstore::settings": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::camstore::storecam": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::enableMouseSelection": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::hookOnChange": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::resetView": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::resetViewOnBBoxChange": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::showLookAt": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::softCursor": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::viewKey::AngleStep": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::viewKey::FixToWorldUp": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::viewKey::MouseSensitivity": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::viewKey::MoveStep": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::viewKey::RotPoint": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::viewKey::RunFactor": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::View3D_21::viewcube::show": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::apply": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::fieldName": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::lowerPlanePoint": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": false
    },
    "::Project_1::vtkmStreamLines1::lowerSeedBound": {
      "gui_presentation_mode": 2,
      "gui_read-only": true,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::numSeeds": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::numSteps": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::planeAlpha": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::planeColor": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::planeMode": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::planeNormal": {
      "gui_presentation_mode": 256,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::planePoint": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::stepSize": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": true
    },
    "::Project_1::vtkmStreamLines1::upperPlanePoint": {
      "gui_presentation_mode": 2,
      "gui_read-only": false,
      "gui_visibility": false
    },
    "::Project_1::vtkmStreamLines1::upperSeedBound": {
      "gui_presentation_mode": 2,
      "gui_read-only": true,
      "gui_visibility": true
    }
  }
}]=])
mmSetParamValue("::GUIView1::configurator::state",[=[{
  "Graphs": {
    "F:/Uni/HiWi/vtkm/build/install/bin/vtkm_streamline_config.lua": {
      "canvas_scrolling": [
        0.0,
        0.0
      ],
      "canvas_zooming": 1.0,
      "interfaces": {
        "Project_1": {
          "interface_slot_0": [
            "::Project_1::View3D_21::render"
          ]
        }
      },
      "modules": {
        "::GUIView1": {
          "graph_position": [
            64.0,
            64.0
          ]
        },
        "::Project_1::BoundingBoxRenderer1": {
          "graph_position": [
            -869.0,
            138.0
          ]
        },
        "::Project_1::CSVDataSource1": {
          "graph_position": [
            946.0,
            138.0
          ]
        },
        "::Project_1::CSVDataSource2": {
          "graph_position": [
            946.0,
            234.0
          ]
        },
        "::Project_1::GPUMeshes1": {
          "graph_position": [
            -11.0,
            234.0
          ]
        },
        "::Project_1::MeshViewerRenderTasks1": {
          "graph_position": [
            -317.0,
            138.0
          ]
        },
        "::Project_1::RenderMDIMesh1": {
          "graph_position": [
            -600.0,
            138.0
          ]
        },
        "::Project_1::SimpleGPUMtlDataSource1": {
          "graph_position": [
            -11.0,
            138.0
          ]
        },
        "::Project_1::TableToADIOS1": {
          "graph_position": [
            718.0,
            138.0
          ]
        },
        "::Project_1::TableToADIOS2": {
          "graph_position": [
            718.0,
            234.0
          ]
        },
        "::Project_1::View3D_21": {
          "graph_position": [
            -1106.0,
            138.0
          ]
        },
        "::Project_1::vtkmDataSource1": {
          "graph_position": [
            480.0,
            138.0
          ]
        },
        "::Project_1::vtkmStreamLines1": {
          "graph_position": [
            245.0,
            138.0
          ]
        }
      },
      "param_extended_mode": false,
      "parameter_sidebar_width": 300.0,
      "params_readonly": false,
      "params_visible": true,
      "show_call_names": true,
      "show_grid": false,
      "show_module_names": true,
      "show_parameter_sidebar": false,
      "show_slot_names": false
    }
  }
}]=])
mmSetParamValue("::Project_1::View3D_21::cam::position",[=[-183.770981;30.8677807;333.196808]=])
mmSetParamValue("::Project_1::View3D_21::cam::orientation",[=[-0.052439075;-0.248172119;-0.0118117193;0.967220187]=])
mmSetParamValue("::Project_1::View3D_21::cam::halfapertureradians",[=[0.261799]=])
mmSetParamValue("::Project_1::View3D_21::cam::halfdisparity",[=[0.025000]=])
mmSetParamValue("::Project_1::CSVDataSource1::filename",[=[..\\examples\\mmvtkm\\cell_d_50_cubesphere-1.elastic.csv]=])
mmSetParamValue("::Project_1::CSVDataSource2::filename",[=[..\\examples\\mmvtkm\\elementnodelabel.csv]=])
mmSetParamValue("::Project_1::SimpleGPUMtlDataSource1::BTF filename",[=[vtkm_streamline]=])

