-- Cinematic MegaMol Configuration File --

print(">>> I am the MegaMol VISUS Cinematic cluster configuration!")

local local_cinematic = mmReadTextFile("cinematic_params.lua", nil)
print("read: " .. local_cinematic)
code = load(local_cinematic)
local cinematic = code()

node_count = 2 -- Hard coded for test purposes 
headNode   = "127.0.0.1"
rank       = mmGetEnvValue("PMI_RANK")

mmSetConfigValue("headNode",   headNode)
mmSetConfigValue("renderHead", "127.0.0.1")

mmSetLogLevel(     0)
mmSetEchoLevel(    "*")
mmSetAppDir(       cinematic.basePath .. "bin")
mmAddShaderDir(    cinematic.basePath .. "share\\shaders")
mmAddResourceDir(  cinematic.basePath .. "share\\resources")
mmPluginLoaderInfo(cinematic.basePath .. "bin", "*.mmplg", "include")

mmSetConfigValue("consolegui", "on")
mmSetConfigValue("topmost",    "off")
mmSetConfigValue("vsync",      "off")
mmSetConfigValue("useKHRdebug", "off")
mmSetConfigValue("arcball",     "on")

mmSetConfigValue("cinematic_width",         tostring(cinematic.width))
mmSetConfigValue("cinematic_height",        tostring(cinematic.height))
mmSetConfigValue("cinematic_fps",           tostring(cinematic.fps))
mmSetConfigValue("cinematic_background",    tostring(cinematic.background))
mmSetConfigValue("cinematic_luaFileToLoad", tostring(cinematic.luaFileToLoad))
mmSetConfigValue("cinematic_keyframeFile",  tostring(cinematic.keyframeFile))

node_index = rank

cc_W_int      = tonumber(tostring(cinematic.width))
cc_H_int      = tonumber(tostring(cinematic.height))           
cc_W_str      = tostring(cinematic.width)
cc_H_str      = tostring(cinematic.height)
cc_tile_X_str = tostring(cc_W_int // node_count * node_index)
cc_tile_W_str = tostring(cc_W_int // node_count)
cc_tile_H_str = cc_H_str

mmSetConfigValue("t1-window", "x50y50w" .. cc_tile_W_str .. "h" .. cc_tile_H_str ) -- .. "nd") 
mmSetConfigValue("tvview",    cc_W_str .. ";" .. cc_H_str)   
mmSetConfigValue("t1-tvtile", cc_tile_X_str .. ";0;" .. cc_tile_W_str .. ";" .. cc_tile_H_str)   
mmSetConfigValue("tvproj",    "mono")
