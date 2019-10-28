-- Cinematic MegaMol Configuration File --

print(">>> I am the MegaMol VISUS Cinematic cluster configuration!")

local cinematic = require("cinematic_params")

headNode = "127.0.0.1"
mmSetConfigValue("headNode",   headNode)
mmSetConfigValue("renderHead", "127.0.0.1")

mmSetLogLevel(     0)
mmSetEchoLevel(    "*")
mmSetAppDir(       cinematic.basePath .. "bin")
mmAddShaderDir(    cinematic.basePath .. "share\\shaders")
mmAddResourceDir(  cinematic.basePath .. "share\\resources")
mmPluginLoaderInfo(cinematic.basePath .. "bin", "*.mmplg", "include")


--- Load cinematic parameters ---
mmSetConfigValue("cinematic_width",         tostring(cinematic.width))
mmSetConfigValue("cinematic_height",        tostring(cinematic.height))
mmSetConfigValue("cinematic_fps",           tostring(cinematic.fps))
mmSetConfigValue("cinematic_background",    tostring(cinematic.background))
mmSetConfigValue("cinematic_luaFileToLoad", tostring(cinematic.luaFileToLoad))
mmSetConfigValue("cinematic_keyframeFile",  tostring(cinematic.keyframeFile))


--- Head config values ---
mmSetConfigValue("*-window",   "x5y35w1500h750")
mmSetConfigValue("consolegui", "on")
mmSetConfigValue("topmost",    "off")
mmSetConfigValue("fullscreen", "off")
mmSetConfigValue("vsync",      "off")
mmSetConfigValue("useKHRdebug", "off")
mmSetConfigValue("arcball",     "on")