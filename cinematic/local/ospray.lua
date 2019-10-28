--- OSPRAY ---

dataFile = "cinematic_data.mmpld"

mmCreateView("ospray", "View3D_2", "::v3d")

mmCreateModule("OSPRayRenderer", "::osprayr")
mmSetParamValue("::osprayr::accumulate",                  "true")    -- Adaptive sampling
mmSetParamValue("::osprayr::SamplesPerPixel",             "0")
mmSetParamValue("::osprayr::Type",                        "0")       -- 0 = SciVis | 1 = PathTracer 
mmSetParamValue("::osprayr::device",                      "default") -- or "mpi_distributed" (-> EFEFCT?)

mmCreateModule("OSPRaySphereGeometry", "::OSPRaySphereGeometry1")

mmCreateModule("MMPLDDataSource", "::MMPLDDataSource1")
mmSetParamValue("::MMPLDDataSource1::filename", dataFile)

mmCreateModule("OSPRayOBJMaterial", "::OSPRayOBJMaterial1")
mmSetParamValue("::OSPRayOBJMaterial1::DiffuseColor",     "1.000000;1.000000;1.000000")
mmSetParamValue("::OSPRayOBJMaterial1::SpecularColor",    "1.000000;1.000000;1.000000")
mmSetParamValue("::OSPRayOBJMaterial1::Shininess",        "10")

mmCreateModule("AmbientLight", "::AmbientLight1")
mmSetParamValue("::AmbientLight1::Intensity",             "2")
mmSetParamValue("::AmbientLight1::Color",                 "Colour(0.000000;0.000000;1.000000;1.000000)")

mmCreateModule("DistantLight", "::DistantLight1")
mmSetParamValue("::DistantLight1::Intensity",             "2")
mmSetParamValue("::DistantLight1::Color",                 "Colour(0.500000;1.000000;1.000000;1.000000)")
mmSetParamValue("::DistantLight1::Direction",             "1.000000;-1.000000;0.000000")
mmSetParamValue("::DistantLight1::AngularDiameter",       "50")

mmCreateModule("DistantLight", "::DistantLight2")
mmSetParamValue("::DistantLight2::Intensity",             "2")
mmSetParamValue("::DistantLight2::Color",                 "Colour(1.000000;0.500000;1.000000;1.000000)")
mmSetParamValue("::DistantLight2::Direction",             "-1.000000;1.000000;1.000000")
mmSetParamValue("::DistantLight2::AngularDiameter",       "30")

mmCreateModule("PointLight", "::PointLight1")
mmSetParamValue("::PointLight1::Intensity",               "20000")
mmSetParamValue("::PointLight1::Color",                   "Colour(0.500000;1.000000;0.500000;1.000000)")
mmSetParamValue("::PointLight1::Position",                "0.000000;0.000000;0.000000")
mmSetParamValue("::PointLight1::Radius",                  "0")

mmCreateCall("CallRender3D_2",        "::v3d::rendering",                         "::osprayr::rendering")
mmCreateCall("CallLight",             "::DistantLight2::getLightSlot",            "::PointLight1::deployLightSlot")
mmCreateCall("CallOSPRayStructure",   "::osprayr::getStructure",                  "::OSPRaySphereGeometry1::deployStructureSlot")
mmCreateCall("MultiParticleDataCall", "::OSPRaySphereGeometry1::getdata",         "::MMPLDDataSource1::getdata")
mmCreateCall("CallLight",             "::osprayr::lights",                        "::AmbientLight1::deployLightSlot")
mmCreateCall("CallOSPRayMaterial",    "::OSPRaySphereGeometry1::getMaterialSlot", "::OSPRayOBJMaterial1::deployMaterialSlot")
mmCreateCall("CallLight",             "::AmbientLight1::getLightSlot",            "::DistantLight1::deployLightSlot")
mmCreateCall("CallLight",             "::DistantLight1::getLightSlot",            "::DistantLight2::deployLightSlot")
