-- Adapt the following variables to your needs:

project_file = "../examples/testspheres.lua"
keyframe_file = "../examples/cinematic/testspheres_keyframes.kf"

--- Do not change anything below ----------------------------------------------

mmCreateView("cinematic_editor", "SplitViewGL", "::cinematic::SplitViewGL1")
mmSetParamValue("::cinematic::SplitViewGL1::split.orientation", [=[1]=])
mmSetParamValue("::cinematic::SplitViewGL1::split.pos", [=[0.65]=])
mmSetParamValue("::cinematic::SplitViewGL1::split.colour", [=[white]=])

mmCreateModule("SplitViewGL", "::cinematic::SplitViewGL2")
mmSetParamValue("::cinematic::SplitViewGL2::split.pos", [=[0.55]=])
mmSetParamValue("::cinematic::SplitViewGL2::split.colour", [=[white]=])

mmCreateModule("KeyframeKeeper", "::cinematic::KeyframeKeeper1")
mmSetParamValue("::cinematic::KeyframeKeeper1::storage::filename", keyframe_file)

mmCreateModule("View2DGL", "::cinematic::View2DGL1")
mmSetParamValue("::cinematic::View2DGL1::backCol", [=[black]=])
mmSetParamValue("::cinematic::View2DGL1::resetViewOnBBoxChange", [=[True]=])

mmCreateModule("View3DGL", "::cinematic::View3DGL1")
mmSetParamValue("::cinematic::View3DGL1::backCol", [=[black]=])

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

mmCreateCall("CallRenderViewGL", "::cinematic::SplitViewGL1::render1", "::cinematic::SplitViewGL2::render")
mmCreateCall("CallRenderViewGL", "::cinematic::SplitViewGL1::render2", "::cinematic::View2DGL1::render")
mmCreateCall("CallRenderViewGL", "::cinematic::SplitViewGL2::render1", "::cinematic::View3DGL1::render")
mmCreateCall("CallKeyframeKeeper", "::cinematic::TimeLineRenderer1::keyframeData", "::cinematic::KeyframeKeeper1::keyframeData")
mmCreateCall("CallRender3DGL", "::cinematic::View3DGL1::rendering", "::cinematic::TrackingshotRenderer1::rendering")
mmCreateCall("CallKeyframeKeeper", "::cinematic::TrackingshotRenderer1::keyframeData", "::cinematic::KeyframeKeeper1::keyframeData")
mmCreateCall("CallRender3DGL", "::cinematic::TrackingshotRenderer1::chainRendering", "::cinematic::ReplacementRenderer1::rendering")
mmCreateCall("CallRender2DGL", "::cinematic::View2DGL1::rendering", "::cinematic::TimeLineRenderer1::rendering")
mmCreateCall("CallRenderViewGL", "::cinematic::SplitViewGL2::render2", "::cinematic::CinematicView1::render")
mmCreateCall("CallKeyframeKeeper", "::cinematic::CinematicView1::keyframeData", "::cinematic::KeyframeKeeper1::keyframeData")
mmCreateCall("CallRender3DGL", "::cinematic::CinematicView1::rendering", "::cinematic::ReplacementRenderer2::rendering")

function trafo(str)

  -- Break if SplitViewGL or CinematicView occure anywhere in the project
  local startpos, endpos, word = str:find("SplitViewGL")
  if not (startpos == nil) then
    print( "lua ERROR: Cinematic Editor can not be used with projects containing \"SplitViewGL\"."  )
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
  newcontent = newcontent:gsub("mmCreateCall%(\"CallRenderViewGL.-%)", "")
  newcontent = newcontent:gsub('mmCreateCall%([\"\']CallRender3DGL[\'\"],%s*[\'\"]' .. '.-' .. viewmoduleinst .. '::rendering[\'\"],([^,]+)%)', 
  'mmCreateCall("CallRender3DGL", "::cinematic::ReplacementRenderer1::chainRendering",%1)' .. "\n" .. 
  'mmCreateCall("CallRender3DGL", "::cinematic::ReplacementRenderer2::chainRendering",%1)')
  
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

