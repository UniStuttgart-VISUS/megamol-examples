--[[ 

Use this command line arguments to start MegaMol
  -p "path/to/projects/raycast_volume_renderer.lua"

 --]]

mmCreateView("RaycastVolumeExample", "View3DGL", "::RaycastVolumeExample::View3DGL1")

mmCreateModule("BoundingBoxRenderer", "::RaycastVolumeExample::BoundingBoxRenderer1")

mmCreateModule("RaycastVolumeRenderer", "::RaycastVolumeExample::RaycastVolumeRenderer1")
mmSetParamValue("::RaycastVolumeExample::RaycastVolumeRenderer1::ray step ratio", "0.1")

mmCreateModule("TransferFunction", "::RaycastVolumeExample::TransferFunction1")
mmSetParamValue("::RaycastVolumeExample::TransferFunction1::TransferFunction", "{\"Interpolation\":\"LINEAR\",\"Nodes\":[[0.0,0.0,0.0,0.0,0.0,0.05000000074505806],[0.14127187430858612,0.5980616211891174,0.1649588644504547,0.07333332300186157,0.18036529421806335,0.05000000074505806],[0.45831984281539917,0.21742291748523712,0.1543489694595337,0.3399999737739563,0.3076712191104889,0.05000000074505806],[0.6666666269302368,0.6666666269302368,0.6666666269302368,0.40666669607162476,0.5452054738998413,0.05000000074505806],[1.0,1.0,1.0,1.0,1.0,0.05000000074505806]],\"TextureSize\":256,\"ValueRange\":[0.0,0.004999999888241291]}")
--mmSetParamValue("::RaycastVolumeExample::TransferFunction1::TransferFunction", "{\"Interpolation\":\"LINEAR\",\"Nodes\":[[0.0,0.0,0.0,0.0,0.0,0.05000000074505806],[0.1871422976255417,0.44196945428848267,0.1871422976255417,0.04666668176651001,0.04383561760187149,0.05000000074505806],[0.4599999785423279,0.4599999785423279,0.4599999785423279,0.0,0.10593607276678085,0.05000000074505806],[0.9830052256584167,0.35138729214668274,0.0,0.07333332300186157,0.12054794281721115,0.05000000074505806],[0.7066667079925537,0.7066667079925537,0.2200000286102295,0.006666660308837891,0.1716894954442978,0.05000000074505806],[0.2060917615890503,0.09041378647089005,0.02260233834385872,0.7266666889190674,0.30319634079933167,0.05000000074505806],[0.6332679986953735,0.2232181876897812,0.0506548248231411,0.9799998998641968,0.774429202079773,0.05000000074505806],[1.0,1.0,1.0,1.0,1.0,0.05000000074505806]],\"TextureSize\":256,\"ValueRange\":[0.0,0.004999999888241291]}")

mmCreateModule("VolumetricDataSource", "::RaycastVolumeExample::VolumetricDataSource1")
mmSetParamValue("::RaycastVolumeExample::VolumetricDataSource1::FileName", "../examples/sampledata/bonsai.dat")

mmCreateModule("ScreenShooter", "::RaycastVolumeExample::ScreenShooter1")
mmSetParamValue("::RaycastVolumeExample::ScreenShooter1::view", "::RaycastVolumeExample::View3DGL1")
mmSetParamValue("::RaycastVolumeExample::ScreenShooter1::imgWidth", "1920")
mmSetParamValue("::RaycastVolumeExample::ScreenShooter1::imgHeight", "1080")
mmSetParamValue("::RaycastVolumeExample::ScreenShooter1::tileWidth", "1920")
mmSetParamValue("::RaycastVolumeExample::ScreenShooter1::tileHeight", "1080")
mmSetParamValue("::RaycastVolumeExample::ScreenShooter1::filename", "RaycastVolumeRenderer.png")

mmCreateCall("CallGetTransferFunction", "::RaycastVolumeExample::RaycastVolumeRenderer1::getTranfserFunction", "::RaycastVolumeExample::TransferFunction1::gettransferfunction")
mmCreateCall("VolumetricDataCall", "::RaycastVolumeExample::RaycastVolumeRenderer1::getData", "::RaycastVolumeExample::VolumetricDataSource1::GetData")
mmCreateCall("CallRender3DGL", "::RaycastVolumeExample::View3DGL1::rendering", "::RaycastVolumeExample::BoundingBoxRenderer1::rendering")
mmCreateCall("CallRender3DGL", "::RaycastVolumeExample::BoundingBoxRenderer1::chainRendering", "::RaycastVolumeExample::RaycastVolumeRenderer1::rendering")
