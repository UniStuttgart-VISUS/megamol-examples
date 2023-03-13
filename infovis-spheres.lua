mmCreateView("GraphEntry_1","SplitViewGL","::SplitViewGL_1")

mmCreateModule("SplitViewGL","::SplitViewGL_2")
mmCreateModule("SplitViewGL","::SplitViewGL_3")
mmCreateModule("View3DGL","::View3DGL_1")
mmCreateModule("View2DGL","::View2DGL_1")
mmCreateModule("View2DGL","::View2DGL_2")
mmCreateModule("View2DGL","::View2DGL_3")
mmCreateModule("SphereRenderer","::SphereRenderer_1")
mmCreateModule("TableToParticles","::TableToParticles_1")
mmCreateModule("TransferFunctionGL","::TransferFunctionGL_1")
mmCreateModule("DistantLight","::DistantLight_1")
mmCreateModule("ParallelCoordinatesRenderer2D","::ParallelCoordinatesRenderer2D_1")
mmCreateModule("ScatterplotMatrixRenderer2D","::ScatterplotMatrixRenderer2D_1")
mmCreateModule("TableHistogramRenderer2D","::TableHistogramRenderer2D_1")
mmCreateModule("CSVDataSource","::CSVDataSource_1")
mmCreateModule("TransferFunctionGL","::TransferFunctionGL_2")
mmCreateModule("UniFlagStorageGL","::UniFlagStorageGL_1")

mmCreateCall("CallRenderViewGL","::SplitViewGL_1::render1","::SplitViewGL_2::render")
mmCreateCall("CallRenderViewGL","::SplitViewGL_1::render2","::SplitViewGL_3::render")
mmCreateCall("CallRenderViewGL","::SplitViewGL_2::render1","::View3DGL_1::render")
mmCreateCall("CallRenderViewGL","::SplitViewGL_2::render2","::View2DGL_1::render")
mmCreateCall("CallRenderViewGL","::SplitViewGL_3::render1","::View2DGL_2::render")
mmCreateCall("CallRenderViewGL","::SplitViewGL_3::render2","::View2DGL_3::render")
mmCreateCall("CallRender3DGL","::View3DGL_1::rendering","::SphereRenderer_1::rendering")
mmCreateCall("CallRender2DGL","::View2DGL_1::rendering","::ParallelCoordinatesRenderer2D_1::rendering")
mmCreateCall("CallRender2DGL","::View2DGL_2::rendering","::ScatterplotMatrixRenderer2D_1::rendering")
mmCreateCall("CallRender2DGL","::View2DGL_3::rendering","::TableHistogramRenderer2D_1::rendering")
mmCreateCall("MultiParticleDataCall","::SphereRenderer_1::getdata","::TableToParticles_1::multidata")
mmCreateCall("CallGetTransferFunctionGL","::SphereRenderer_1::gettransferfunction","::TransferFunctionGL_1::gettransferfunction")
mmCreateCall("CallLight","::SphereRenderer_1::lights","::DistantLight_1::deployLightSlot")
mmCreateCall("FlagCallRead_GL","::SphereRenderer_1::readFlags","::UniFlagStorageGL_1::readFlags")
mmCreateCall("TableDataCall","::TableToParticles_1::floattable","::CSVDataSource_1::getData")
mmCreateCall("TableDataCall","::ParallelCoordinatesRenderer2D_1::getData","::CSVDataSource_1::getData")
mmCreateCall("CallGetTransferFunctionGL","::ParallelCoordinatesRenderer2D_1::getTransferFunction","::TransferFunctionGL_2::gettransferfunction")
mmCreateCall("FlagCallRead_GL","::ParallelCoordinatesRenderer2D_1::readFlagStorage","::UniFlagStorageGL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::ParallelCoordinatesRenderer2D_1::writeFlagStorage","::UniFlagStorageGL_1::writeFlags")
mmCreateCall("TableDataCall","::ScatterplotMatrixRenderer2D_1::ftIn","::CSVDataSource_1::getData")
mmCreateCall("CallGetTransferFunctionGL","::ScatterplotMatrixRenderer2D_1::tfIn","::TransferFunctionGL_2::gettransferfunction")
mmCreateCall("FlagCallRead_GL","::ScatterplotMatrixRenderer2D_1::readFlags","::UniFlagStorageGL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::ScatterplotMatrixRenderer2D_1::writeFlags","::UniFlagStorageGL_1::writeFlags")
mmCreateCall("CallGetTransferFunctionGL","::TableHistogramRenderer2D_1::getTransferFunction","::TransferFunctionGL_2::gettransferfunction")
mmCreateCall("TableDataCall","::TableHistogramRenderer2D_1::getData","::CSVDataSource_1::getData")
mmCreateCall("FlagCallRead_GL","::TableHistogramRenderer2D_1::readFlagStorage","::UniFlagStorageGL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::TableHistogramRenderer2D_1::writeFlagStorage","::UniFlagStorageGL_1::writeFlags")

mmSetParamValue("::SplitViewGL_1::split.orientation",[=[Vertical]=])
mmSetParamValue("::TableToParticles_1::intensitycolumnname",[=[species]=])
mmSetParamValue("::TableToParticles_1::colormode",[=[Intensity]=])
mmSetParamValue("::TableToParticles_1::radius",[=[0.100000]=])
mmSetParamValue("::TableToParticles_1::radiusmode",[=[global]=])
mmSetParamValue("::TableToParticles_1::xcolumnname",[=[sepal_length]=])
mmSetParamValue("::TableToParticles_1::ycolumnname",[=[sepal_width]=])
mmSetParamValue("::TableToParticles_1::zcolumnname",[=[petal_length]=])
mmSetParamValue("::CSVDataSource_1::filename",[=[../examples/sampledata/iris.csv]=])
mmSetParamValue("::CSVDataSource_1::colSep",[=[,]=])
mmSetParamValue("::CSVDataSource_1::decSep",[=[US (3.141)]=])
mmSetParamValue("::TransferFunctionGL_1::textureInterpolation",[=[Nearest neighbor]=])
mmSetParamValue("::TransferFunctionGL_1::TransferFunction",[=[{
  "IgnoreProjectRange": false,
  "Interpolation": "LINEAR",
  "Nodes": [
    [0.122, 0.467, 0.706, 1.0, 0.0, 0.05],
    [1.0, 0.498, 0.055, 1.0, 0.5, 0.05],
    [0.173, 0.627, 0.173, 1.0, 1.0, 0.05]
  ],
  "TextureSize": 3,
  "ValueRange": [
    0.0,
    2.0
  ]
}]=])
