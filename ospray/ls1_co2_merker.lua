mmCreateView("GraphEntry_1","View3DGL","::View3DGL_1")

mmCreateModule("adiosDataSource","::adiosDataSource_1")
mmCreateModule("TransferFunction","::TransferFunction_1")
mmCreateModule("ls1ParticleFormat","::ls1ParticleFormat_1")
mmCreateModule("OSPRayOBJMaterial","::OSPRayOBJMaterial_1")
mmCreateModule("OSPRaySphereGeometry","::OSPRaySphereGeometry_1")
mmCreateModule("AmbientLight","::AmbientLight_1")
mmCreateModule("OSPRayRenderer","::OSPRayRenderer_1")
mmCreateModule("OSPRayToGL","::OSPRayToGL_1")
mmCreateModule("BoundingBoxRenderer","::BoundingBoxRenderer_1")

mmCreateCall("CallRender3DGL","::View3DGL_1::rendering","::BoundingBoxRenderer_1::rendering")
mmCreateCall("CallADIOSData","::ls1ParticleFormat_1::adiosSlot","::adiosDataSource_1::getdata")
mmCreateCall("CallGetTransferFunction","::ls1ParticleFormat_1::transferfunctionSlot","::TransferFunction_1::gettransferfunction")
mmCreateCall("CallOSPRayMaterial","::OSPRaySphereGeometry_1::getMaterialSlot","::OSPRayOBJMaterial_1::deployMaterialSlot")
mmCreateCall("MultiParticleDataCall","::OSPRaySphereGeometry_1::getdata","::ls1ParticleFormat_1::mpSlot")
mmCreateCall("CallLight","::OSPRayRenderer_1::lights","::AmbientLight_1::deployLightSlot")
mmCreateCall("CallOSPRayStructure","::OSPRayRenderer_1::getStructure","::OSPRaySphereGeometry_1::deployStructureSlot")
mmCreateCall("CallRender3D","::OSPRayToGL_1::getContext","::OSPRayRenderer_1::rendering")
mmCreateCall("CallRender3DGL","::BoundingBoxRenderer_1::chainRendering","::OSPRayToGL_1::rendering")

mmSetParamValue("::adiosDataSource_1::filename",[=[../examples/sampledata/co2_merkers_checkpoint.bp]=])
mmSetParamValue("::ls1ParticleFormat_1::representation",[=[Atoms]=])
mmSetParamValue("::TransferFunction_1::TransferFunction",[=[{"IgnoreProjectRange": true,
"Interpolation": "LINEAR",
"Nodes": [
[
9.999022586271167e-05,
9.998999303206801e-05,
9.999999747378752e-05,
1.0,
0.0,
0.05000000074505806
],
[
1.0,
0.024479985237121582,
0.0,
1.0,
0.46427497267723083,
0.05000000074505806
],
[
1.0,
0.023868262767791748,
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
