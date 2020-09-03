mmCreateView("configurator","GUIView","::gui") --confPos={X=32,Y=48} 

mmCreateModule("SplitView","::SplitView_1") --confPos={X=304,Y=48} 
mmCreateModule("View2D","::View2D_1") --confPos={X=576,Y=48} 
mmCreateModule("View2D","::View2D_2") --confPos={X=574,Y=143} 
mmCreateModule("ScatterplotMatrixRenderer2D","::ScatterplotMatrixRenderer2D_1") --confPos={X=833,Y=48} 
mmCreateModule("ParallelCoordinatesRenderer2D","::ParallelCoordinatesRenderer2D_1") --confPos={X=833,Y=205} 
mmCreateModule("CSVDataSource","::CSVDataSource_1") --confPos={X=1485,Y=76} 
mmCreateModule("TransferFunction","::TransferFunction_1") --confPos={X=1433,Y=354} 
mmCreateModule("FlagStorage_GL","::FlagStorage_GL_1") --confPos={X=1435.5,Y=439} 

mmCreateCall("CallRenderView","::gui::renderview","::SplitView_1::render")
mmCreateCall("CallRenderView","::SplitView_1::render1","::View2D_1::render")
mmCreateCall("CallRenderView","::SplitView_1::render2","::View2D_2::render")
mmCreateCall("CallRender2D","::View2D_1::rendering","::ScatterplotMatrixRenderer2D_1::rendering")
mmCreateCall("CallRender2D","::View2D_2::rendering","::ParallelCoordinatesRenderer2D_1::rendering")
mmCreateCall("TableDataCall","::ScatterplotMatrixRenderer2D_1::ftIn","::CSVDataSource_1::getData")
mmCreateCall("CallGetTransferFunction","::ScatterplotMatrixRenderer2D_1::tfIn","::TransferFunction_1::gettransferfunction")
mmCreateCall("FlagCallRead_GL","::ScatterplotMatrixRenderer2D_1::readFlags","::FlagStorage_GL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::ScatterplotMatrixRenderer2D_1::writeFlags","::FlagStorage_GL_1::writeFlags")
mmCreateCall("TableDataCall","::ParallelCoordinatesRenderer2D_1::getdata","::CSVDataSource_1::getData")
mmCreateCall("CallGetTransferFunction","::ParallelCoordinatesRenderer2D_1::getTF","::TransferFunction_1::gettransferfunction")
mmCreateCall("FlagCallRead_GL","::ParallelCoordinatesRenderer2D_1::readFlags","::FlagStorage_GL_1::readFlags")
mmCreateCall("FlagCallWrite_GL","::ParallelCoordinatesRenderer2D_1::writeFlags","::FlagStorage_GL_1::writeFlags")

mmSetParamValue("::CSVDataSource_1::filename",[=[../examples/sampledata/iris.csv]=])
mmSetParamValue("::CSVDataSource_1::colSep",[=[,]=])
mmSetParamValue("::CSVDataSource_1::decSep",[=[US (3.141)]=])

