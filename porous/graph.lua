mmCheckVersion("bfced0848fa789c3-dirty")
mmCreateView("GraphEntry_2","View2DGL","::View2DGL_1")

mmCreateModule("ImageSeriesLoader","::ImageSeriesLoader_1")
mmCreateModule("ImageSeriesRenderer","::ImageSeriesRenderer_1")
mmCreateModule("ImageSeriesFlowPreprocessor","::ImageSeriesFlowPreprocessor_1")
mmCreateModule("ImageSeriesTimestampFilter","::ImageSeriesTimestampFilter_1")
mmCreateModule("TransferFunctionGL","::TransferFunctionGL_1")
mmCreateModule("ImageSeriesFlowLabeler","::ImageSeriesFlowLabeler_1")
mmCreateModule("ImageSeriesTimestampFilter","::ImageSeriesTimestampFilter_2")

mmCreateCall("CallRender2DGL","::View2DGL_1::rendering","::ImageSeriesRenderer_1::rendering")
mmCreateCall("ImageSeries2DCall","::ImageSeriesRenderer_1::requestImageSeries","::ImageSeriesTimestampFilter_1::getData")
mmCreateCall("GraphData2DCall","::ImageSeriesRenderer_1::requestGraph","::ImageSeriesFlowLabeler_1::getGraph")
mmCreateCall("CallGetTransferFunctionGL","::ImageSeriesRenderer_1::requestTransferFunction","::TransferFunctionGL_1::gettransferfunction")
mmCreateCall("ImageSeries2DCall","::ImageSeriesFlowPreprocessor_1::requestInputImageSeries","::ImageSeriesLoader_1::getData")
mmCreateCall("ImageSeries2DCall","::ImageSeriesTimestampFilter_1::requestInputImageSeries","::ImageSeriesFlowPreprocessor_1::getData")
mmCreateCall("ImageSeries2DCall","::ImageSeriesFlowLabeler_1::requestTimeMapImageSeries","::ImageSeriesTimestampFilter_2::getData")
mmCreateCall("ImageSeries2DCall","::ImageSeriesTimestampFilter_2::requestInputImageSeries","::ImageSeriesFlowPreprocessor_1::getData")

mmSetParamValue("::View2DGL_1::multicam::overrideSettings",[=[false]=])
mmSetParamValue("::View2DGL_1::multicam::autoSaveSettings",[=[false]=])
mmSetParamValue("::View2DGL_1::multicam::autoLoadSettings",[=[true]=])
mmSetParamValue("::View2DGL_1::resetViewOnBBoxChange",[=[false]=])
mmSetParamValue("::View2DGL_1::showLookAt",[=[false]=])
mmSetParamValue("::View2DGL_1::view::showViewCube",[=[false]=])
mmSetParamValue("::View2DGL_1::anim::play",[=[false]=])
mmSetParamValue("::View2DGL_1::anim::speed",[=[0.010000]=])
mmSetParamValue("::View2DGL_1::anim::time",[=[0.313460]=])
mmSetParamValue("::View2DGL_1::backCol",[=[#000020]=])
mmSetParamValue("::ImageSeriesLoader_1::Filename pattern",[=[\.png]=])
mmSetParamValue("::ImageSeriesRenderer_1::Display Mode",[=[TF category lookup (word)]=])
mmSetParamValue("::ImageSeriesRenderer_1::Render Graph",[=[true]=])
mmSetParamValue("::ImageSeriesRenderer_1::graph::Node radius",[=[7.000000]=])
mmSetParamValue("::ImageSeriesRenderer_1::graph::Edge width",[=[5.000000]=])
mmSetParamValue("::ImageSeriesRenderer_1::highlight::Highlight color",[=[#d92b2b]=])
mmSetParamValue("::ImageSeriesRenderer_1::output::Save automatically",[=[false]=])
mmSetParamValue("::ImageSeriesRenderer_1::output::Image output path",[=[]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Mask frame",[=[0.000000]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Deinterlace",[=[0]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Enable segmentation",[=[true]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Segmentation threshold",[=[0.500000]=])
mmSetParamValue("::ImageSeriesFlowPreprocessor_1::Segmentation negation",[=[false]=])
mmSetParamValue("::ImageSeriesTimestampFilter_1::Denoise iterations",[=[0]=])
mmSetParamValue("::ImageSeriesTimestampFilter_1::Denoise threshold",[=[100]=])
mmSetParamValue("::TransferFunctionGL_1::textureInterpolation",[=[Nearest neighbor]=])
mmSetParamValue("::TransferFunctionGL_1::TransferFunction",[=[{
  "IgnoreProjectRange": true,
  "Interpolation": "LINEAR",
  "Nodes": [
    [
      0.26700401306152344,
      0.004873999860137701,
      0.3294149935245514,
      1.0,
      0.0,
      0.05000000074505806
    ],
    [
      0.12814849615097046,
      0.565106987953186,
      0.5508924722671509,
      1.0,
      0.5,
      0.05000000074505806
    ],
    [
      0.9932479858398438,
      0.9061570167541504,
      0.14393599331378937,
      1.0,
      1.0,
      0.05000000074505806
    ]
  ],
  "TextureSize": 8,
  "ValueRange": [
    158.0,
    9083.0
  ]
}]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::Inflow area",[=[right]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::Inflow margin",[=[5]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::Velocity calculation",[=[Centers of mass]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::Image output",[=[After graph simplification]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::fixes::Remove isolated nodes",[=[true]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::fixes::Remove unexpected sources",[=[true]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::fixes::Remove false sinks",[=[true]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::simplification::Combine trivial nodes",[=[true]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::simplification::Remove trivial nodes",[=[true]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::simplification::Resolve diamond patterns",[=[true]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::simplification::Minimum area",[=[10]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::simplification::Keep breakthrough nodes",[=[true]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::simplification::Keep velocity jumps",[=[false]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::simplification::Velocity jump threshold",[=[10.000000]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::output::Write graphs to file",[=[false]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::output::Write label images to file",[=[false]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::output::Write time image to file",[=[false]=])
mmSetParamValue("::ImageSeriesFlowLabeler_1::output::Path",[=[]=])
mmSetParamValue("::ImageSeriesTimestampFilter_2::Denoise iterations",[=[20]=])
mmSetParamValue("::ImageSeriesTimestampFilter_2::Denoise threshold",[=[100]=])

mmSetParamValue("::View2DGL_1::camstore::settings",[=[{"aspect":1.809613585472107,"direction":[0.0,0.0,-1.0],"far_plane":100.0,"frustrum_height":1045.0,"image_plane_tile_end":[1.0,1.0],"image_plane_tile_start":[0.0,0.0],"near_plane":0.10000000149011612,"position":[664.5,522.5,1.0],"projection_type":1,"right":[0.0,4.6650311560135914e+21,4.590373509435236e-41],"up":[0.0,1.0,0.0]}]=])
mmSetParamValue("::ImageSeriesLoader_1::Path",[=[../examples/sampledata/porous]=])
