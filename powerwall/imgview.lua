file = "\\\\vestastore\\Demos\\HR-Bilder\\Mono\\Handgekloeppelt\\Grossgeraeteantrag.png"
 
mmCreateView("img_demo", "View3DGL", "::img_demo::v")
mmSetParamValue("::img_demo::v::backCol",[=[#000000]=])

mmCreateModule("ImageRenderer", "::img_demo::image")
mmSetParamValue("::img_demo::image::leftImg", file)
mmCreateCall("CallRender3DGL", "::img_demo::v::rendering", "::img_demo::image::rendering")
