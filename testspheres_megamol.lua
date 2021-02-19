mmCreateView("testspheres", "View3DGL","::view")

mmCreateModule("BoundingBoxRenderer","::bbox")
mmCreateModule("DistantLight","::distantlight")
mmCreateModule("SphereRenderer","::renderer")
mmCreateModule("TestSpheresDataSource", "::data")

mmSetParamValue("::renderer::renderMode", [=[Simple]=])

mmCreateCall("CallRender3DGL", "::view::rendering", "::bbox::rendering")
mmCreateCall("CallRender3DGL","::bbox::chainRendering","::renderer::rendering")
mmCreateCall("MultiParticleDataCall", "::renderer::getData", "::data::getData")
mmCreateCall("CallLight","::renderer::lights","::distantlight::deployLightSlot")
