mmCreateView("GraphEntry_1","View3D","::View3D_1")

mmCreateModule("OSPRayRenderer","::OSPRayRenderer_1")
mmCreateModule("AmbientLight","::AmbientLight_1")
mmCreateModule("DistantLight","::DistantLight_1")
mmCreateModule("OSPRaySphereGeometry","::OSPRaySphereGeometry_1")
mmCreateModule("OSPRayOBJMaterial","::OSPRayOBJMaterial_1")
mmCreateModule("TestSpheresDataSource","::TestSpheresDataSource_1")

mmCreateCall("CallRender3D","::View3D_1::rendering","::OSPRayRenderer_1::rendering")
mmCreateCall("CallLight","::OSPRayRenderer_1::lights","::AmbientLight_1::deployLightSlot")
mmCreateCall("CallOSPRayStructure","::OSPRayRenderer_1::getStructure","::OSPRaySphereGeometry_1::deployStructureSlot")
mmCreateCall("CallLight","::AmbientLight_1::getLightSlot","::DistantLight_1::deployLightSlot")
mmCreateCall("CallOSPRayMaterial","::OSPRaySphereGeometry_1::getMaterialSlot","::OSPRayOBJMaterial_1::deployMaterialSlot")
mmCreateCall("MultiParticleDataCall","::OSPRaySphereGeometry_1::getdata","::TestSpheresDataSource_1::getData")

mmSetParamValue("::AmbientLight_1::Intensity",[=[0.500000]=])
mmSetParamValue("::DistantLight_1::Intensity",[=[3.000000]=])
