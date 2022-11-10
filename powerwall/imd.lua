chkptFile = "\\\\vestastore\\demos\\megamol-data\\huebsch.chkpt"

mmCreateView("imd_demo", "View3DGL", "::v")

mmCreateModule("IMDAtomData", "::imd_demo::data")
mmSetParamValue("::imd_demo::data::filename", chkptFile)
mmSetParamValue("::imd_demo::data::radius", 2)
mmSetParamValue("::imd_demo::data::colcolumn", "epot")
mmSetParamValue("::imd_demo::data::dir::colcolumn", "epot")

mmCreateModule("TransferFunctionGL", "::imd_demo::tf")
mmCreateModule("DistantLight","::imd_demo::light")
mmSetParamValue("::imd_demo::light::EyeDirection",[=[true]=])

mmCreateModule("GrimRenderer", "::imd_demo::grimspheres")
mmCreateModule("DataGridder", "::imd_demo::grid")
mmCreateCall("CallGetTransferFunctionGL", "::imd_demo::grimspheres::gettransferfunction", "::imd_demo::tf::gettransferfunction")
mmCreateCall("MultiParticleDataCall", "::imd_demo::grid::indata", "::imd_demo::data::getdata")
mmCreateCall("ParticleGridDataCall", "::imd_demo::grimspheres::getdata", "::imd_demo::grid::outdata")
mmCreateCall("CallLight","::imd_demo::grimspheres::lights","::imd_demo::light::deployLightSlot")

mmCreateModule("SphereRenderer", "::imd_demo::spheres")
mmCreateModule("ClipPlane", "::imd_demo::clip")
mmCreateCall("MultiParticleDataCall", "::imd_demo::spheres::getdata", "::imd_demo::data::getdata")
mmCreateCall("CallGetTransferFunctionGL", "::imd_demo::spheres::gettransferfunction", "::imd_demo::tf::gettransferfunction")
mmCreateCall("CallLight","::imd_demo::spheres::lights","::imd_demo::light::deployLightSlot")
mmCreateCall("CallClipPlane", "::imd_demo::spheres::getclipplane", "::imd_demo::clip::getclipplane")

mmSetParamValue("::imd_demo::clip::enable",[=[true]=])
mmSetParamValue("::imd_demo::clip::normal",[=[0;1;0]=])
mmSetParamValue("::imd_demo::clip::point",[=[0;360;0]=])

mmCreateCall("CallRender3DGL", "::v::rendering", "::imd_demo::spheres::rendering")
--mmCreateCall("CallRender3DGL", "::v::rendering", "::imd_demo::spheres::rendering")

mmSetParamValue("::imd_demo::tf::TransferFunction",[=[{
    "IgnoreProjectRange": true,
    "Interpolation": "GAUSS",
    "Nodes": [
      [
        0.2618797719478607,
        0.43978923559188843,
        0.4747214913368225,
        1.0,
        0.003014772664755583,
        0.1889999955892563
      ],
      [
        0.8903744220733643,
        0.6379365921020508,
        0.07314758747816086,
        1.0,
        0.2889806926250458,
        0.19499999284744263
      ],
      [
        1.0,
        0.0,
        0.0,
        1.0,
        1.0,
        0.41499999165534973
      ]
    ],
    "TextureSize": 256,
    "ValueRange": [
      0.0,
      1.0
    ]
  }]=])