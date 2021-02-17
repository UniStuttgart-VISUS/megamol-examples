mmCreateView("Project_2", "View3D_2", "::Project_1::View3D_21")

mmCreateModule("OSPRayRenderer", "::Project_1::OSPRayRenderer1")
mmCreateModule("AmbientLight", "::Project_1::AmbientLight1")
mmCreateModule("OSPRaySphereGeometry", "::Project_1::OSPRaySphereGeometry1")
mmCreateModule("OSPRayOBJMaterial", "::Project_1::OSPRayOBJMaterial1")
mmCreateModule("TestSpheresDataSource", "::Project_1::TestSpheresDataSource1")

mmCreateCall("CallLight", "::Project_1::OSPRayRenderer1::lights", "::Project_1::AmbientLight1::deployLightSlot")
mmCreateCall("CallOSPRayStructure", "::Project_1::OSPRayRenderer1::getStructure", "::Project_1::OSPRaySphereGeometry1::deployStructureSlot")
mmCreateCall("CallRender3D_2", "::Project_1::View3D_21::rendering", "::Project_1::OSPRayRenderer1::rendering")
mmCreateCall("CallOSPRayMaterial", "::Project_1::OSPRaySphereGeometry1::getMaterialSlot", "::Project_1::OSPRayOBJMaterial1::deployMaterialSlot")
mmCreateCall("MultiParticleDataCall", "::Project_1::OSPRaySphereGeometry1::getdata", "::Project_1::TestSpheresDataSource1::getData")

