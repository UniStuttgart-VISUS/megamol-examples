mmCreateView("testspheres", "GUIView", "::gui")

mmCreateModule("View3DGL","::view")
mmCreateModule("BoundingBoxRenderer","::bbox")
mmCreateModule("DistantLight","::distantlight")
mmCreateModule("SphereRenderer","::renderer")
mmCreateModule("TestSpheresDataSource", "::data")

mmSetParamValue("::renderer::renderMode", [=[Simple]=])

mmCreateCall("CallRenderViewGL", "::gui::renderview", "::view::render")
mmCreateCall("CallRender3DGL", "::view::rendering", "::bbox::rendering")
mmCreateCall("CallRender3DGL","::bbox::chainRendering","::renderer::rendering")
mmCreateCall("MultiParticleDataCall", "::renderer::getData", "::data::getData")
mmCreateCall("CallLight","::renderer::lights","::distantlight::deployLightSlot")
