mmCreateView("GraphEntry_1","View3DGL","::view")

mmCreateModule("SimplestSphereRenderer","::mm101::renderer")
mmCreateModule("SphereColoringModule","::mm101::coloring")
mmCreateModule("ASCIISphereLoader","::mm101::dataloader")

mmSetParamValue("::view::backCol",[=[#ffffff]=])
mmSetParamValue("::mm101::coloring::minColor",[=[#ffffff]=])
mmSetParamValue("::mm101::coloring::maxColor",[=[#ff0000]=])
mmSetParamValue("::mm101::dataloader::filename",[=[../examples/megamol101/1m40.csv]=])

mmCreateCall("CallRender3DGL","::view::rendering","::mm101::renderer::rendering")
mmCreateCall("CallSpheres","::mm101::renderer::inData","::mm101::coloring::outData")
mmCreateCall("CallSpheres","::mm101::coloring::inData","::mm101::dataloader::getdata")
