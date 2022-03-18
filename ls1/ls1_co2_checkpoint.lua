mmCreateView("GraphEntry_1","View3DGL","::View3DGL_1") 

mmCreateModule("SphereRenderer","::SphereRenderer_1") 
mmCreateModule("ls1ParticleFormat","::ls1ParticleFormat_1") 
mmCreateModule("adiosDataSource","::adiosDataSource_1") 
mmCreateModule("TransferFunction","::TransferFunction_1") 
mmCreateModule("BoundingBoxRenderer","::BoundingBoxRenderer_1") 

mmCreateCall("CallRender3DGL","::View3DGL_1::rendering","::BoundingBoxRenderer_1::rendering")
mmCreateCall("MultiParticleDataCall","::SphereRenderer_1::getdata","::ls1ParticleFormat_1::mpSlot")
mmCreateCall("CallADIOSData","::ls1ParticleFormat_1::adiosSlot","::adiosDataSource_1::getdata")
mmCreateCall("CallGetTransferFunction","::ls1ParticleFormat_1::transferfunctionSlot","::TransferFunction_1::gettransferfunction")
mmCreateCall("CallRender3DGL","::BoundingBoxRenderer_1::chainRendering","::SphereRenderer_1::rendering")

mmSetParamValue("::SphereRenderer_1::renderMode",[=[Ambient_Occlusion]=])
mmSetParamValue("::ls1ParticleFormat_1::representation",[=[Atoms]=])
mmSetParamValue("::adiosDataSource_1::filename",[=[../examples/sampledata/co2_merkers_checkpoint.bp]=])
mmSetParamValue("::TransferFunction_1::TransferFunction",[=[{
  "IgnoreProjectRange": true,
  "Interpolation": "GAUSS",
  "Nodes": [
    [
      9.999999747378752e-05,
      9.998999303206801e-05,
      9.998999303206801e-05,
      1.0,
      0.0,
      0.05000000074505806
    ],
    [
      1.0,
      0.0,
      0.0,
      0.9941614270210266,
      0.5,
      0.05000000074505806
    ],
    [
      1.0,
      0.0,
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
