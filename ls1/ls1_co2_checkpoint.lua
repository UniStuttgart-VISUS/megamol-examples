mmCreateView("GraphEntry_1","View3DGL","::View3DGL_1") 

mmCreateModule("SphereRenderer","::SphereRenderer_1") 
mmCreateModule("ls1ParticleFormat","::ls1ParticleFormat_1") 
mmCreateModule("adiosDataSource","::adiosDataSource_1") 
mmCreateModule("TransferFunction","::TransferFunction_1") 
mmCreateModule("BoundingBoxRenderer","::BoundingBoxRenderer_1") 

mmCreateCall("CallRender3DGL","::View3DGL_1::rendering","::BoundingBoxRenderer_1::rendering")
mmCreateCall("MultiParticleDataCall","::SphereRenderer_1::getdata","::ls1ParticleFormat_1::mpSlot")
mmCreateCall("CallADIOSData","::ls1ParticleFormat_1::adiosSlot","::adiosDataSource_1::getdata")
mmCreateCall("CallGetTransferFunction","::ls1ParticleFormat_1::transferfunctionSlot","::TransferFunction_1::gettransferfunction")
mmCreateCall("CallRender3DGL","::BoundingBoxRenderer_1::chainRendering","::SphereRenderer_1::rendering")

mmSetParamValue("::View3DGL_1::camstore::settings",[=[]=])
mmSetParamValue("::View3DGL_1::camstore::overrideSettings",[=[false]=])
mmSetParamValue("::View3DGL_1::camstore::autoSaveSettings",[=[false]=])
mmSetParamValue("::View3DGL_1::camstore::autoLoadSettings",[=[true]=])
mmSetParamValue("::View3DGL_1::resetViewOnBBoxChange",[=[false]=])
mmSetParamValue("::View3DGL_1::anim::play",[=[false]=])
mmSetParamValue("::View3DGL_1::anim::speed",[=[4.000000]=])
mmSetParamValue("::View3DGL_1::anim::time",[=[0.000000]=])
mmSetParamValue("::View3DGL_1::backCol",[=[#000020]=])
mmSetParamValue("::View3DGL_1::showLookAt",[=[false]=])
mmSetParamValue("::View3DGL_1::viewKey::MoveStep",[=[0.500000]=])
mmSetParamValue("::View3DGL_1::viewKey::RunFactor",[=[2.000000]=])
mmSetParamValue("::View3DGL_1::viewKey::AngleStep",[=[90.000000]=])
mmSetParamValue("::View3DGL_1::viewKey::FixToWorldUp",[=[true]=])
mmSetParamValue("::View3DGL_1::viewKey::MouseSensitivity",[=[3.000000]=])
mmSetParamValue("::View3DGL_1::viewKey::RotPoint",[=[Look-At]=])
mmSetParamValue("::View3DGL_1::hookOnChange",[=[false]=])
mmSetParamValue("::View3DGL_1::cam::position",[=[30;120;507.846069]=])
mmSetParamValue("::View3DGL_1::cam::orientation",[=[0;0;0;1]=])
mmSetParamValue("::View3DGL_1::cam::projectiontype",[=[Perspective]=])
mmSetParamValue("::View3DGL_1::cam::convergenceplane",[=[0.000000]=])
mmSetParamValue("::View3DGL_1::cam::centeroffset",[=[0;0]=])
mmSetParamValue("::View3DGL_1::cam::halfaperturedegrees",[=[15.000000]=])
mmSetParamValue("::View3DGL_1::cam::halfdisparity",[=[0.025000]=])
mmSetParamValue("::View3DGL_1::cam::ovr::up",[=[0;0;0]=])
mmSetParamValue("::View3DGL_1::cam::ovr::lookat",[=[0;0;0]=])
mmSetParamValue("::View3DGL_1::view::defaultView",[=[FACE - Front]=])
mmSetParamValue("::View3DGL_1::view::defaultOrientation",[=[Top]=])
mmSetParamValue("::View3DGL_1::view::cubeOrientation",[=[0;0;0;1]=])
mmSetParamValue("::View3DGL_1::view::showViewCube",[=[false]=])
mmSetParamValue("::SphereRenderer_1::renderMode",[=[Ambient_Occlusion]=])
mmSetParamValue("::SphereRenderer_1::scaling",[=[1.000000]=])
mmSetParamValue("::SphereRenderer_1::forceTime",[=[false]=])
mmSetParamValue("::SphereRenderer_1::useLocalBbox",[=[false]=])
mmSetParamValue("::SphereRenderer_1::flag storage::selectedColor",[=[#ff0000]=])
mmSetParamValue("::SphereRenderer_1::flag storage::softSelectedColor",[=[#ff8080]=])
mmSetParamValue("::SphereRenderer_1::splat::alphaScaling",[=[5.000000]=])
mmSetParamValue("::SphereRenderer_1::splat::attenuateSubpixel",[=[false]=])
mmSetParamValue("::SphereRenderer_1::ssbo::staticData",[=[false]=])
mmSetParamValue("::SphereRenderer_1::ambient occlusion::enableLighting",[=[false]=])
mmSetParamValue("::SphereRenderer_1::ambient occlusion::useGsProxies",[=[false]=])
mmSetParamValue("::SphereRenderer_1::ambient occlusion::volumeSize",[=[128]=])
mmSetParamValue("::SphereRenderer_1::ambient occlusion::apex",[=[50.000000]=])
mmSetParamValue("::SphereRenderer_1::ambient occlusion::offset",[=[0.010000]=])
mmSetParamValue("::SphereRenderer_1::ambient occlusion::strength",[=[1.000000]=])
mmSetParamValue("::SphereRenderer_1::ambient occlusion::coneLength",[=[0.800000]=])
mmSetParamValue("::SphereRenderer_1::ambient occlusion::highPrecisionTexture",[=[false]=])
mmSetParamValue("::SphereRenderer_1::outline::width",[=[2.000000]=])
mmSetParamValue("::ls1ParticleFormat_1::representation",[=[Atoms]=])
mmSetParamValue("::adiosDataSource_1::filename",[=[co2_merkers_checkpoint.bp]=])
mmSetParamValue("::TransferFunction_1::TransferFunction",[=[{
  "IgnoreProjectRange": true,
  "Interpolation": "GAUSS",
  "Nodes": [
    [
      9.999999747378752e-05,
      9.998999303206801e-05,
      9.998999303206801e-05,
      1.0,
      0.0,
      0.05000000074505806
    ],
    [
      1.0,
      0.0,
      0.0,
      0.9941614270210266,
      0.5,
      0.05000000074505806
    ],
    [
      1.0,
      0.0,
      0.0,
      1.0,
      1.0,
      0.05000000074505806
    ]
  ],
  "TextureSize": 256,
  "ValueRange": [
    0.0,
    2.0
  ]
}]=])
mmSetParamValue("::BoundingBoxRenderer_1::enableBoundingBox",[=[true]=])
mmSetParamValue("::BoundingBoxRenderer_1::boundingBoxColor",[=[#ffffff]=])
mmSetParamValue("::BoundingBoxRenderer_1::smoothLines",[=[true]=])
mmSetParamValue("::BoundingBoxRenderer_1::enableViewCube",[=[false]=])
mmSetParamValue("::BoundingBoxRenderer_1::viewCubePosition",[=[top right]=])
mmSetParamValue("::BoundingBoxRenderer_1::viewCubeSize",[=[100]=])

mmSetGUIVisible(true)
mmSetGUIScale(1.000000)
mmSetGUIState([=[{"ConfiguratorState":{"module_list_sidebar_width":250.0,"show_module_list_sidebar":true},"GUIState":{"font_file_name":"","font_size":13,"imgui_settings":"[Window][Configurator     F11]\nPos=291,80\nSize=1581,795\nCollapsed=0\nDockId=0x00000005,0\n\n[Window][Parameters     F10]\nPos=0,18\nSize=479,795\nCollapsed=0\nDockId=0x00000003,0\n\n[Window][Log Console     F9]\nPos=0,815\nSize=1920,265\nCollapsed=0\nDockId=0x00000002,0\n\n[Window][Transfer Function Editor     F8]\nCollapsed=0\nDockId=0x00000003\n\n[Window][DockSpaceViewport_11111111]\nPos=0,18\nSize=1920,1062\nCollapsed=0\n\n[Window][Debug##Default]\nPos=60,60\nSize=400,400\nCollapsed=0\n\n[Window][Select File]\nPos=760,290\nSize=400,500\nCollapsed=0\n\n[Window][Log Console -  [File Parameter]]\nPos=60,60\nSize=16,34\nCollapsed=0\n\n[Window][Save Project (.lua)]\nPos=763,290\nSize=400,500\nCollapsed=0\n\n[Docking][Data]\nDockNode      ID=0x00000005 Pos=291,80 Size=1581,795\nDockSpace     ID=0x8B93E3BD Window=0xA787BDB4 Pos=0,18 Size=1920,1062 Split=Y\n  DockNode    ID=0x00000001 Parent=0x8B93E3BD SizeRef=1920,808 Split=X\n    DockNode  ID=0x00000003 Parent=0x00000001 SizeRef=479,808 Selected=0x75D4D3D8\n    DockNode  ID=0x00000004 Parent=0x00000001 SizeRef=1439,808 CentralNode=1 Selected=0xAE7400BF\n  DockNode    ID=0x00000002 Parent=0x8B93E3BD SizeRef=1920,270 Selected=0xE0B4A65C\n\n","menu_visible":true,"style":2},"GraphStates":{"Project":{"Modules":{"::BoundingBoxRenderer_1":{"graph_position":[159.0,458.0]},"::SphereRenderer_1":{"graph_position":[394.0,274.0]},"::TransferFunction_1":{"graph_position":[952.0,424.0]},"::View3DGL_1":{"graph_position":[178.0,299.0]},"::adiosDataSource_1":{"graph_position":[1038.0,274.0]},"::ls1ParticleFormat_1":{"graph_position":[726.0,274.0]}},"canvas_scrolling":[415.0,-126.0],"canvas_zooming":1.0,"param_extended_mode":false,"parameter_sidebar_width":300.0,"params_readonly":false,"params_visible":true,"project_name":"Project_2","show_call_label":true,"show_call_slots_label":false,"show_grid":false,"show_module_label":true,"show_parameter_sidebar":true,"show_slot_label":false}},"ParameterStates":{"::BoundingBoxRenderer_1::boundingBoxColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer_1::enableBoundingBox":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer_1::enableViewCube":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer_1::smoothLines":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer_1::viewCubePosition":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer_1::viewCubeSize":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::ambient occlusion::apex":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::ambient occlusion::coneLength":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::ambient occlusion::enableLighting":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::ambient occlusion::highPrecisionTexture":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::ambient occlusion::offset":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::ambient occlusion::strength":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::ambient occlusion::useGsProxies":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::ambient occlusion::volumeSize":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::flag storage::selectedColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":false},"::SphereRenderer_1::flag storage::softSelectedColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":false},"::SphereRenderer_1::forceTime":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::outline::width":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::SphereRenderer_1::renderMode":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::scaling":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::SphereRenderer_1::splat::alphaScaling":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::SphereRenderer_1::splat::attenuateSubpixel":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::SphereRenderer_1::ssbo::staticData":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::SphereRenderer_1::useLocalBbox":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::TransferFunction_1::TransferFunction":{"gui_presentation_mode":32,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::ParameterGroup::anim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::ParameterGroup::view":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::anim::SpeedDown":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::anim::SpeedUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::anim::play":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::anim::speed":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::anim::time":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::anim::togglePlay":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::backCol":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::centeroffset":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::convergenceplane":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::halfaperturedegrees":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::halfdisparity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::orientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::ovr::lookat":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::ovr::override":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::ovr::up":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::position":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::cam::projectiontype":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::camstore::autoLoadSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::camstore::autoSaveSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::camstore::overrideSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::camstore::restorecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::camstore::settings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::camstore::storecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::enableMouseSelection":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::hookOnChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::resetViewOnBBoxChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::showLookAt":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::view::cubeOrientation":{"gui_presentation_mode":2,"gui_read-only":true,"gui_visibility":false},"::View3DGL_1::view::defaultOrientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::view::defaultView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::view::resetView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::view::showViewCube":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::viewKey::AngleStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::viewKey::FixToWorldUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::viewKey::MouseSensitivity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::viewKey::MoveStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::viewKey::RotPoint":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL_1::viewKey::RunFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::adiosDataSource_1::filename":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::ls1ParticleFormat_1::representation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true}},"WindowConfigurations":{"Configurator":{"fpsms_max_value_count":20,"fpsms_mode":0,"fpsms_refresh_rate":2.0,"fpsms_show_options":false,"log_force_open":true,"log_level":4294967295,"param_extended_mode":false,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":6,"win_collapsed":false,"win_flags":1032,"win_hotkey":[300,0],"win_position":[291.0,80.0],"win_reset_position":[0.0,0.0],"win_reset_size":[1920.0,1080.0],"win_show":false,"win_size":[1581.0,795.0]},"Log Console":{"fpsms_max_value_count":20,"fpsms_mode":0,"fpsms_refresh_rate":2.0,"fpsms_show_options":false,"log_force_open":true,"log_level":4294967295,"param_extended_mode":false,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":7,"win_collapsed":false,"win_flags":3072,"win_hotkey":[298,0],"win_position":[0.0,815.0],"win_reset_position":[0.0,904.0],"win_reset_size":[1920.0,176.0],"win_show":true,"win_size":[1920.0,265.0]},"Parameters":{"fpsms_max_value_count":20,"fpsms_mode":0,"fpsms_refresh_rate":2.0,"fpsms_show_options":false,"log_force_open":true,"log_level":4294967295,"param_extended_mode":false,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":1,"win_collapsed":false,"win_flags":8,"win_hotkey":[299,0],"win_position":[0.0,18.0],"win_reset_position":[0.0,0.0],"win_reset_size":[400.0,500.0],"win_show":true,"win_size":[479.0,795.0]},"Performance Metrics":{"fpsms_max_value_count":20,"fpsms_mode":0,"fpsms_refresh_rate":2.0,"fpsms_show_options":false,"log_force_open":true,"log_level":4294967295,"param_extended_mode":false,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":3,"win_collapsed":false,"win_flags":2097217,"win_hotkey":[296,0],"win_position":[960.0,0.0],"win_reset_position":[960.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]},"Transfer Function Editor":{"fpsms_max_value_count":20,"fpsms_mode":0,"fpsms_refresh_rate":2.0,"fpsms_show_options":false,"log_force_open":true,"log_level":4294967295,"param_extended_mode":false,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":5,"win_collapsed":false,"win_flags":64,"win_hotkey":[297,0],"win_position":[400.0,0.0],"win_reset_position":[400.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]}}}]=])
