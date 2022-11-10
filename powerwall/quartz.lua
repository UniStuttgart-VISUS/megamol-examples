mmCheckVersion("d5f4e7f0246afe11-dirty") 
mmCreateView("GraphEntry_1","View3DGL","::v")

mmCreateModule("QuartzParticleFortLoader","::quartz_demo::dat")
mmCreateModule("QuartzCrystalDataSource","::quartz_demo::cryst")
mmCreateModule("QuartzDataGridder","::quartz_demo::grid")
mmCreateModule("ClipPlane","::quartz_demo::clip")
mmCreateModule("QuartzRenderer","::quartz_demo::QuartzRenderer_1")
mmCreateModule("QuartzTexRenderer","::quartz_demo::QuartzTexRenderer_1")
mmCreateModule("PointLight","::quartz_demo::PointLight_1")

mmCreateCall("CallRender3DGL","::v::rendering","::quartz_demo::QuartzTexRenderer_1::rendering")
mmCreateCall("QuartzParticleDataCall","::quartz_demo::grid::datain","::quartz_demo::dat::dataout")
mmCreateCall("QuartzCrystalDataCall","::quartz_demo::grid::crysin","::quartz_demo::cryst::dataout")
mmCreateCall("QuartzParticleGridDataCall","::quartz_demo::QuartzRenderer_1::datain","::quartz_demo::grid::dataout")
mmCreateCall("QuartzCrystalDataCall","::quartz_demo::QuartzRenderer_1::typesin","::quartz_demo::cryst::dataout")
mmCreateCall("CallClipPlane","::quartz_demo::QuartzRenderer_1::clipplane","::quartz_demo::clip::getclipplane")
mmCreateCall("CallLight","::quartz_demo::QuartzRenderer_1::lights","::quartz_demo::PointLight_1::deployLightSlot")
mmCreateCall("QuartzParticleGridDataCall","::quartz_demo::QuartzTexRenderer_1::datain","::quartz_demo::grid::dataout")
mmCreateCall("QuartzCrystalDataCall","::quartz_demo::QuartzTexRenderer_1::typesin","::quartz_demo::cryst::dataout")
mmCreateCall("CallClipPlane","::quartz_demo::QuartzTexRenderer_1::clipplane","::quartz_demo::clip::getclipplane")
mmCreateCall("CallLight","::quartz_demo::QuartzTexRenderer_1::lights","::quartz_demo::PointLight_1::deployLightSlot")

mmSetParamValue("::v::camstore::settings",[=[]=])
mmSetParamValue("::v::camstore::overrideSettings",[=[false]=])
mmSetParamValue("::v::camstore::autoSaveSettings",[=[false]=])
mmSetParamValue("::v::camstore::autoLoadSettings",[=[true]=])
mmSetParamValue("::v::resetViewOnBBoxChange",[=[false]=])
mmSetParamValue("::v::showLookAt",[=[false]=])
mmSetParamValue("::v::view::showViewCube",[=[false]=])
mmSetParamValue("::v::anim::play",[=[false]=])
mmSetParamValue("::v::anim::speed",[=[4.000000]=])
mmSetParamValue("::v::anim::time",[=[0.000000]=])
mmSetParamValue("::v::backCol",[=[#000020]=])
mmSetParamValue("::v::viewKey::MoveStep",[=[0.500000]=])
mmSetParamValue("::v::viewKey::RunFactor",[=[2.000000]=])
mmSetParamValue("::v::viewKey::AngleStep",[=[90.000000]=])
mmSetParamValue("::v::viewKey::FixToWorldUp",[=[true]=])
mmSetParamValue("::v::viewKey::MouseSensitivity",[=[3.000000]=])
mmSetParamValue("::v::viewKey::RotPoint",[=[Look-At]=])
mmSetParamValue("::v::view::cubeOrientation",[=[0.0831081793;0.502698839;-0.081203416;0.856617153]=])
mmSetParamValue("::v::view::defaultView",[=[FACE - Front]=])
mmSetParamValue("::v::view::defaultOrientation",[=[Top]=])
mmSetParamValue("::v::cam::position",[=[1046.62146;-152.029617;728.780945]=])
mmSetParamValue("::v::cam::orientation",[=[0.0831081793;0.502698839;-0.081203416;0.856617153]=])
mmSetParamValue("::v::cam::projectiontype",[=[Perspective]=])
mmSetParamValue("::v::cam::nearplane",[=[797.701538]=])
mmSetParamValue("::v::cam::farplane",[=[1382.213257]=])
mmSetParamValue("::v::cam::halfaperturedegrees",[=[28.647890]=])
mmSetParamValue("::quartz_demo::dat::positionFile",[=[//vestastore/Demos/megamol-data/objects.dat]=])
mmSetParamValue("::quartz_demo::dat::attributeFile",[=[//vestastore/Demos/megamol-data/objdfns.dat]=])
mmSetParamValue("::quartz_demo::dat::bbox::auto",[=[true]=])
mmSetParamValue("::quartz_demo::dat::bbox::min",[=[-1;-1;-1]=])
mmSetParamValue("::quartz_demo::dat::bbox::max",[=[1;1;1]=])
mmSetParamValue("::quartz_demo::cryst::filename",[=[//vestastore/Demos/megamol-data/Q_param.txt]=])
mmSetParamValue("::quartz_demo::grid::gridsizex",[=[7]=])
mmSetParamValue("::quartz_demo::grid::gridsizey",[=[7]=])
mmSetParamValue("::quartz_demo::grid::gridsizez",[=[7]=])
mmSetParamValue("::quartz_demo::clip::enable",[=[true]=])
mmSetParamValue("::quartz_demo::clip::colour",[=[#ffa500]=])
mmSetParamValue("::quartz_demo::clip::normal",[=[1;0;0]=])
mmSetParamValue("::quartz_demo::clip::point",[=[165;165;165]=])
mmSetParamValue("::quartz_demo::clip::dist",[=[165.000000]=])
mmSetParamValue("::quartz_demo::QuartzRenderer_1::grainCol",[=[#c0c0c0]=])
mmSetParamValue("::quartz_demo::QuartzRenderer_1::showClipPlanePoly",[=[true]=])
mmSetParamValue("::quartz_demo::QuartzRenderer_1::showClipAxes",[=[true]=])
mmSetParamValue("::quartz_demo::QuartzRenderer_1::correctPBC",[=[true]=])
mmSetParamValue("::quartz_demo::QuartzTexRenderer_1::grainCol",[=[#c0c0c0]=])
mmSetParamValue("::quartz_demo::QuartzTexRenderer_1::showClipPlanePoly",[=[true]=])
mmSetParamValue("::quartz_demo::QuartzTexRenderer_1::showClipAxes",[=[true]=])
mmSetParamValue("::quartz_demo::QuartzTexRenderer_1::correctPBC",[=[true]=])
mmSetParamValue("::quartz_demo::PointLight_1::Intensity",[=[1.000000]=])
mmSetParamValue("::quartz_demo::PointLight_1::Color",[=[#cccccc]=])
mmSetParamValue("::quartz_demo::PointLight_1::Position",[=[1;0;0]=])
mmSetParamValue("::quartz_demo::PointLight_1::Radius",[=[0.000000]=])

mmSetGUIVisible(true)
mmSetGUIScale(1.000000)
mmSetGUIState([=[{"ConfiguratorState":{"module_list_sidebar_width":250.0,"show_module_list_sidebar":false},"GUIState":{"font_file_name":"Roboto-Regular.ttf","font_size":12.0,"global_win_background_alpha":1.0,"imgui_settings":"[Window][Configurator     F11]\nPos=481,18\nSize=1439,790\nCollapsed=0\nDockId=0x00000004,0\n\n[Window][Parameters     F10]\nPos=0,18\nSize=479,790\nCollapsed=0\nDockId=0x00000003,0\n\n[Window][Log Console     F9]\nPos=0,810\nSize=1920,270\nCollapsed=0\nDockId=0x00000002,0\n\n[Window][DockSpaceViewport_11111111]\nPos=0,18\nSize=1920,1062\nCollapsed=0\n\n[Window][Debug##Default]\nPos=60,60\nSize=400,400\nCollapsed=0\n\n[Window][###fbw29096]\nPos=760,290\nSize=400,500\nCollapsed=0\n\n[Window][###fbw9750]\nPos=760,290\nSize=400,500\nCollapsed=0\n\n[Docking][Data]\nDockSpace     ID=0x8B93E3BD Window=0xA787BDB4 Pos=0,18 Size=1920,1062 Split=Y\n  DockNode    ID=0x00000001 Parent=0x8B93E3BD SizeRef=1920,808 Split=X\n    DockNode  ID=0x00000003 Parent=0x00000001 SizeRef=479,808 Selected=0x20D298EF\n    DockNode  ID=0x00000004 Parent=0x00000001 SizeRef=1439,808 CentralNode=1 Selected=0xB6EA6B89\n  DockNode    ID=0x00000002 Parent=0x8B93E3BD SizeRef=1920,270 Selected=0xF54B1F54\n\n","menu_visible":true,"style":2},"GraphStates":{"Project":{"Interfaces":{"quartz_demo":{"interface_slot_0":["::quartz_demo::QuartzRenderer_1::rendering"],"interface_slot_1":["::quartz_demo::QuartzTexRenderer_1::rendering"]}},"Modules":{"::quartz_demo::PointLight_1":{"graph_position":[842.0,440.0]},"::quartz_demo::QuartzRenderer_1":{"graph_position":[389.0,97.0]},"::quartz_demo::QuartzTexRenderer_1":{"graph_position":[376.0,304.0]},"::quartz_demo::clip":{"graph_position":[618.0,189.0]},"::quartz_demo::cryst":{"graph_position":[1047.0,216.0]},"::quartz_demo::dat":{"graph_position":[1047.0,120.0]},"::quartz_demo::grid":{"graph_position":[767.0,121.0]},"::v":{"graph_position":[80.0,119.0]}},"call_coloring_map":0,"call_coloring_mode":0,"canvas_scrolling":[0.0,0.0],"canvas_zooming":1.0,"param_extended_mode":false,"parameter_sidebar_width":300.0,"profiling_bar_height":300.0,"project_name":"Project_1","show_call_label":true,"show_call_slots_label":false,"show_grid":false,"show_module_label":true,"show_parameter_sidebar":false,"show_profiling_bar":false,"show_slot_label":false}},"ParameterStates":{"::quartz_demo::PointLight_1::Color":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::PointLight_1::Intensity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::PointLight_1::Position":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::PointLight_1::Radius":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::QuartzRenderer_1::correctPBC":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::QuartzRenderer_1::grainCol":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::QuartzRenderer_1::showClipAxes":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::QuartzRenderer_1::showClipPlanePoly":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::QuartzTexRenderer_1::correctPBC":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::QuartzTexRenderer_1::grainCol":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::QuartzTexRenderer_1::showClipAxes":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::QuartzTexRenderer_1::showClipPlanePoly":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::clip::colour":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::clip::dist":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::clip::enable":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::clip::normal":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::clip::point":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::cryst::filename":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::dat::attributeFile":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::dat::bbox::auto":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::dat::bbox::max":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::dat::bbox::min":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::dat::positionFile":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::grid::gridsizex":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::grid::gridsizey":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::quartz_demo::grid::gridsizez":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::ParameterGroup::anim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::ParameterGroup::view":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::anim::SpeedDown":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::anim::SpeedUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::anim::play":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::anim::speed":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::anim::time":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::anim::togglePlay":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::backCol":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::v::cam::farplane":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::cam::halfaperturedegrees":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::cam::nearplane":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::cam::orientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::cam::position":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::cam::projectiontype":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::camstore::autoLoadSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::camstore::autoSaveSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::camstore::overrideSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::camstore::restorecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::camstore::settings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::camstore::storecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::resetViewOnBBoxChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::showLookAt":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::view::cubeOrientation":{"gui_presentation_mode":2,"gui_read-only":true,"gui_visibility":false},"::v::view::defaultOrientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::view::defaultView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::view::resetView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::view::showViewCube":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::viewKey::AngleStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::viewKey::FixToWorldUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::viewKey::MouseSensitivity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::viewKey::MoveStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::viewKey::RotPoint":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::v::viewKey::RunFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true}},"WindowConfigurations":{"Configurator":{"win_callback":6,"win_collapsed":false,"win_flags":263176,"win_hotkey":[300,0],"win_position":[481.0,18.0],"win_reset_position":[0.0,0.0],"win_reset_size":[750.0,500.0],"win_show":false,"win_size":[1439.0,790.0]},"Hotkey Editor":{"hotkey_list":[[{"key":293,"mods":4,"name":"_hotkey_gui_exit","parent":"","parent_type":2}],[{"key":83,"mods":2,"name":"_hotkey_gui_save_project","parent":"","parent_type":2}],[{"key":76,"mods":2,"name":"_hotkey_gui_load_project","parent":"","parent_type":2}],[{"key":301,"mods":0,"name":"_hotkey_gui_menu","parent":"","parent_type":2}],[{"key":292,"mods":0,"name":"_hotkey_gui_toggle_graph_entry","parent":"","parent_type":2}],[{"key":291,"mods":0,"name":"_hotkey_gui_trigger_screenshot","parent":"","parent_type":2}],[{"key":71,"mods":2,"name":"_hotkey_gui_show-hide","parent":"","parent_type":2}],[{"key":300,"mods":0,"name":"_hotkey_gui_window_Configurator","parent":"17030246060415721360","parent_type":3}],[{"key":77,"mods":3,"name":"_hotkey_gui_configurator_module_search","parent":"","parent_type":4}],[{"key":80,"mods":3,"name":"_hotkey_gui_configurator_param_search","parent":"","parent_type":4}],[{"key":261,"mods":0,"name":"_hotkey_gui_configurator_delete_graph_entry","parent":"","parent_type":4}],[{"key":83,"mods":3,"name":"_hotkey_gui_configurator_save_project","parent":"","parent_type":4}],[{"key":299,"mods":0,"name":"_hotkey_gui_window_Parameters","parent":"2021973547876601465","parent_type":3}],[{"key":80,"mods":2,"name":"_hotkey_gui_parameterlist_param_search","parent":"","parent_type":4}],[{"key":298,"mods":0,"name":"_hotkey_gui_window_Log Console","parent":"3923344468212134616","parent_type":3}],[{"key":297,"mods":0,"name":"_hotkey_gui_window_Transfer Function Editor","parent":"6166565350214160899","parent_type":3}],[{"key":296,"mods":0,"name":"_hotkey_gui_window_Performance Metrics","parent":"4920642770320252208","parent_type":3}],[{"key":295,"mods":0,"name":"_hotkey_gui_window_Hotkey Editor","parent":"529232018636216348","parent_type":3}],[{"key":67,"mods":5,"name":"::v_camstore::storecam","parent":"::::v::camstore::storecam","parent_type":1}],[{"key":67,"mods":4,"name":"::v_camstore::restorecam","parent":"::::v::camstore::restorecam","parent_type":1}],[{"key":268,"mods":0,"name":"::v_view::resetView","parent":"::::v::view::resetView","parent_type":1}],[{"key":32,"mods":0,"name":"::v_anim::togglePlay","parent":"::::v::anim::togglePlay","parent_type":1}],[{"key":77,"mods":0,"name":"::v_anim::SpeedUp","parent":"::::v::anim::SpeedUp","parent_type":1}],[{"key":78,"mods":0,"name":"::v_anim::SpeedDown","parent":"::::v::anim::SpeedDown","parent_type":1}]],"win_callback":4,"win_collapsed":false,"win_flags":262144,"win_hotkey":[295,0],"win_position":[0.0,0.0],"win_reset_position":[0.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]},"Log Console":{"log_force_open":true,"log_level":2,"win_callback":7,"win_collapsed":false,"win_flags":265216,"win_hotkey":[298,0],"win_position":[0.0,810.0],"win_reset_position":[0.0,0.0],"win_reset_size":[500.0,50.0],"win_show":true,"win_size":[1920.0,270.0]},"Parameters":{"param_extended_mode":false,"param_modules_list":[],"win_callback":1,"win_collapsed":false,"win_flags":262152,"win_hotkey":[299,0],"win_position":[0.0,18.0],"win_reset_position":[0.0,0.0],"win_reset_size":[400.0,500.0],"win_show":true,"win_size":[479.0,790.0]},"Performance Metrics":{"fpsms_max_value_count":20,"fpsms_mode":0,"fpsms_refresh_rate":2.0,"fpsms_show_options":false,"win_callback":3,"win_collapsed":false,"win_flags":2359361,"win_hotkey":[296,0],"win_position":[0.0,0.0],"win_reset_position":[0.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]},"Transfer Function Editor":{"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":5,"win_collapsed":false,"win_flags":262208,"win_hotkey":[297,0],"win_position":[0.0,0.0],"win_reset_position":[0.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]}}}]=])
