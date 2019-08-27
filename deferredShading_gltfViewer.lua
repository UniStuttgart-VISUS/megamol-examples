--[[ generated by MegaMol Configurator 1.3.0.0 --]]

--[[ 

Use this command line arguments to start MegaMol
in Cmd:
  -p "C:\temp\megamol\examples\deferredShading_gltfViewer.lua" -i Project_1 inst
in PowerShell:
  -p "C:\temp\megamol\examples\deferredShading_gltfViewer.lua" -i Project_1 inst

 --]]

mmCreateView("Project_1", "GUIView", "GUIView1")
mmCreateModule("DeferredShading", "::Project_1::DeferredShading1")
mmSetParamValue("::Project_1::DeferredShading1::BTF filename", "dfrLambert")
mmCreateModule("View3D_2", "::Project_1::View3D_21")
mmCreateModule("RenderMDIMesh", "::Project_1::RenderMDIMesh1")
mmCreateModule("GlTFRenderTasksDataSource", "::Project_1::GlTFRenderTasksDataSource1")
mmCreateModule("SimpleGPUMtlDataSource", "::Project_1::SimpleGPUMtlDataSource1")
mmSetParamValue("::Project_1::SimpleGPUMtlDataSource1::BTF filename", "dfr_gltfExample")
mmCreateModule("GlTFMeshesDataSource", "::Project_1::GlTFMeshesDataSource1")
mmCreateModule("GlTFFileLoader", "::Project_1::GlTFFileLoader1")
mmSetParamValue("::Project_1::GlTFFileLoader1::glTF filename", "../examples/mesh/WaterBottle/glTF/WaterBottle.gltf")
mmCreateModule("PointLight", "::Project_1::PointLight1")
mmSetParamValue("::Project_1::PointLight1::Intensity", "2")
mmSetParamValue("::Project_1::PointLight1::Position", "5.000000;5.000000;5.000000")
mmCreateModule("BoundingBoxRenderer", "::Project_1::BoundingBoxRenderer1")
mmCreateModule("PointLight", "::Project_1::PointLight2")
mmSetParamValue("::Project_1::PointLight2::Intensity", "2")
mmSetParamValue("::Project_1::PointLight2::Position", "-5.000000;5.000000;5.000000")
mmCreateCall("CallRenderView", "::Project_1::GUIView1::renderview", "::Project_1::View3D_21::render")
mmCreateCall("CallRender3D_2", "::Project_1::DeferredShading1::chainRendering", "::Project_1::RenderMDIMesh1::rendering")
mmCreateCall("CallGPURenderTaskData", "::Project_1::RenderMDIMesh1::getRenderTaskData", "::Project_1::GlTFRenderTasksDataSource1::getData")
mmCreateCall("CallGPUMaterialData", "::Project_1::GlTFRenderTasksDataSource1::getMaterialData", "::Project_1::SimpleGPUMtlDataSource1::getData")
mmCreateCall("CallGPUMeshData", "::Project_1::GlTFRenderTasksDataSource1::getMeshData", "::Project_1::GlTFMeshesDataSource1::getData")
mmCreateCall("CallGlTFData", "::Project_1::GlTFRenderTasksDataSource1::getGlTFFile", "::Project_1::GlTFFileLoader1::getData")
mmCreateCall("CallGlTFData", "::Project_1::GlTFMeshesDataSource1::getGlTFFile", "::Project_1::GlTFFileLoader1::getData")
mmCreateCall("CallLight", "::Project_1::DeferredShading1::lights", "::Project_1::PointLight1::deployLightSlot")
mmCreateCall("CallRender3D_2", "::Project_1::View3D_21::rendering", "::Project_1::BoundingBoxRenderer1::rendering")
mmCreateCall("CallRender3D_2", "::Project_1::BoundingBoxRenderer1::chainRendering", "::Project_1::DeferredShading1::rendering")
mmCreateCall("CallLight", "::Project_1::PointLight1::getLightSlot", "::Project_1::PointLight2::deployLightSlot")
