mmCheckVersion("0cdf974575f6-dirty") 
mmCreateView("GraphEntry_1","View3DGL","::View3DGL1")

mmCreateModule("ScreenShooter","::ScreenShooter_1")
mmCreateModule("DrawToScreen","::DrawToScreen1")
mmCreateModule("BoundingBoxRenderer","::BoundingBoxRenderer1")
mmCreateModule("RenderMDIMesh","::RenderMDIMesh1")
mmCreateModule("GlTFRenderTasksDataSource","::GlTFRenderTasksDataSource1")
mmCreateModule("GPUMeshes","::GPUMeshes1")
mmCreateModule("GlTFFileLoader","::GlTFFileLoader1")
mmCreateModule("SimpleRenderTarget","::SimpleRenderTarget1")
mmCreateModule("LocalLighting","::Lighting&Post::LocalLighting1")
mmCreateModule("TextureCombine","::Lighting&Post::TextureCombine1")
mmCreateModule("ScreenSpaceEffect","::Lighting&Post::SSAO")
mmCreateModule("DistantLight","::Lighting&Post::DistantLight1")
mmCreateModule("AntiAliasing","::Lighting&Post::AntiAliasing_1")

mmCreateCall("CallRender3DGL","::DrawToScreen1::chainRendering","::SimpleRenderTarget1::rendering")
mmCreateCall("CallTexture2D","::DrawToScreen1::InputTexture","::Lighting&Post::AntiAliasing_1::OutputTexture")
mmCreateCall("CallRender3DGL","::BoundingBoxRenderer1::chainRendering","::DrawToScreen1::rendering")
mmCreateCall("CallGPURenderTaskData","::RenderMDIMesh1::renderTasks","::GlTFRenderTasksDataSource1::renderTasks")
mmCreateCall("CallGPUMeshData","::GlTFRenderTasksDataSource1::gpuMeshes","::GPUMeshes1::gpuMeshes")
mmCreateCall("CallGlTFData","::GlTFRenderTasksDataSource1::gltfModels","::GlTFFileLoader1::gltfModels")
mmCreateCall("CallMesh","::GPUMeshes1::meshes","::GlTFFileLoader1::meshes")
mmCreateCall("CallRender3DGL","::SimpleRenderTarget1::chainRendering","::RenderMDIMesh1::rendering")
mmCreateCall("CallTexture2D","::Lighting&Post::LocalLighting1::AlbedoTexture","::SimpleRenderTarget1::Color")
mmCreateCall("CallTexture2D","::Lighting&Post::LocalLighting1::NormalTexture","::SimpleRenderTarget1::Normals")
mmCreateCall("CallTexture2D","::Lighting&Post::LocalLighting1::DepthTexture","::SimpleRenderTarget1::Depth")
mmCreateCall("CallLight","::Lighting&Post::LocalLighting1::lights","::Lighting&Post::DistantLight1::deployLightSlot")
mmCreateCall("CallCamera","::Lighting&Post::LocalLighting1::Camera","::SimpleRenderTarget1::Camera")
mmCreateCall("CallTexture2D","::Lighting&Post::TextureCombine1::InputTexture0","::Lighting&Post::LocalLighting1::OutputTexture")
mmCreateCall("CallTexture2D","::Lighting&Post::TextureCombine1::InputTexture1","::Lighting&Post::SSAO::OutputTexture")
mmCreateCall("CallTexture2D","::Lighting&Post::SSAO::NormalTexture","::SimpleRenderTarget1::Color")
mmCreateCall("CallTexture2D","::Lighting&Post::SSAO::DepthTexture","::SimpleRenderTarget1::Normals")
mmCreateCall("CallCamera","::Lighting&Post::SSAO::Camera","::SimpleRenderTarget1::Camera")
mmCreateCall("CallTexture2D","::Lighting&Post::AntiAliasing_1::InputTexture","::Lighting&Post::TextureCombine1::OutputTexture")
mmCreateCall("CallRender3DGL","::View3DGL1::rendering","::BoundingBoxRenderer1::rendering")

mmSetParamValue("::ScreenShooter_1::view",[=[View3DGL1]=])
mmSetParamValue("::ScreenShooter_1::imgWidth",[=[1920]=])
mmSetParamValue("::ScreenShooter_1::imgHeight",[=[1080]=])
mmSetParamValue("::ScreenShooter_1::tileWidth",[=[1920]=])
mmSetParamValue("::ScreenShooter_1::tileHeight",[=[1080]=])
mmSetParamValue("::ScreenShooter_1::filename",[=[smaa.png]=])
mmSetParamValue("::ScreenShooter_1::background",[=[Scene Background]=])
mmSetParamValue("::ScreenShooter_1::closeAfter",[=[false]=])
mmSetParamValue("::ScreenShooter_1::disableCompressionSlot",[=[false]=])
mmSetParamValue("::ScreenShooter_1::anim::from",[=[0]=])
mmSetParamValue("::ScreenShooter_1::anim::to",[=[0]=])
mmSetParamValue("::ScreenShooter_1::anim::step",[=[1.000000]=])
mmSetParamValue("::ScreenShooter_1::anim::addTime2Fname",[=[false]=])
mmSetParamValue("::ScreenShooter_1::anim::makeAnim",[=[false]=])
mmSetParamValue("::ScreenShooter_1::anim::paramname",[=[]=])
mmSetParamValue("::BoundingBoxRenderer1::enableBoundingBox",[=[true]=])
mmSetParamValue("::BoundingBoxRenderer1::boundingBoxColor",[=[#ffffff]=])
mmSetParamValue("::BoundingBoxRenderer1::smoothLines",[=[true]=])
mmSetParamValue("::BoundingBoxRenderer1::enableViewCube",[=[false]=])
mmSetParamValue("::BoundingBoxRenderer1::viewCubePosition",[=[top right]=])
mmSetParamValue("::BoundingBoxRenderer1::viewCubeSize",[=[100]=])
mmSetParamValue("::GlTFRenderTasksDataSource1::BTF filename",[=[]=])
mmSetParamValue("::GlTFFileLoader1::glTF filename",[=[../examples/mesh/WaterBottle/glTF/WaterBottle.gltf]=])
mmSetParamValue("::Lighting&Post::LocalLighting1::IlluminationMode",[=[Lambert]=])
mmSetParamValue("::Lighting&Post::LocalLighting1::AmbientColor",[=[#ffffff]=])
mmSetParamValue("::Lighting&Post::LocalLighting1::DiffuseColor",[=[#ffffff]=])
mmSetParamValue("::Lighting&Post::LocalLighting1::SpecularColor",[=[#ffffff]=])
mmSetParamValue("::Lighting&Post::LocalLighting1::AmbientFactor",[=[0.200000]=])
mmSetParamValue("::Lighting&Post::LocalLighting1::DiffuseFactor",[=[0.700000]=])
mmSetParamValue("::Lighting&Post::LocalLighting1::SpecularFactor",[=[0.100000]=])
mmSetParamValue("::Lighting&Post::LocalLighting1::ExponentialFactor",[=[120.000000]=])
mmSetParamValue("::Lighting&Post::TextureCombine1::Mode",[=[Multiply]=])
mmSetParamValue("::Lighting&Post::SSAO::Mode",[=[SSAO]=])
mmSetParamValue("::Lighting&Post::SSAO::SSAO Samples",[=[16]=])
mmSetParamValue("::Lighting&Post::SSAO::SSAO Radius",[=[0.500000]=])
mmSetParamValue("::Lighting&Post::DistantLight1::Intensity",[=[1.000000]=])
mmSetParamValue("::Lighting&Post::DistantLight1::Color",[=[#cccccc]=])
mmSetParamValue("::Lighting&Post::DistantLight1::Direction",[=[-0.246649146;-0.477438658;-0.765648007]=])
mmSetParamValue("::Lighting&Post::DistantLight1::AngularDiameter",[=[0.000000]=])
mmSetParamValue("::Lighting&Post::DistantLight1::EyeDirection",[=[true]=])
mmSetParamValue("::Lighting&Post::AntiAliasing_1::Mode",[=[SMAA]=])
mmSetParamValue("::Lighting&Post::AntiAliasing_1::QualityLevel",[=[HIGH]=])
mmSetParamValue("::Lighting&Post::AntiAliasing_1::EdgeDetection",[=[LUMA]=])
mmSetParamValue("::View3DGL1::camstore::settings",[=[]=])
mmSetParamValue("::View3DGL1::camstore::overrideSettings",[=[false]=])
mmSetParamValue("::View3DGL1::camstore::autoSaveSettings",[=[false]=])
mmSetParamValue("::View3DGL1::camstore::autoLoadSettings",[=[true]=])
mmSetParamValue("::View3DGL1::resetViewOnBBoxChange",[=[false]=])
mmSetParamValue("::View3DGL1::showLookAt",[=[false]=])
mmSetParamValue("::View3DGL1::view::showViewCube",[=[false]=])
mmSetParamValue("::View3DGL1::anim::play",[=[false]=])
mmSetParamValue("::View3DGL1::anim::speed",[=[4.500000]=])
mmSetParamValue("::View3DGL1::anim::time",[=[0.000000]=])
mmSetParamValue("::View3DGL1::backCol",[=[#000020]=])
mmSetParamValue("::View3DGL1::viewKey::MoveStep",[=[0.500000]=])
mmSetParamValue("::View3DGL1::viewKey::RunFactor",[=[2.000000]=])
mmSetParamValue("::View3DGL1::viewKey::AngleStep",[=[90.000000]=])
mmSetParamValue("::View3DGL1::viewKey::FixToWorldUp",[=[true]=])
mmSetParamValue("::View3DGL1::viewKey::MouseSensitivity",[=[3.000000]=])
mmSetParamValue("::View3DGL1::viewKey::RotPoint",[=[Look-At]=])
mmSetParamValue("::View3DGL1::view::cubeOrientation",[=[0;0;0;1]=])
mmSetParamValue("::View3DGL1::view::defaultView",[=[FACE - Front]=])
mmSetParamValue("::View3DGL1::view::defaultOrientation",[=[Top]=])
mmSetParamValue("::View3DGL1::cam::position",[=[0;0;0.56443423]=])
mmSetParamValue("::View3DGL1::cam::orientation",[=[0;-0;-0;1]=])
mmSetParamValue("::View3DGL1::cam::projectiontype",[=[Perspective]=])
mmSetParamValue("::View3DGL1::cam::nearplane",[=[0.000156]=])
mmSetParamValue("::View3DGL1::cam::farplane",[=[1.564434]=])
mmSetParamValue("::View3DGL1::cam::halfaperturedegrees",[=[28.647890]=])

mmSetGUIVisible(true)
mmSetGUIScale(1.000000)
mmSetGUIState([=[{"ConfiguratorState":{"module_list_sidebar_width":250.0,"show_module_list_sidebar":true},"GUIState":{"font_file_name":"","font_size":13,"imgui_settings":"[Window][Configurator     F11]\nPos=281,18\nSize=1639,892\nCollapsed=0\nDockId=0x00000004,0\n\n[Window][Parameters     F10]\nPos=0,18\nSize=279,892\nCollapsed=0\nDockId=0x00000003,0\n\n[Window][Log Console     F9]\nPos=0,912\nSize=1920,168\nCollapsed=0\nDockId=0x00000002,0\n\n[Window][DockSpaceViewport_11111111]\nPos=0,18\nSize=1920,1062\nCollapsed=0\n\n[Window][Debug##Default]\nPos=60,60\nSize=400,400\nCollapsed=0\n\n[Window][###fbw3585]\nPos=760,258\nSize=400,500\nCollapsed=0\n\n[Window][###fbw7404]\nPos=760,258\nSize=400,500\nCollapsed=0\n\n[Window][###fbw17702]\nPos=760,290\nSize=400,500\nCollapsed=0\n\n[Window][###fbw19667]\nPos=1080,438\nSize=400,500\nCollapsed=0\n\n[Window][###fbw9145]\nPos=760,290\nSize=400,500\nCollapsed=0\n\n[Docking][Data]\nDockSpace     ID=0x8B93E3BD Window=0xA787BDB4 Pos=0,18 Size=1920,1062 Split=Y\n  DockNode    ID=0x00000001 Parent=0x8B93E3BD SizeRef=1920,839 Split=X\n    DockNode  ID=0x00000003 Parent=0x00000001 SizeRef=279,761 Selected=0x75D4D3D8\n    DockNode  ID=0x00000004 Parent=0x00000001 SizeRef=1639,761 CentralNode=1 Selected=0xAE7400BF\n  DockNode    ID=0x00000002 Parent=0x8B93E3BD SizeRef=1920,158 Selected=0xE0B4A65C\n\n","menu_visible":true,"style":2},"GraphStates":{"Project":{"Interfaces":{"Lighting&Post":{"interface_slot_0":["::Lighting&Post::AntiAliasing_1::OutputTexture"],"interface_slot_1":["::Lighting&Post::LocalLighting1::AlbedoTexture"],"interface_slot_2":["::Lighting&Post::LocalLighting1::NormalTexture"],"interface_slot_3":["::Lighting&Post::LocalLighting1::DepthTexture"],"interface_slot_4":["::Lighting&Post::LocalLighting1::Camera"],"interface_slot_5":["::Lighting&Post::SSAO::NormalTexture"],"interface_slot_6":["::Lighting&Post::SSAO::DepthTexture"],"interface_slot_7":["::Lighting&Post::SSAO::Camera"]}},"Modules":{"::BoundingBoxRenderer1":{"graph_position":[335.0,112.0]},"::DrawToScreen1":{"graph_position":[606.0,112.0]},"::GPUMeshes1":{"graph_position":[1989.8173828125,-36.88711929321289]},"::GlTFFileLoader1":{"graph_position":[2157.696044921875,67.12639617919922]},"::GlTFRenderTasksDataSource1":{"graph_position":[1706.6658935546875,-9.641082763671875]},"::Lighting&Post::AntiAliasing_1":{"graph_position":[847.3703002929688,-117.99518585205078]},"::Lighting&Post::DistantLight1":{"graph_position":[1558.513427734375,-230.119384765625]},"::Lighting&Post::LocalLighting1":{"graph_position":[1238.302978515625,-259.9229736328125]},"::Lighting&Post::SSAO":{"graph_position":[1228.391357421875,-45.79345703125]},"::Lighting&Post::TextureCombine1":{"graph_position":[1071.849609375,-113.59765625]},"::RenderMDIMesh1":{"graph_position":[1522.9068603515625,141.11573791503906]},"::ScreenShooter_1":{"graph_position":[195.66465759277344,8.940505981445313]},"::SimpleRenderTarget1":{"graph_position":[1237.9925537109375,97.30037689208984]},"::View3DGL1":{"graph_position":[96.0,112.0]}},"canvas_scrolling":[-328.7919921875,201.58689880371094],"canvas_zooming":1.2919942140579224,"param_extended_mode":false,"parameter_sidebar_width":300.0,"project_name":"Project_1","show_call_label":true,"show_call_slots_label":false,"show_grid":false,"show_module_label":true,"show_parameter_sidebar":true,"show_slot_label":false}},"ParameterStates":{"::BoundingBoxRenderer1::boundingBoxColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer1::enableBoundingBox":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer1::enableViewCube":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer1::smoothLines":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer1::viewCubePosition":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::BoundingBoxRenderer1::viewCubeSize":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::GlTFFileLoader1::glTF filename":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::GlTFRenderTasksDataSource1::BTF filename":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::AntiAliasing_1::EdgeDetection":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::AntiAliasing_1::Mode":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::AntiAliasing_1::QualityLevel":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::DistantLight1::AngularDiameter":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::DistantLight1::Color":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::DistantLight1::Direction":{"gui_presentation_mode":512,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::DistantLight1::EyeDirection":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::DistantLight1::Intensity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::LocalLighting1::AmbientColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":false},"::Lighting&Post::LocalLighting1::AmbientFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::Lighting&Post::LocalLighting1::DiffuseColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":false},"::Lighting&Post::LocalLighting1::DiffuseFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::Lighting&Post::LocalLighting1::ExponentialFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::Lighting&Post::LocalLighting1::IlluminationMode":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::LocalLighting1::SpecularColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":false},"::Lighting&Post::LocalLighting1::SpecularFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::Lighting&Post::SSAO::Mode":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::SSAO::SSAO Radius":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::SSAO::SSAO Samples":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::Lighting&Post::TextureCombine1::Mode":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::anim::addTime2Fname":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::anim::from":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::anim::makeAnim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::anim::paramname":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::anim::step":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::anim::to":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::background":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::closeAfter":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::ScreenShooter_1::disableCompressionSlot":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::filename":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::imgHeight":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::imgWidth":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::tileHeight":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::ScreenShooter_1::tileWidth":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::ScreenShooter_1::trigger":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::ScreenShooter_1::view":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::ParameterGroup::anim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::ParameterGroup::view":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::anim::SpeedDown":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::anim::SpeedUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::anim::play":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::anim::speed":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::anim::time":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::anim::togglePlay":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::backCol":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::cam::farplane":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::cam::halfaperturedegrees":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::cam::nearplane":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::cam::orientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::cam::position":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::cam::projectiontype":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::camstore::autoLoadSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::camstore::autoSaveSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::camstore::overrideSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::camstore::restorecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::camstore::settings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::camstore::storecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::resetViewOnBBoxChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::showLookAt":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::view::cubeOrientation":{"gui_presentation_mode":2,"gui_read-only":true,"gui_visibility":false},"::View3DGL1::view::defaultOrientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::view::defaultView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::view::resetView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::view::showViewCube":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::viewKey::AngleStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::viewKey::FixToWorldUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::viewKey::MouseSensitivity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::viewKey::MoveStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::viewKey::RotPoint":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::View3DGL1::viewKey::RunFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true}},"WindowConfigurations":{"Configurator":{"win_callback":6,"win_collapsed":false,"win_flags":1032,"win_hotkey":[300,0],"win_position":[281.0,18.0],"win_reset_position":[0.0,0.0],"win_reset_size":[1920.0,1080.0],"win_show":true,"win_size":[1639.0,892.0]},"Hotkey Editor":{"hotkey_list":[[{"key":293,"mods":4,"name":"_hotkey_gui_exit","parent":"","parent_type":2}],[{"key":83,"mods":2,"name":"_hotkey_gui_save_project","parent":"","parent_type":2}],[{"key":76,"mods":2,"name":"_hotkey_gui_load_project","parent":"","parent_type":2}],[{"key":301,"mods":0,"name":"_hotkey_gui_menu","parent":"","parent_type":2}],[{"key":292,"mods":0,"name":"_hotkey_gui_toggle_graph_entry","parent":"","parent_type":2}],[{"key":291,"mods":0,"name":"_hotkey_gui_trigger_screenshot","parent":"","parent_type":2}],[{"key":71,"mods":2,"name":"_hotkey_gui_show-hide","parent":"","parent_type":2}],[{"key":300,"mods":0,"name":"_hotkey_gui_window_Configurator","parent":"17030246060415721360","parent_type":3}],[{"key":77,"mods":3,"name":"_hotkey_gui_configurator_module_search","parent":"","parent_type":4}],[{"key":80,"mods":3,"name":"_hotkey_gui_configurator_param_search","parent":"","parent_type":4}],[{"key":261,"mods":0,"name":"_hotkey_gui_configurator_delete_graph_entry","parent":"","parent_type":4}],[{"key":83,"mods":3,"name":"_hotkey_gui_configurator_save_project","parent":"","parent_type":4}],[{"key":299,"mods":0,"name":"_hotkey_gui_window_Parameters","parent":"2021973547876601465","parent_type":3}],[{"key":80,"mods":2,"name":"_hotkey_gui_parameterlist_param_search","parent":"","parent_type":4}],[{"key":298,"mods":0,"name":"_hotkey_gui_window_Log Console","parent":"3923344468212134616","parent_type":3}],[{"key":297,"mods":0,"name":"_hotkey_gui_window_Transfer Function Editor","parent":"6166565350214160899","parent_type":3}],[{"key":296,"mods":0,"name":"_hotkey_gui_window_Performance Metrics","parent":"4920642770320252208","parent_type":3}],[{"key":295,"mods":0,"name":"_hotkey_gui_window_Hotkey Editor","parent":"529232018636216348","parent_type":3}],[{"key":67,"mods":5,"name":"::View3DGL1_camstore::storecam","parent":"::::View3DGL1::camstore::storecam","parent_type":1}],[{"key":67,"mods":4,"name":"::View3DGL1_camstore::restorecam","parent":"::::View3DGL1::camstore::restorecam","parent_type":1}],[{"key":268,"mods":0,"name":"::View3DGL1_view::resetView","parent":"::::View3DGL1::view::resetView","parent_type":1}],[{"key":32,"mods":0,"name":"::View3DGL1_anim::togglePlay","parent":"::::View3DGL1::anim::togglePlay","parent_type":1}],[{"key":77,"mods":0,"name":"::View3DGL1_anim::SpeedUp","parent":"::::View3DGL1::anim::SpeedUp","parent_type":1}],[{"key":78,"mods":0,"name":"::View3DGL1_anim::SpeedDown","parent":"::::View3DGL1::anim::SpeedDown","parent_type":1}],[{"key":83,"mods":4,"name":"::ScreenShooter_1_trigger","parent":"::::ScreenShooter_1::trigger","parent_type":1}]],"win_callback":4,"win_collapsed":false,"win_flags":0,"win_hotkey":[295,0],"win_position":[0.0,0.0],"win_reset_position":[0.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]},"Log Console":{"log_force_open":true,"log_level":4294967295,"win_callback":7,"win_collapsed":false,"win_flags":3072,"win_hotkey":[298,0],"win_position":[0.0,912.0],"win_reset_position":[0.0,904.0],"win_reset_size":[1920.0,176.0],"win_show":true,"win_size":[1920.0,168.0]},"Parameters":{"param_extended_mode":false,"param_modules_list":[],"win_callback":1,"win_collapsed":false,"win_flags":8,"win_hotkey":[299,0],"win_position":[0.0,18.0],"win_reset_position":[0.0,0.0],"win_reset_size":[400.0,500.0],"win_show":true,"win_size":[279.0,892.0]},"Performance Metrics":{"fpsms_max_value_count":20,"fpsms_mode":0,"fpsms_refresh_rate":2.0,"fpsms_show_options":false,"win_callback":3,"win_collapsed":false,"win_flags":65,"win_hotkey":[296,0],"win_position":[960.0,0.0],"win_reset_position":[960.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]},"Transfer Function Editor":{"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":5,"win_collapsed":false,"win_flags":64,"win_hotkey":[297,0],"win_position":[400.0,0.0],"win_reset_position":[400.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]}}}]=])