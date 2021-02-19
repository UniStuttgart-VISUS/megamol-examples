--[[ 

Use this command line arguments to start MegaMol
  -p "path/to/projects/volume_slice_renderer.lua"

 --]]
 
mmCreateView("VolumeSliceExample", "GUIView", "GUIView1")

mmCreateModule("View3DGL", "::VolumeSliceExample::View3DGL1")

mmCreateModule("BoundingBoxRenderer", "::VolumeSliceExample::BoundingBoxRenderer1")

mmCreateModule("VolumeSliceRenderer_2", "::VolumeSliceExample::VolumeSliceRenderer_21")

mmCreateModule("ClipPlane", "::VolumeSliceExample::ClipPlane1")
mmSetParamValue("::VolumeSliceExample::ClipPlane1::enable", "True")
mmSetParamValue("::VolumeSliceExample::ClipPlane1::point", "128.000000;128.000000;128.000000")
mmSetParamValue("::VolumeSliceExample::ClipPlane1::dist", "128")

mmCreateModule("TransferFunction", "::VolumeSliceExample::TransferFunction1")
mmSetParamValue("::VolumeSliceExample::TransferFunction1::TransferFunction", "{\"Interpolation\":\"LINEAR\",\"Nodes\":[[0.0,0.0,0.0,0.0,0.0,0.05000000074505806],[0.14127187430858612,0.5980616211891174,0.1649588644504547,0.07333332300186157,0.18036529421806335,0.05000000074505806],[0.45831984281539917,0.21742291748523712,0.1543489694595337,0.3399999737739563,0.3076712191104889,0.05000000074505806],[0.6666666269302368,0.6666666269302368,0.6666666269302368,0.40666669607162476,0.5452054738998413,0.05000000074505806],[1.0,1.0,1.0,1.0,1.0,0.05000000074505806]],\"TextureSize\":256,\"ValueRange\":[0.0,0.004999999888241291]}")

mmCreateModule("VolumetricDataSource", "::VolumeSliceExample::VolumetricDataSource1")
mmSetParamValue("::VolumeSliceExample::VolumetricDataSource1::FileName", "../examples/sampledata/bonsai.dat")

mmCreateModule("ScreenShooter", "::VolumeSliceExample::ScreenShooter1")
mmSetParamValue("::VolumeSliceExample::ScreenShooter1::view", "::VolumeSliceExample::View3DGL1")
mmSetParamValue("::VolumeSliceExample::ScreenShooter1::imgWidth", "1920")
mmSetParamValue("::VolumeSliceExample::ScreenShooter1::imgHeight", "1080")
mmSetParamValue("::VolumeSliceExample::ScreenShooter1::tileWidth", "1920")
mmSetParamValue("::VolumeSliceExample::ScreenShooter1::tileHeight", "1080")
mmSetParamValue("::VolumeSliceExample::ScreenShooter1::filename", "RaycastVolumeRenderer.png")

mmCreateCall("CallClipPlane", "::VolumeSliceExample::VolumeSliceRenderer_21::getclipplane", "::VolumeSliceExample::ClipPlane1::getclipplane")
mmCreateCall("CallGetTransferFunction", "::VolumeSliceExample::VolumeSliceRenderer_21::gettransferfunction", "::VolumeSliceExample::TransferFunction1::gettransferfunction")
mmCreateCall("CallRenderViewGL", "::VolumeSliceExample::GUIView1::renderview", "::VolumeSliceExample::View3DGL1::render")
mmCreateCall("CallRender3DGL", "::VolumeSliceExample::BoundingBoxRenderer1::chainRendering", "::VolumeSliceExample::VolumeSliceRenderer_21::rendering")
mmCreateCall("CallRender3DGL", "::VolumeSliceExample::View3DGL1::rendering", "::VolumeSliceExample::BoundingBoxRenderer1::rendering")
mmCreateCall("VolumetricDataCall", "::VolumeSliceExample::VolumeSliceRenderer_21::getVol", "::VolumeSliceExample::VolumetricDataSource1::GetData")
