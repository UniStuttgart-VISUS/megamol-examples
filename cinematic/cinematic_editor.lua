﻿-- Adapt the following variables to your needs:

project_file = "../examples/testspheres.lua"
keyframe_file = "../examples/cinematic/testspheres_keyframes.kf"

--- Do not change anything below ----------------------------------------------

mmCreateView("cinematic_editor", "GUIView", "::cinematic::GUIView1")
mmCreateModule("SplitView", "::cinematic::SplitView1")
mmSetParamValue("::cinematic::SplitView1::split.orientation", [=[1]=])
mmSetParamValue("::cinematic::SplitView1::split.pos", [=[0.65]=])
mmSetParamValue("::cinematic::SplitView1::split.colour", [=[white]=])

mmCreateModule("SplitView", "::cinematic::SplitView2")
mmSetParamValue("::cinematic::SplitView2::split.pos", [=[0.55]=])
mmSetParamValue("::cinematic::SplitView2::split.colour", [=[white]=])

mmCreateModule("KeyframeKeeper", "::cinematic::KeyframeKeeper1")
mmSetParamValue("::cinematic::KeyframeKeeper1::storage::filename", keyframe_file)

mmCreateModule("View2D", "::cinematic::View2D1")
mmSetParamValue("::cinematic::View2D1::backCol", [=[black]=])
mmSetParamValue("::cinematic::View2D1::resetViewOnBBoxChange", [=[True]=])
mmSetParamValue("::cinematic::View2D1::showBBox", [=[false]=])

mmCreateModule("View3D_2", "::cinematic::View3D1")
mmSetParamValue("::cinematic::View3D1::backCol", [=[black]=])

mmCreateModule("TimeLineRenderer", "::cinematic::TimeLineRenderer1")

mmCreateModule("TrackingshotRenderer", "::cinematic::TrackingshotRenderer1")

mmCreateModule("CinematicView", "::cinematic::CinematicView1")
mmSetParamValue("::cinematic::CinematicView1::backCol", [=[Gray]=])
mmSetParamValue("::cinematic::CinematicView1::cinematic::fps", [=[24]=])

mmCreateModule("ReplacementRenderer", "::cinematic::ReplacementRenderer1")
mmSetParamValue("::cinematic::ReplacementRenderer1::hotkeyAssignment", [=[Alt + 1]=])
mmSetParamValue("::cinematic::ReplacementRenderer1::replacement", [=[true]=])

mmCreateModule("ReplacementRenderer", "::cinematic::ReplacementRenderer2")
mmSetParamValue("::cinematic::ReplacementRenderer2::hotkeyAssignment", [=[Alt + 2]=])
mmSetParamValue("::cinematic::ReplacementRenderer2::replacement", [=[false]=])

mmCreateCall("CallRenderView", "::cinematic::GUIView1::renderview", "::cinematic::SplitView1::render")
mmCreateCall("CallRenderView", "::cinematic::SplitView1::render1", "::cinematic::SplitView2::render")
mmCreateCall("CallRenderView", "::cinematic::SplitView1::render2", "::cinematic::View2D1::render")
mmCreateCall("CallRenderView", "::cinematic::SplitView2::render1", "::cinematic::View3D1::render")
mmCreateCall("CallKeyframeKeeper", "::cinematic::TimeLineRenderer1::keyframeData", "::cinematic::KeyframeKeeper1::keyframeData")
mmCreateCall("CallRender3D_2", "::cinematic::View3D1::rendering", "::cinematic::TrackingshotRenderer1::rendering")
mmCreateCall("CallKeyframeKeeper", "::cinematic::TrackingshotRenderer1::keyframeData", "::cinematic::KeyframeKeeper1::keyframeData")
mmCreateCall("CallRender3D_2", "::cinematic::TrackingshotRenderer1::chainRendering", "::cinematic::ReplacementRenderer1::rendering")
mmCreateCall("CallRender2D", "::cinematic::View2D1::rendering", "::cinematic::TimeLineRenderer1::rendering")
mmCreateCall("CallRenderView", "::cinematic::SplitView2::render2", "::cinematic::CinematicView1::render")
mmCreateCall("CallKeyframeKeeper", "::cinematic::CinematicView1::keyframeData", "::cinematic::KeyframeKeeper1::keyframeData")
mmCreateCall("CallRender3D_2", "::cinematic::CinematicView1::rendering", "::cinematic::ReplacementRenderer2::rendering")

function trafo(str)

  -- Break if SplitView or CinematicView occure anywhere in the project
  local startpos, endpos, word = str:find("SplitView")
  if not (startpos == nil) then
    print( "lua ERROR: Cinematic Editor can not be used with projects containing \"SplitView\"."  )
    return ""
  end
  startpos, endpos, word = str:find("CinematicView")
  if not (startpos == nil) then
    print( "lua ERROR: Cinematic Editor can not be used with projects containing \"CinematicView\"."  )
    return ""
  end  

  local viewclass, viewmoduleinst
  startpos, endpos, word = str:find("mmCreateView%(.-,%s*[\"\']([^\"\']+)[\"\']%s*,.-%)")
  if word == "GUIView" then
    print( "lua INFO: Found \"GUIView\" as head view." )
    startpos, endpos, word = str:find("mmCreateModule%(.-View.-%)")
    local substring = str:sub(startpos, endpos)
    viewclass, viewmoduleinst = substring:match(
      'mmCreateModule%(%s*[\"\']([^\"\']+)[\"\']%s*,%s*[\"\']([^\"\']+)[\"\']%s*%)')
  else
     viewclass, viewmoduleinst = str:match(
      'mmCreateView%(.-,%s*[\"\']([^\"\']+)[\"\']%s*,%s*[\"\']([^\"\']+)[\"\']%s*%)')
  end
  print("lua INFO: View Class = " .. viewclass)
  print("lua INFO: View Module Instance = " .. viewmoduleinst)

  local newcontent  = str:gsub("mmCreateView%(.-%)", "")
  newcontent = newcontent:gsub("mmCreateModule%(.-\"View.-%)", "")
  newcontent = newcontent:gsub("mmCreateCall%(\"CallRenderView.-%)", "")
  newcontent = newcontent:gsub('mmCreateCall%([\"\']CallRender3D_2[\'\"],%s*[\'\"]' .. '.-' .. viewmoduleinst .. '::rendering[\'\"],([^,]+)%)', 
  'mmCreateCall("CallRender3D_2", "::cinematic::ReplacementRenderer1::chainRendering",%1)' .. "\n" .. 
  'mmCreateCall("CallRender3D_2", "::cinematic::ReplacementRenderer2::chainRendering",%1)')
  
  -- Assign all parameter values of main view in given project file to cinematic view:
  local newestcontent = newcontent:gsub('mmSetParamValue%([\"\']' .. viewmoduleinst .. '(.*)%)', 'mmSetParamValue("::cinematic::CinematicView1%1)')
  while newcontent ~= newestcontent do
    newcontent = newestcontent
    newestcontent = newcontent:gsub('mmSetParamValue%([\"\']' .. viewmoduleinst .. '(.*)%)', 'mmSetParamValue("::cinematic::CinematicView1%1)')
  end

  return newestcontent
end

local content = mmReadTextFile(project_file, trafo)
print("lua INFO: Transformed Given Project File =\n" .. content .. "\n\n ")
code = load(content)
code()


-- <GUI_STATE_JSON>{"ConfiguratorState":{"module_list_sidebar_width":250.0,"show_module_list_sidebar":true},"GUIState":{"font_file_name":"","font_size":13,"gui_enabled":true,"menu_visible":false,"scale":1.0,"style":2},"ParameterStates":{"::bbox::boundingBoxColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::bbox::enableBoundingBox":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::bbox::enableViewCube":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::bbox::smoothLines":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::bbox::viewCubePosition":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::bbox::viewCubeSize":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::ParameterGroup::anim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::ParameterGroup::view":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::anim::SpeedDown":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::anim::SpeedUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::anim::play":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::anim::speed":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::anim::time":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::anim::togglePlay":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::backCol":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::centeroffset":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::convergenceplane":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::halfaperturedegrees":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::halfdisparity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::orientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::ovr::lookat":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::ovr::override":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::ovr::up":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::position":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cam::projectiontype":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::camstore::autoLoadSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::camstore::autoSaveSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::camstore::overrideSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::camstore::restorecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::camstore::settings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::camstore::storecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::addSBSideToName":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::cinematicHeight":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::cinematicWidth":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::delayFirstFrame":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::firstFrame":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::fps":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::frameFolder":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::lastFrame":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::playPreview":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::renderAnim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::skyboxCubeMode":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::skyboxSide":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::stereo_eye":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::cinematic::stereo_projection":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::enableMouseSelection":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::hookOnChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::resetView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::resetViewOnBBoxChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::showLookAt":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::softCursor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::view::cubeOrientation":{"gui_presentation_mode":2,"gui_read-only":true,"gui_visibility":false},"::cinematic::CinematicView1::view::defaultView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::view::showViewCube":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::viewKey::AngleStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::viewKey::FixToWorldUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::viewKey::MouseSensitivity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::viewKey::MoveStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::viewKey::RotPoint":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::CinematicView1::viewKey::RunFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::applyKeyframe":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::deleteKeyframe":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::editSelected::animTime":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::editSelected::apertureAngle":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::editSelected::lookAtVector":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::editSelected::positionVector":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::editSelected::resetLookAt":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::editSelected::simTime":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::editSelected::upVector":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::interpolTangent":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::linearizeSimTime":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::maxAnimTime":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::redoChanges":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::snapAnimFrames":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::snapSimFrames":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::storage::filename":{"gui_presentation_mode":16,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::storage::load":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::storage::save":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::KeyframeKeeper1::undoChanges":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::ReplacementRenderer1::alpha":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::ReplacementRenderer1::hotkeyAssignment":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::ReplacementRenderer1::replacement":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::ReplacementRenderer1::toggleReplacement":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::ReplacementRenderer2::alpha":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::ReplacementRenderer2::hotkeyAssignment":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::ReplacementRenderer2::replacement":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::ReplacementRenderer2::toggleReplacement":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::ParameterGroup::anim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::anim::SpeedDown":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::anim::SpeedUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::anim::play":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::anim::speed":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::anim::time":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::anim::togglePlay":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::inputToBoth":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::split.colour":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::split.orientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::split.pos":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::split.width":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView1::timeLord":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::ParameterGroup::anim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::anim::SpeedDown":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::anim::SpeedUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::anim::play":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::anim::speed":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::anim::time":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::anim::togglePlay":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::inputToBoth":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::split.colour":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::split.orientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::split.pos":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::split.width":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::SplitView2::timeLord":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::TimeLineRenderer1::gotoLeftFrame":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::TimeLineRenderer1::gotoRightFrame":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::TimeLineRenderer1::resetAxes":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::TrackingshotRenderer1::helpText":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::TrackingshotRenderer1::manipulators::showOutsideBBox":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::TrackingshotRenderer1::manipulators::toggleVisibleGroup":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::TrackingshotRenderer1::manipulators::visibleGroup":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::TrackingshotRenderer1::splineSubdivision":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::ParameterGroup::anim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::anim::SpeedDown":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::anim::SpeedUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::anim::play":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::anim::speed":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::anim::time":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::anim::togglePlay":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::backCol":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::bboxCol":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::camstore::restorecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::camstore::settings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::camstore::storecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::resetView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::resetViewOnBBoxChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::showBBox":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View2D1::softCursor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::ParameterGroup::anim":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::ParameterGroup::view":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::anim::SpeedDown":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::anim::SpeedUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::anim::play":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::anim::speed":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::anim::time":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::anim::togglePlay":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::backCol":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::centeroffset":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::convergenceplane":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::halfaperturedegrees":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::halfdisparity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::orientation":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::ovr::lookat":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::ovr::override":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::ovr::up":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::position":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::cam::projectiontype":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::camstore::autoLoadSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::camstore::autoSaveSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::camstore::overrideSettings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::camstore::restorecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::camstore::settings":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::camstore::storecam":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::enableMouseSelection":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::hookOnChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::resetView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::resetViewOnBBoxChange":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::showLookAt":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::softCursor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::view::cubeOrientation":{"gui_presentation_mode":2,"gui_read-only":true,"gui_visibility":false},"::cinematic::View3D1::view::defaultView":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::view::showViewCube":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::viewKey::AngleStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::viewKey::FixToWorldUp":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::viewKey::MouseSensitivity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::viewKey::MoveStep":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::viewKey::RotPoint":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::cinematic::View3D1::viewKey::RunFactor":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::data::numFrames":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::data::numSpheres":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::distantlight::AngularDiameter":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::distantlight::Color":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":true},"::distantlight::Direction":{"gui_presentation_mode":512,"gui_read-only":false,"gui_visibility":true},"::distantlight::EyeDirection":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::distantlight::Intensity":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::renderer::ambient occlusion::apex":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::ambient occlusion::coneLength":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::ambient occlusion::enableLighting":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::ambient occlusion::highPrecisionTexture":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::ambient occlusion::offset":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::ambient occlusion::strength":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::ambient occlusion::useGsProxies":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::ambient occlusion::volumeSize":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::flag storage::selectedColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":false},"::renderer::flag storage::softSelectedColor":{"gui_presentation_mode":8,"gui_read-only":false,"gui_visibility":false},"::renderer::forceTime":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::renderer::outline::width":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::renderMode":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::renderer::scaling":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true},"::renderer::splat::alphaScaling":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::splat::attenuateSubpixel":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::ssbo::staticData":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":false},"::renderer::useLocalBbox":{"gui_presentation_mode":2,"gui_read-only":false,"gui_visibility":true}},"WindowConfigurations":{"Configurator":{"log_force_open":true,"log_level":4294967295,"ms_max_history_count":20,"ms_mode":0,"ms_refresh_rate":2.0,"ms_show_options":false,"param_extended_mode":false,"param_module_filter":0,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":6,"win_collapsed":false,"win_flags":1032,"win_hotkey":[300,0],"win_position":[0.0,0.0],"win_reset_position":[0.0,0.0],"win_reset_size":[1280.0,720.0],"win_show":false,"win_size":[1280.0,720.0]},"Log Console":{"log_force_open":false,"log_level":4294967295,"ms_max_history_count":20,"ms_mode":0,"ms_refresh_rate":2.0,"ms_show_options":false,"param_extended_mode":false,"param_module_filter":0,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":7,"win_collapsed":false,"win_flags":3072,"win_hotkey":[298,0],"win_position":[0.0,544.0],"win_reset_position":[0.0,544.0],"win_reset_size":[1280.0,176.0],"win_show":false,"win_size":[1280.0,176.0]},"Parameters":{"log_force_open":true,"log_level":4294967295,"ms_max_history_count":20,"ms_mode":0,"ms_refresh_rate":2.0,"ms_show_options":false,"param_extended_mode":false,"param_module_filter":0,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":1,"win_collapsed":false,"win_flags":8,"win_hotkey":[299,0],"win_position":[0.0,18.0],"win_reset_position":[0.0,0.0],"win_reset_size":[400.0,500.0],"win_show":false,"win_size":[400.0,500.0]},"Performance Metrics":{"log_force_open":true,"log_level":4294967295,"ms_max_history_count":20,"ms_mode":0,"ms_refresh_rate":2.0,"ms_show_options":false,"param_extended_mode":false,"param_module_filter":0,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":3,"win_collapsed":false,"win_flags":65,"win_hotkey":[296,0],"win_position":[640.0,0.0],"win_reset_position":[640.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]},"Transfer Function Editor":{"log_force_open":true,"log_level":4294967295,"ms_max_history_count":20,"ms_mode":0,"ms_refresh_rate":2.0,"ms_show_options":false,"param_extended_mode":false,"param_module_filter":0,"param_modules_list":[],"param_show_hotkeys":false,"tfe_active_param":"","tfe_view_minimized":false,"tfe_view_vertical":false,"win_callback":5,"win_collapsed":false,"win_flags":64,"win_hotkey":[297,0],"win_position":[400.0,0.0],"win_reset_position":[400.0,0.0],"win_reset_size":[0.0,0.0],"win_show":false,"win_size":[0.0,0.0]}}}</GUI_STATE_JSON>