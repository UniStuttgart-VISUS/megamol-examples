mmCreateView("testspheres", "View3D_2","::view")

mmCreateModule("BoundingBoxRenderer","::bbox")
mmCreateModule("DistantLight","::distantlight")
mmCreateModule("SphereRenderer","::renderer")
mmCreateModule("TestSpheresDataSource", "::data")

mmSetParamValue("::renderer::renderMode", "Simple")

mmCreateCall("CallRender3D_2", "::view::rendering", "::bbox::rendering")
mmCreateCall("CallRender3D_2","::bbox::chainRendering","::renderer::rendering")
mmCreateCall("MultiParticleDataCall", "::renderer::getData", "::data::getData")
mmCreateCall("CallLight","::renderer::lights","::distantlight::deployLightSlot")